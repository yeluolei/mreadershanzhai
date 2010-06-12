﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

        public Books ByTitle (string book_title)
        {
            List<Book> books = db.GetAllBooks().ToList();
            List<Book> temp = new List<Book>() ;
            List<string> keyword = MakeKeyword(book_title);

            foreach (string yyx in keyword) {
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
            Books result = new Books(temp);
            result.keyword.Add("Title:" + book_title);
            return result  ;
        }

        public Books AdvancedSearch(string title, string ISBN, string author, string Publisher) {
            List<Book> books = db.GetAllBooks().ToList();
            List<Book> temp = new List<Book>();
            List<string> title_keyword = MakeKeyword ( title );
            List<string> author_keyword = MakeKeyword(author);
            List<string> Publisher_keyword = MakeKeyword(Publisher);

            foreach (Book book in books) {
                bool ifmatch = false;
                if (title != "")  {
                    foreach (string yyx in title_keyword) {
                        if (book.Title.Contains(yyx))
                            ifmatch = true;
                        else
                            ifmatch = false;
                    }
                }
                if (  ISBN != "" ) {
                    if ( ISBN == book.ISBN )
                        ifmatch = true ;
                    else 
                        ifmatch = false ;
                }
                if (author != "") {
                    foreach (string yyx in author_keyword)
                    {
                        if (book.Author.Contains(yyx))
                            ifmatch = true;
                        else
                            ifmatch = false;
                    }
                }
                if (Publisher != "") {
                    foreach (string yyx in Publisher_keyword)
                    {
                        if (book.Publisher.Contains(yyx))
                            ifmatch = true;
                        else
                            ifmatch = false;
                    }
                }
                if (ifmatch == true)
                    temp.Add(book);
            }
            Books result = new Books(temp);
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