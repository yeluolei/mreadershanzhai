using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;

namespace MReader.Controllers
{
    public class BookInfoController : Controller
    {
        BookRepository bookDb = new BookRepository();

        //
        // GET: /BookInfo
        [Authorize]
        public ActionResult Index(int? ID,int? page)
        {
            Book book = bookDb.GetBookbyID(ID??26);
            BookInfoFormModel bookInfo = new BookInfoFormModel(book , page??0);
            return View(bookInfo);
        }

        //
        // POST: /BookInfo
        [Authorize, AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(int id,int PageIndex,String RemarkContent)
        {
            Book book = bookDb.GetBookbyID(id);
            Remark remark = new Remark();
             
            remark.RemarkTime = DateTime.Now;
            remark.RemarkUserName = User.Identity.Name;
            remark.RemarkContent = RemarkContent;
            book.Remarks.Add(remark);
            bookDb.save();
            return Index(id,PageIndex-1);
        }
    }
}
