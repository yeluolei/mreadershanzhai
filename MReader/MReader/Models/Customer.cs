﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;

namespace MReader.Models
{
    partial class Customer
    {
        //新建一个用户

        public Customer(string userName)
        {
            this._PurchaseHistories = new EntitySet<PurchaseHistory>(new Action<PurchaseHistory>(this.attach_PurchaseHistories), new Action<PurchaseHistory>(this.detach_PurchaseHistories));
            this._Bookmarks = new EntitySet<Bookmark>(new Action<Bookmark>(this.attach_Bookmarks), new Action<Bookmark>(this.detach_Bookmarks));
            this._Raters = new EntitySet<Rater>(new Action<Rater>(this.attach_Raters), new Action<Rater>(this.detach_Raters));
            this._FavouriteBooks = new EntitySet<FavouriteBook>(new Action<FavouriteBook>(this.attach_FavouriteBooks), new Action<FavouriteBook>(this.detach_FavouriteBooks));
            OnCreated();
            this.UserName = userName;
            this.DateRegistered = DateTime.Now;
            this.UserLevel = 0;
            this.SpentCost = 0;
            this.CurrentMoney = 0;
        }

        /// <summary>
        /// TODO:eliminate multiple match
        /// </summary>
        /// <param name="bookId"></param>
        /// <returns></returns>
        /// <author>latioswang</author>
        public bool HasBought(int bookId)
        {
            try
            {
                var tmp = PurchaseHistories.SingleOrDefault(b => b.BookID == bookId);
                return tmp != null;
            }
            catch
            {
                //multiple match then .... OK return true;
                //TODO : eliminate multiple match
                return true;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bookId"></param>
        /// <returns></returns>
        /// <author>latioswang</author>
        public bool HasFaved(int bookId)
        {
            try
            {
                var tmp = this.FavouriteBooks.SingleOrDefault(b => b.BookID == bookId);
                return tmp != null;
            }
            catch
            {
                //multiple match then .... OK return true;
                //TODO : eliminate multiple match
                return true;
            }
        }

        public bool HasRated(int bookId)
        {
            try
            {
                var tmp = this.Raters.SingleOrDefault(r => r.BookId==bookId);
                return tmp != null;
            }
            catch
            {
                //multiple match then .... OK return true;
                //TODO : eliminate multiple match
                return true;
            }
        }


    }
}