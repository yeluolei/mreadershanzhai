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
        CustomerRepository cusDb = new CustomerRepository();

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
            return Index(id,PageIndex);
        }

        [Authorize]
        public ActionResult Buy(int bookId)
        {

            Book book = bookDb.GetBookbyID(bookId);
            BookInfoFormModel bookInfo = new BookInfoFormModel(book);
            return View(bookInfo);
        }

        [Authorize]
        [HttpPost]
        public ActionResult Buy(int bookId,FormCollection fc)
        {
            Customer customer = cusDb.getCustomer(User.Identity.Name);

            Book book = bookDb.GetBookbyID(bookId);
            string [] ret = cusDb.Buy(User.Identity.Name,book);
            if (ret.Length > 0)//fail to buy 
            {
                foreach (string str in ret)
                {
                    ModelState.AddModelError("",str);
                }
                //return View(bookId);
               // return Buy(bookId);
            }

            book.Buyers.Add(new Buyer(customer));
            bookDb.save();
            return View("BoughtSuccess", book);

        }


    }
}
