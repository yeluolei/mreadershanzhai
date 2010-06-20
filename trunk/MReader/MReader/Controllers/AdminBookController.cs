using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;
using System.IO;
using System.Diagnostics;
using Microsoft.Win32;

namespace MReader.Controllers
{
    public class AdminBookController : Controller
    {
        BookRepository bookdb = new BookRepository();
        CustomerRepository cusdb = new CustomerRepository();
        //string bookPath = "E:\\study\\Programming\\Web\\MReaderIT2 - Copy\\MReader\\MReader\\book\\";
        //
        // GET: /Admin/

        [Authorize(Roles = "admin")]
        public ActionResult Index()
        {
            var books = bookdb.GetAllBooks().ToList();
            return View("Index", books);
        }

        [Authorize(Roles = "admin")]
        public ActionResult SetPopularBook(int id)
        {
            Book book = bookdb.GetBookbyID(id);
            bookdb.SetPopular(book);
            bookdb.save();
            return RedirectToAction("successful");
        }

        [Authorize(Roles = "admin")]
        public ActionResult UnsetPopularBook(int id)
        {
            Book book = bookdb.GetBookbyID(id);
            if (bookdb.IsPopular(book))
            {
                bookdb.UnsetPopular(book);
                bookdb.save();
            }
            return RedirectToAction("successful");
        }
       
        [Authorize(Roles = "admin")]
        public ActionResult NewBook()
        {
            
            return View(new Book());
        }
        
        [Authorize(Roles = "admin")]
        public ActionResult Successful()
        {
            return View();
        }
        
        [Authorize(Roles = "admin")]
        public ActionResult PopularBookList()
        {
            return View(bookdb.GetAllPopBooks().ToList());
        }


        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "admin")]
        public ActionResult NewBook ( Book book2 )
        {
            Book book = new Book();

            try
            {
                UpdateModel(book);
                if (!book.IsValid) throw new Exception();
            }
            catch   
            {
                foreach (var issue in book.GetRuleViolations())
                {
                    ModelState.AddModelError(issue.PropertyName, issue.ErrorMessage);
                }
                return View(book);
            }

            if (Request.Files.Count == 0)
            {
                ModelState.AddModelError("Upload", "Path required");
                return View(book);
            }

            //generate the content with Guid
            Guid guidforBook = Guid.NewGuid();
            book.Guid = guidforBook;

            book.Content = "/book/" + book.Guid.ToString() + "/" + Request.Form["regularExpression"] + ".png";

            //check if the file exist and then deccompress it
            var c = Request.Files[0];
            string fileName;
            if (c != null && c.ContentLength > 0)
            {
                int lastSlashIndex = c.FileName.LastIndexOf("\\");
                fileName = c.FileName.Substring(lastSlashIndex + 1, c.FileName.Length - lastSlashIndex - 1);

                fileName = Server.MapPath("/book/") + fileName;
                c.SaveAs(fileName);

                decompress((Server.MapPath("/book/") + book.Guid.ToString() + "_temp" + "\\"), fileName);
                try
                {
                    System.IO.File.Delete(fileName);
                }
                catch
                {
                }
            }

            //check the file to make sure correctness
            if (!CheckFile((Server.MapPath("/book/") + book.Guid.ToString() + "_temp" + "\\"), book.TotalPages, Request.Form["regularExpression"]))
            {
                System.IO.Directory.Delete(Server.MapPath("/book/") + book.Guid.ToString() + "_temp" + "\\",true);
                HandleErrorInfo err = new HandleErrorInfo(new Exception("Please specify correct file name pattern in that <b>regular expression</b> box"), "Admin", "NewBook");
                return View("error", err);
            }
            else
            {
                System.IO.Directory.Move((Server.MapPath("/book/") + book.Guid.ToString() + "_temp" + "\\"), (Server.MapPath("/book/") + book.Guid.ToString() + "\\"));
            }

            //save the change
            bookdb.NewBook(book);
            bookdb.save();

            return View("success");
        }

        [Authorize( Roles = "admin" )]
        public ActionResult DeleteBook( int id )
        {
            Book book = bookdb.GetBookbyID(id);
            if (book.Title.ToLower() == "null")
                return View("NotFound");
            return View(book);
        }

        [Authorize(Roles = "admin")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteBook(int id, string confirmButton)
        {
            Book book = bookdb.GetBookbyID(id);
            
            if (book.Title.ToLower() == "null")
            {
                return View("NotFound");
            }
            else
            {
                bookdb.DeleteBook(book);
                cusdb.DeleteBook(book);
                
                //delete the corresponding file
                int lastIndex = book.Content.LastIndexOf("/");
                string tempPath = book.Content.Substring(0, lastIndex);
                try
                {
                    System.IO.Directory.Delete(Server.MapPath(tempPath), true);
                }
                catch
                {
                    //TODO: handle this error
                }

                //save the change
                bookdb.save();
                cusdb.Save();
                return View("success");
            } 
        }

        [Authorize(Roles = "admin")]
        public ActionResult UploadBook()
        {
            return View();
        }

        [Authorize(Roles = "admin")]
        public ActionResult ViewBookInfo(int id)
        {
            Book book = bookdb.GetBookbyID(id);
            if (book == null)
            {
                return View();
            }
            return View(book);
        }

        // 
        // EditBook:GET
        [Authorize(Roles = "admin")]
        public ActionResult EditBook(int id)
        {
            Book book = bookdb.GetBookbyID(id);
            return View(book);
        }

        //
        // EditBook:POST
        [Authorize(Roles = "admin"), AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditBook(int id, FormCollection collection)
        {
            Book book = bookdb.GetBookbyID(id);
            try
            {
                UpdateModel(book);
                bookdb.save();
                return RedirectToAction("ViewBookInfo", new { id = book.ID });
            }
            catch
            {
                foreach (var rv in book.GetRuleViolations())
                {
                    ModelState.AddModelError(rv.PropertyName,rv.ErrorMessage);
                }
                ModelState.AddModelError("","Please make sure all fields are valid.");



                return View("EditBook",book);
            }
        }



        private void decompress(string unRarPatch, string rarPatch)
        {
            System.Diagnostics.Process proc = new Process();
            proc.StartInfo.FileName = "Rar.exe";
            proc.StartInfo.Arguments = "e \"" + rarPatch + "\" \"" + unRarPatch + "\"";

            proc.StartInfo.CreateNoWindow = false;
            proc.StartInfo.UseShellExecute = true;
            proc.StartInfo.RedirectStandardOutput = false;

            proc.Start();
            proc.WaitForExit();
        }

        private bool CheckFile( string location, int totalPageNum, string regularExpression)
        {
            for (int i = 1; i <= totalPageNum; ++i)
            {
                string path = location + string.Format(regularExpression, i)+".png";
                if (!System.IO.File.Exists(path))
                {
                    
                    return false;
                }
            }
            return true;
        }
        
    }
}
