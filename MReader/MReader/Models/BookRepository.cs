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
            return db.Books.SingleOrDefault(d => d.ID == ID);
        }

        public IQueryable<Book> SearchBookbyBookName( string bookName )
        {
            throw new NotImplementedException();
        }

        public IQueryable<Book> SearchBookbyWriter( string writer )
        {
            throw new NotImplementedException();
        }

        public IQueryable<Book> SearchBookbyISBN( string ISBN )
        {
            throw new NotImplementedException();
        }

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