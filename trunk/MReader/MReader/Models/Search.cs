using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MReader.Models
{

    public partial class Search
    {
        BookRepository db = new BookRepository ();

        
        public List<Book> ByTitle (string book_title)
        {
            List<Book> books = db.GetAllBooks().ToList();
            List<Book> temp = new List<Book>() ;
            List<string> yyy = new List<string>();

            book_title = book_title + " " ;

            while (book_title != "") {
                int loc = book_title.IndexOf(" ");
                yyy.Add ( book_title.Substring(0,loc)) ;
                book_title = book_title.Substring(loc+1) ;
            }

            //foreach (Book book in books) {
            //    foreach (string yyx in yyy) { 
            //        if ( book.Title.Contains( yyx )) {
            //            temp.Add( book ) ;
            //            break ;
            //        }
            //    }
            //}
            foreach (string yyx in yyy) {
                foreach (Book book in books) {
                    if (book.Title.Contains(yyx)) {
                        if (temp.Contains(book))
                        {
                            temp.Remove(book);
                            temp.Insert(0, book);
                        }
                        else
                            temp.Add(book);
                    }
                }
            }
            return temp ;
        }


    }
}