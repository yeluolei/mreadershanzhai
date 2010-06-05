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
    public class AdminController : Controller
    {
        BookRepository db = new BookRepository();

        string bookPath = "E:\\study\\Programming\\Web\\MReaderIT2 - Copy\\MReader\\MReader\\book\\";
        //
        // GET: /Admin/

        [Authorize(Roles = "admin")]
        public ActionResult Index()
        {
            var books = db.GetAllBooks().ToList();
            return View("Index", books);
        }

        [Authorize(Roles = "admin")]
        public ActionResult NewBook()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "admin")]
        public ActionResult NewBook ( Book book2 )
        {
            Book book = new Book();

            try
            {
                UpdateModel(book);
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
            if (c != null && c.ContentLength > 0)
            {
                int lastSlashIndex = c.FileName.LastIndexOf("\\");
                string fileName = c.FileName.Substring(lastSlashIndex + 1, c.FileName.Length - lastSlashIndex - 1);

                fileName = Server.MapPath("/book/") + fileName;
                c.SaveAs(fileName);

                decompress((Server.MapPath("/book/") + book.Guid.ToString() + "_temp" + "\\"), fileName);
            }

            //check the file to make sure correctness
            if (!CheckFile((Server.MapPath("/book/") + book.Guid.ToString() + "_temp" + "\\"), book.TotalPages, Request.Form["regularExpression"]))
            {
                System.IO.Directory.Delete(Server.MapPath("/book/") + book.Guid.ToString() + "_temp" + "\\",true);
                HandleErrorInfo err = new HandleErrorInfo(new Exception("Someting is wrong in the file"), "Admin", "NewBook");
                return View("error", err);
            }
            else
            {
                System.IO.Directory.Move((Server.MapPath("/book/") + book.Guid.ToString() + "_temp" + "\\"), (Server.MapPath("/book/") + book.Guid.ToString() + "\\"));
            }

            //save the change
            db.NewBook(book);
            db.save();
            return View("success");
        }

        [Authorize( Roles = "admin" )]
        public ActionResult DeleteBook( int id )
        {
            Book book = db.GetBookbyID(id);
            if (book == null)
                return View("NotFound");
            return View(book);
        }

        [Authorize(Roles = "admin")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteBook(int id, string confirmButton)
        {
            Book book = db.GetBookbyID(id);
            
            if (book == null)
            {
                return View("NotFound");
            }
            else
            {
                db.DeleteBook(book);

                //delete the corresponding file
                int lastIndex = book.Content.LastIndexOf("/");
                string tempPath = book.Content.Substring(0, lastIndex);
                System.IO.Directory.Delete(Server.MapPath(tempPath), true);

                //save the change
                db.save();
                return View("success");
            } 
        }

        [Authorize(Roles = "admin")]
        public ActionResult UploadBook()
        {
            return View();
        }

        public ActionResult ViewBook(int id)
        {
            Book book = db.GetBookbyID(id);
            if (book == null)
            {
                return View();
            }
            return View(book);
        }

        public ActionResult EditBook(int id)
        {
            Book book = db.GetBookbyID(id);
            return View(book);
        }

        //public void unrar() {
        //    decompress("/book/as", "/book/logo.rar", "23");
        //}
        private void decompress(string unRarPatch, string rarPatch)
        {
            System.Diagnostics.Process proc = new Process();
            proc.StartInfo.FileName = "Rar.exe";
            proc.StartInfo.Arguments = "e \"" + rarPatch + "\" \"" + unRarPatch + "\"";

            proc.StartInfo.CreateNoWindow = true;
            proc.StartInfo.UseShellExecute = false;
            proc.StartInfo.RedirectStandardOutput = true;

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
