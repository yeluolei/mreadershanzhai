using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;


namespace MReader.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        BookRepository db = new BookRepository();
        
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult list()
        {
            return View();
        }


        [Authorize]
        public ActionResult BookView( int? page,int? ID)
        {
            Book book = db.GetBookbyID( ID ?? 1 );
            int temppage = page ?? 1;
            string URL = book.Content + temppage.ToString()+".png"; 
           
            BookPageFormModel bh = new BookPageFormModel(book,temppage,URL);
            
            return View(bh);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult BookView(BookPageFormModel bookModel)
        { 
           
            return BookView(bookModel.pageIndex, Convert.ToInt32(Request.Form["ID"]));
        }

    }

  
}
