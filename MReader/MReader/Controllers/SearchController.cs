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
        // GET:/Search/AdvancedSearch

        [Authorize]
        public ActionResult AdvancedSearch()
        {
            Book abook = new Book () ;
            List<SelectListItem> tmp = new List<SelectListItem>(abook.Categories);
            SelectListItem item = new SelectListItem();
            item.Value="0";
            item.Text = "All";
            tmp.Add(item);
            abook.Categories = new SelectList(tmp,"Value","Text");
            return View( abook );
        }

        //
        // POST:/Search/AdvancedSearch

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AdvancedSearch(FormCollection formValues)
        {
            string title, ISBN, author, Publisher  ;
            int CategoryID;
            Book abook = new Book();
            UpdateModel(abook);
            title = abook.Title;
            ISBN = abook.ISBN;
            author = abook.Author;
            Publisher = abook.Publisher;
            CategoryID = abook.CategoryID;
            return RedirectToAction("BookSearch", "Search", 
                new { CategoryID , title, ISBN, author, Publisher});
        }

        //
        //GET:/Search/Advanced Search

        [Authorize]

        public ActionResult BookSearch( int CategoryID = 0 , string title = "" , string ISBN = "" , 
            string author = "" , string Publisher = "" , int pageIndex = 0, int pageSize = 2)
        {
            var books = search.AdvancedSearch(CategoryID , title, ISBN, author, Publisher,pageIndex );

            //if (title == "" && ISBN == "" && author == "" && Publisher == "" && CategoryID == 0 )
            //    return RedirectToAction("index", "home", new { });
            if (books.books.Count() == 0)
                return View("NotFound");
            else
                return View("title", books);
        }
    }
}