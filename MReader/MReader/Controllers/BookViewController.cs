using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;


namespace MReader.Controllers
{
    public class BookViewController : Controller
    {
        /// <summary>
        /// remember to name book database and customer database with meaningful name;
        /// DO NOT USE |db| TO NAME THEM!!!
        /// </summary> 
        BookRepository bookDb = new BookRepository();

        /// <summary>
        /// this method should never be invoked
        /// </summary>
        /// <returns>the error view</returns>
        public ActionResult Index()
        {
            
            HandleErrorInfo err = new HandleErrorInfo(new Exception("No such book!"), "BookView", "Index");
            return View("Error",err);
        }

        [Authorize]
        public ActionResult ViewBook(int? page, int? ID)
        {
            Book book = bookDb.GetBookbyID(ID ?? 1);    

            //handle exception if no such |ID|
            if (book.Title.ToLower() == "null")
            {
                HandleErrorInfo err = new HandleErrorInfo(new Exception("No such book!"),"BookView","ViewBook");
                

                return View("Error", err);
            }
            int temppage = page ?? 1;
            string URL = string.Format(book.Content, temppage);

            BookPageFormModel bh = new BookPageFormModel(book, temppage, URL);

            return View(bh);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ViewBook(BookPageFormModel bookModel)
        {

            return ViewBook(bookModel.pageIndex, Convert.ToInt32(Request.Form["ID"]));
        }

    }
}
