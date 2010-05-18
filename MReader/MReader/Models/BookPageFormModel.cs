﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MReader.Models
{
    public class BookPageFormModel
    {
        public int pageIndex { get;  set; }
        public string pageURL { get;   set; }
        public Book book = new Book();

        public BookPageFormModel()
        {
        }

        public BookPageFormModel(Book book,int pageindex = 1, string pageURL="")
        {
            this.book = book;
            this.pageIndex = pageindex;
            this.pageURL = pageURL;
        }

        public bool HasNextPage
        {
            get
            {
                return (pageIndex < book.TotalPages);
            }
        }

        public bool HasPrevoiusPage
        {
            get
            {
                return (pageIndex > 1);
            }
        }
    }
}