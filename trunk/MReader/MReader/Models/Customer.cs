using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;

namespace MReader.Models
{
    partial class Customer
    {
        public Customer(string userName)
          

        {
            this._FavouriteBooks = new EntitySet<FavouriteBook>(new Action<FavouriteBook>(this.attach_FavouriteBooks), new Action<FavouriteBook>(this.detach_FavouriteBooks));
            this._PurchaseHistories = new EntitySet<PurchaseHistory>(new Action<PurchaseHistory>(this.attach_PurchaseHistories), new Action<PurchaseHistory>(this.detach_PurchaseHistories));
            OnCreated();
            this.UserName = userName;
            this.DateRegistered = DateTime.Now;
            this.UserLevel = 0;
            this.SpentCost = 0;
            this.CurrentMoney = 0;
        }
    }
}