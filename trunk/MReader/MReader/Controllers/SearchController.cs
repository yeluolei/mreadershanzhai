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
        BookRepository db = new BookRepository();
        Search search = new Search();
        //
        // GET: /Search/Title

        [Authorize]
        
        public ActionResult Title(string book_title,int pageIndex = 0,int pageSize = 2)
        {
            var books = search.ByTitle( book_title ,pageIndex,pageSize );
            if (book_title == "")
                return RedirectToAction("index", "home", new { });
            if (books.books.Count() == 0)
                return View("NotFound");
            else
                return View(books);
        }

        //
        // GET:/Search/AdvancedSearch

        [Authorize]
        public ActionResult AdvancedSearch() {
            return View();
        }

        //
        // POST:/Search/AdvancedSearch

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AdvancedSearch(FormCollection formValues) {
            string title, ISBN, author, Publisher;
            title = Request.Form["title"];
            ISBN = Request.Form["ISBN"];
            author = Request.Form["author"];
            Publisher = Request.Form["Publisher"];
            var books = search.AdvancedSearch(title, ISBN, author, Publisher);

            if (books.books.Count() == 0)
                return View("NotFound");
            else
                return View("title",books);
        }
    }
}
