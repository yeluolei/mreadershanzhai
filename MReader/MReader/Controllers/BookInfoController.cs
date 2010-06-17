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
        public ActionResult Index(int? bookid,int? page)
        {
            Book book = bookDb.GetBookbyID(bookid??26);
            Customer customer = cusDb.getCustomer(User.Identity.Name);
            BookInfoFormModel bookInfo = new BookInfoFormModel(book ,customer, page??0);
            return View("index",bookInfo);
        }

        //
        // POST: /BookInfo
        [Authorize, AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(int bookid,int PageIndex,String RemarkContent)
        {
            Book book = bookDb.GetBookbyID(bookid);
            Remark remark = new Remark();
             
            remark.RemarkTime = DateTime.Now;
            remark.RemarkUserName = User.Identity.Name;
            remark.RemarkContent = RemarkContent;
            book.Remarks.Add(remark);
            bookDb.save();
            return Index(bookid,PageIndex);
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bookid"></param>
        /// <param name="rating">rating = 1..5</param>
        /// <returns>if rate successfully</returns>
        /// <author> latioswang </author>
        
        public ActionResult Rate(int bookid, int rating)
        {
            Book book = bookDb.GetBookbyID(bookid);
            Customer cus = cusDb.getCustomer(User.Identity.Name);
            if (cus.HasRated(bookid))
            {
               // ModelState.AddModelError("rating", "You've already rated this book");
                return this.Index(bookid,0);//already rated;
            }

            Rater newrater = new Rater();
            newrater.BookId = bookid;
            newrater.UserName = User.Identity.Name;
            cus.Raters.Add(newrater);
            switch (rating)
            {
                case 1: book.rate1++;
                    break;
                case 2: book.rate2++;
                    break;
                case 3: book.rate3++;
                    break;
                case 4: book.rate4++;
                    break;
                case 5: book.rate5++;
                    break;
                
            }
            bookDb.save();
            cusDb.Save();
            return this.Index(bookid,0);
        }

        /// <summary>
        /// add a book to favlist
        /// </summary>
        /// <param name="bookid"></param>
        /// <returns></returns>
        /// <author>latioswang</author>
        public ActionResult Favourite(int bookid)
        {
            Book book = bookDb.GetBookbyID(bookid);
            Customer cus = cusDb.getCustomer(User.Identity.Name);
            if (cus.HasFaved(bookid))
            {
                
                return this.Index(bookid, 0);//already faved;
            }

            FavouriteBook newfav = new FavouriteBook();
            newfav.BookID = bookid;
            newfav.UserName = User.Identity.Name;
            newfav.FavTime = DateTime.Now;
            cus.FavouriteBooks.Add(newfav);
             
            //bookDb.save();
            cusDb.Save();
            return this.Index(bookid, 0);

        }
    }
}
