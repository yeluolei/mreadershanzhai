using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MReader.Helps;

namespace MReader.Models
{
    public class BookSearchResult
    {
        public List<string> keyword = new List<string> ();
        public PaginatedList<Book> books;
        public BookSearchResult(PaginatedList<Book> books)
        {
            this.books = books;
        }

        /// <summary>
        /// not yet usable
        /// </summary>
        /// <author>latioswang</author>
        public string SSKeyWord
        {
            get
            {
                return "asp 9";
            }
        }
    }
}