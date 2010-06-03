using System;
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




        //搜索
        public IQueryable<Book> SearchBookbyBookName( string bookName )
        {
            throw new NotImplementedException();
        }
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

        public void save()
        {
            db.SubmitChanges();
        }
    }
}