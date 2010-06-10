using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MReader.Models
{
    public class Books
    {
        public List<Book> books;
        public Books(List<Book> books)
        {
            this.books = books;
        }
    }
}