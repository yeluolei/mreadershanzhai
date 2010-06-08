using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MReader.Helps;

namespace MReader.Models
{
    public class BookInfoFormModel
    {

        public Book book = new Book();
        public int pageIndex { get; set; }
        public PaginatedList<Remark> paginatedRemarks { get; set; }
        public string bookcover { get; set; }
        const int pagesize = 10;

        public BookInfoFormModel() 
        { 
        }

        public BookInfoFormModel(Book book,int? page)
        {
            this.book = book;
            this.pageIndex = page ?? 0;
            this.bookcover = string.Format(book.Content, "cover");
            this.paginatedRemarks = new PaginatedList<Remark>(FindAllRemarks(), pageIndex, pagesize);
        }

        private IQueryable<Remark> FindAllRemarks()
        {
            return book.Remarks.AsQueryable();
        }


        public bool HasPage{
            get
            {
                return paginatedRemarks.HasPage;
            }
        }


        public bool HasNextPage
        {
            get
            {
                return paginatedRemarks.HasNextPage;
            }
        }
        public bool HasPreviousPage
        {
            get
            {
                return paginatedRemarks.HasPreviousPage;
            }
        }
    }
}