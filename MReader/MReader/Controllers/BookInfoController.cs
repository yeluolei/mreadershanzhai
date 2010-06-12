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
            Customer customer = cusDb.getCustomer(User.Identity.Name);
            BookInfoFormModel bookInfo = new BookInfoFormModel(book ,customer, page??0);
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
            Customer customer = cusDb.getCustomer(User.Identity.Name);
            BookInfoFormModel bookInfo = new BookInfoFormModel(book,customer);
            return View(bookInfo);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bookId"></param>
        /// <param name="fc"></param>
        /// <returns>success or fail page</returns>
        [Authorize]
        [HttpPost]
        public ActionResult Buy(int bookId,FormCollection fc)
        {
            Customer customer = cusDb.getCustomer(User.Identity.Name);

            Book book = bookDb.GetBookbyID(bookId);
            string [] errMsg = cusDb.Buy(User.Identity.Name,book);
            if (errMsg.Length > 0)//fail to buy 
            {
                foreach (string str in errMsg)
                {
                    ModelState.AddModelError("",str);
                }
                
               return Buy(bookId);
            }

            book.Buyers.Add(new Buyer(customer));
            book.TimesBought = book.Buyers.Count;
            bookDb.save();
            return View("BoughtSuccess", book);

        }


    }
}
