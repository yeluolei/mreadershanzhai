﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MReader.Models
{
    public class BookRepository
    {
        BookDBDataContext db = new BookDBDataContext();

        public void NewBook( Book book )
        {
            db.Books.InsertOnSubmit(book);
            //throw new NotImplementedException();
        }

        public Book GetBookbyID(int ID)
        {
            Book aBook = db.Books.SingleOrDefault(d => d.ID == ID);
            if (aBook == null)
            {
                aBook = new Book();
                aBook.Title = "NULL";

            }
            return aBook;
        }

        public Book GetBookbyGuid(Guid guid)
        {
            Book aBook = db.Books.SingleOrDefault(d => d.Guid == guid);
            if (aBook == null)
            {
                aBook = new Book();
                aBook.Title = "NULL";
            }
            return aBook;
        }

        //--------------------搜索---------------------

        /// <summary>
        /// find a book by bookname
        /// </summary>
        /// <param name="bookName"></param>
        /// <returns></returns>
        public IQueryable<Book> SearchBookbyBookName( string bookName )
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// return all books in the database
        /// </summary>
        /// <returns></returns>
        public IQueryable<Book> GetAllBooks()
        {
            return from book in db.Books
                   where book.ID>0
                   orderby book.ID
                   select book;
        }


        public IQueryable<Book> SearchBookbyWriter( string writer )
        {
            throw new NotImplementedException();
        }

        public IQueryable<Book> SearchBookbyISBN( string ISBN )
        {
            throw new NotImplementedException();
        }

        //删除
        public void DeleteBook( Book book )
        {
            db.Books.DeleteOnSubmit(book);
        }
        
        /// <summary>
        /// get |count| books which most people buy
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        /// <author>latioswang</author>
        public List<Book> GetRecommendBooks(int count) {
            var booklist =  from book in db.Books
                   
                   orderby book.TimesBought descending
                   select book;
            return booklist.Take(count).ToList();

        }
        
        public void save()
        {
            db.SubmitChanges();
        }
    }
}