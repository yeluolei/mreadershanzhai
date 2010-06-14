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
        public IQueryable<Buyer> LatestBuyers { get; set; }
        public Customer customer;
        public BookInfoFormModel() 
        {
        }

        public BookInfoFormModel(Book book,Customer customer,int page = 0)
        {
            this.book = book;
            this.pageIndex = page;
            this.bookcover = string.Format(book.Content, "cover");
            this.paginatedRemarks = new PaginatedList<Remark>(FindAllRemarks(), pageIndex, pagesize);
            this.LatestBuyers = FindBuyers();
            this.customer = customer;
        }

        private IQueryable<Remark> FindAllRemarks()
        {
            return book.Remarks.AsQueryable();
        }

        private IQueryable<Buyer>FindBuyers(){
            return from buyer in book.Buyers.AsQueryable()
                   where buyer.BuyID > (book.Buyers.Count > 15 ? book.Buyers.Count - 15 : 0)
                   orderby buyer.BuyTime descending
                   select buyer;
        }


        public bool HasBought(String UserName) {
            if (book.Buyers.Any(b => b.BuyUserName.Equals(UserName, StringComparison.InvariantCultureIgnoreCase))
                )
                return true;
            return false;
        }



        public int TotalPage(){
            return paginatedRemarks.TotalPages;
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