using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace MReader.Models
{

    public partial class Search
    {
        BookRepository db = new BookRepository ();


        private List<string> MakeKeyword(string word) {
            List<string> keyword = new List<string>();

            word = word + " ";

            while (word != "")
            {
                int loc = word.IndexOf(" ");
                keyword.Add(word.Substring(0, loc));
                word = word.Substring(loc + 1);
            }
            return keyword;
        }

        public BookSearchResult ByTitle (string book_title,int pageIndex,int pageSize)
        {
            List<Book> books = db.GetAllBooks().ToList();
            List<Book> bookResult = new List<Book>() ;
            List<string> keyword = MakeKeyword(book_title);

            foreach (string yyx in keyword) {
                foreach (Book book in books) {
                    if (book.Title.ToLower().Contains(yyx.ToLower() ))
                    {
                        if (bookResult.Contains(book))
                        {
                            bookResult.Remove(book);
                            bookResult.Insert(0, book);
                        }
                        else
                            bookResult.Add(book);
                    }
                }
            }
            BookSearchResult result = new BookSearchResult(new Helps.PaginatedList<Book>(bookResult,pageIndex,pageSize));
            result.keyword.Add(book_title);
            return result;
        }

        public BookSearchResult AdvancedSearch(string title, string ISBN, string author, string Publisher,int pageIndex = 0,int pageSize = 10) {
            List<Book> books = db.GetAllBooks().ToList();
            List<Book> bookResult = new List<Book>();
            List<string> title_keyword = MakeKeyword ( title );
            List<string> author_keyword = MakeKeyword(author);
            List<string> Publisher_keyword = MakeKeyword(Publisher);

            foreach (Book book in books) {
                bool ifmatch = false;
                if (title != "")  {
                    foreach (string yyx in title_keyword) {
                        if (book.Title.ToLower().Contains(yyx.ToLower()))
                            ifmatch = true;
                        else
                            ifmatch = false;
                    }
                }
                if (  ISBN != "" ) {
                    if ( String.Equals(ISBN, book.ISBN,StringComparison.OrdinalIgnoreCase )  )
                        ifmatch = true ;
                    else 
                        ifmatch = false ;
                }
                if (author != "") {
                    foreach (string yyx in author_keyword)
                    {
                        if (book.Author.ToLower().Contains(yyx.ToLower()))
                            ifmatch = true;
                        else
                            ifmatch = false;
                    }
                }
                if (Publisher != "") {
                    foreach (string yyx in Publisher_keyword)
                    {
                        if (book.Publisher.ToLower().Contains(yyx.ToLower()))
                            ifmatch = true;
                        else
                            ifmatch = false;
                    }
                }
                if (ifmatch == true)
                    bookResult.Add(book);
            }
            BookSearchResult result = new BookSearchResult(new Helps.PaginatedList<Book>(bookResult,pageIndex,pageSize));
            if (ISBN != "")
                result.keyword.Add("ISBN:" + ISBN + " ;");
            if (title != "")
                result.keyword.Add("Title:" + title + " ;");
            if (author != "")
                result.keyword.Add("Author:" + author + " ;");
            if (Publisher != "")
                result.keyword.Add("Publisher:" + Publisher );
            return result;
        }
    }
}