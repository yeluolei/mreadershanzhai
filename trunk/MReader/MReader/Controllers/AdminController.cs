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

        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult NewBook()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
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
            var c = Request.Files[0];
            if (c != null && c.ContentLength > 0)
            {
                int lastSlashIndex = c.FileName.LastIndexOf("\\");
                string fileName = c.FileName.Substring(lastSlashIndex + 1, c.FileName.Length - lastSlashIndex - 1);
                //fileName = Path.Combine(CommonUtility.DocImagePath, fileName);
                fileName = bookPath + fileName; 
                c.SaveAs(fileName);
            }
               //return View();
            book.Content = "/book/" + book.Title + "/"; 
            db.NewBook(book);
            db.save();

            return View("success");
        }

        [Authorize]
        public ActionResult DeleteBook( int id )
        {
            Book book = db.GetBookbyID(id);
            if (book == null)
                return View("NotFound");
            else
            {
                db.DeleteBook(book);
                db.save();
                return View(book);
            }
                
        }

        [Authorize]
        public ActionResult UploadBook()
        {
            return View();
        }

        public void unrar() {
            decompress("/book/as", "/book/logo.rar", "23");
        }
        private void decompress(string unRarPatch, string rarPatch, string rarName)
        {
            System.Diagnostics.Process proc = new Process();
            proc.StartInfo.FileName = "Rar.exe";
            proc.StartInfo.Arguments = "e E:\\logo.rar \""+ Server.MapPath("/book")+"\"";

            proc.StartInfo.CreateNoWindow = true;
            proc.StartInfo.UseShellExecute = false;
            proc.StartInfo.RedirectStandardOutput = true;

            proc.Start();
            proc.WaitForExit(); 
        }
    }
}
