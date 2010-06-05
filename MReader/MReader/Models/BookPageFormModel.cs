using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


//书籍阅读页面Model
namespace MReader.Models
{
    public class BookPageFormModel
    {
        public int pageIndex { get;  set; }
        public string pageURL { get;   set; }
        public string bookcover { get; set; }
        public Book book = new Book();

        public BookPageFormModel()
        {
        }

        public BookPageFormModel(Book book,int pageindex = 1, string pageURL="")
        {
            this.book = book;
            bookcover = string.Format(book.Content, "cover");
            this.pageIndex = pageindex;
            this.pageURL = pageURL;
        }

        public bool HasNextPage
        {
            get
            {
                return (pageIndex < book.TotalPages);
            }
        }



        public bool HasPrevoiusPage
        {
            get
            {
                return (pageIndex > 1);
            }
        }
    }
}