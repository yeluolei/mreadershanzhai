using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;

namespace MReader.Controllers
{
    public class SearchController : Controller
    {
        BookRepository bookdb = new BookRepository();
        Search search = new Search();
        //
        // GET: /Search/Title

        //[Authorize]
        
        //public ActionResult Title(string book_title,int pageIndex = 0,int pageSize = 2)
        //{
        //    var books = search.ByTitle( book_title ,pageIndex,pageSize );
        //    if (book_title == "")
        //        return RedirectToAction("index", "home", new { });
        //    if (books.books.Count() == 0)
        //        return View("NotFound");
        //    else
        //        return View(books);
        //}

        //
        // GET:/Search/AdvancedSearch

        [Authorize]
        public ActionResult AdvancedSearch()
        {
            Book abook = new Book () ;
            return View( abook );
        }

        //
        // POST:/Search/AdvancedSearch

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AdvancedSearch(FormCollection formValues)
        {
            string title, ISBN, author, Publisher , Categories ;
            title = Request.Form["title"].ToString();
            ISBN = Request.Form["ISBN"].ToString();
            author = Request.Form["author"].ToString();
            Publisher = Request.Form["Publisher"].ToString();
            Categories = Request.Form["Description"].ToString();
            return RedirectToAction("BookSearch", "Search", new { title, ISBN, author, Publisher });
            //var books = search.AdvancedSearch(title, ISBN, author, Publisher);

            //if (books.books.Count() == 0)
            //    return View("NotFound");
            //else
            //    return View("title", books);
        }

        //
        //GET:/Search/Advanced Search

        [Authorize]

        public ActionResult BookSearch(string title = "" , string ISBN = "" , string author = "" , string Publisher = "" , int pageIndex = 0, int pageSize = 2)
        {
            var books = search.AdvancedSearch(title, ISBN, author, Publisher,pageIndex );

            if (title == "" && ISBN == "" && author == "" && Publisher == "")
                return RedirectToAction("index", "home", new { });
            if (books.books.Count() == 0)
                return View("NotFound");
            else
                return View("title", books);
        }
    }
}