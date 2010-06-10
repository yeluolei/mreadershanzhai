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
        // GET: /Search/title

        [Authorize]
        [HttpPost]
        public ActionResult Title(string book_title)
        {
            var books = search.ByTitle( book_title );
            if (book_title == "")
                return RedirectToAction("index", "home", new { });
            Books temp = new Books(books);
            if (books.Count() == 0)
                return View("NotFound");
            else
                return View( temp);
        }
    }
}
