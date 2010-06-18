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
        CustomerRepository cusDb = new CustomerRepository();

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


            //if the user haven't bought the book
            Customer cus = cusDb.getCustomer(User.Identity.Name);
            if (!cus.HasBought(book.ID))
            {
                HandleErrorInfo err = new HandleErrorInfo(new Exception("You've not bought this book yet!"), "BookView", "ViewBook");
                return View("Error", err);
            }

            int temppage = page ?? 1;
            if (temppage > book.TotalPages || temppage < 1)
                temppage = 1;
        
            string URL = string.Format(book.Content, temppage);

            BookPageFormModel bh = new BookPageFormModel(book, temppage, URL);

            return View(bh);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult ViewBook(BookPageFormModel bookModel)
        {

            return ViewBook(bookModel.pageIndex, Convert.ToInt32(Request.Form["ID"]));
        }

        [Authorize]
        public void AddBookmark(int pageNum, int bookID, string note)
        {
            Customer cus = cusDb.getCustomer(User.Identity.Name);
            Bookmark bookmark = new Bookmark();
            bookmark.BookID = bookID;
            bookmark.PageNum = pageNum;
            bookmark.CreateTime = DateTime.Now;
            bookmark.Note = note;
            //bookmark.Note = note;
            //bookmark.UserName = HttpContext.User.Identity.ToString();
            cus.Bookmarks.Add(bookmark);
            cusDb.Save();
        }

        [Authorize]
        public void GetBookmark(int bookID)
        {
            Customer cus = cusDb.getCustomer(User.Identity.Name);
            var bookmarks = cus.Bookmarks;
            var bookmarkofBook = from bookmark in bookmarks
                                 where bookmark.BookID == bookID
                                 orderby bookmark.ID
                                 select bookmark;
            List<Dictionary<string, string>> temp = new List<Dictionary<string, string>>();
            foreach (var bookmark in bookmarkofBook)
            {
                Dictionary<string, string> tempDic = new Dictionary<string, string>();
                tempDic.Add("ID", bookmark.ID.ToString());
                tempDic.Add("createtime", bookmark.CreateTime.ToString());
                tempDic.Add("pageNum", bookmark.PageNum.ToString());
                tempDic.Add("note", bookmark.Note);
                temp.Add(tempDic);
            }
            System.Web.Script.Serialization.JavaScriptSerializer s = new System.Web.Script.Serialization.JavaScriptSerializer();
            JsonResult json = new JsonResult();
            json.Data = s.Serialize(temp);
            Response.Write(json.Data);
            //return json;
        }

        [Authorize]
        public void DeleteBookmark(int id)
        {
            Bookmark temp = cusDb.GetBookmarkbyID(id);
            cusDb.DeleteBookmarkbyID(temp);
            cusDb.Save();
        }
       
    }
}
