using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MReader.Models
{
    public class CustomerRepository
    {
        private CustomerInfoDataContext db = new CustomerInfoDataContext();

        /// <summary>
        /// try to get a customer or create one
        /// </summary>
        /// <param name="userName"></param>
        /// <returns>the customer of |userName|</returns>
        public Customer getCustomer(string userName) {
            try
            {
                return db.Customers.Single(cus => cus.UserName == userName);
            }catch{
                Customer newCustomer = new Customer(userName);
                //newCustomer.UserName = userName;

                db.Customers.InsertOnSubmit(newCustomer);
                db.SubmitChanges();
                return newCustomer;
            }
        }

        public void Save()
        {
            db.SubmitChanges();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="bookId"></param>
        /// <returns></returns>
        /// <author>latioswang</author>
        public string [] Buy(string userName,Book book) {
            Customer customer = this.getCustomer(userName);

            if (customer.HasBought( book.ID)) {
                return new string[] {"You've already bought it."};
            }
            
            if (book.Price>customer.CurrentMoney) {
                return new string[] {"You have not enough money."};
            }

            customer.CurrentMoney -= book.Price;
            PurchaseHistory newPH = new PurchaseHistory();
            newPH.BookID = book.ID;
            //newPH.Customer = customer;
            newPH.Price = book.Price;
            newPH.PurchaseTime = DateTime.Now;
            newPH.UserName = userName;
            customer.PurchaseHistories.Add(newPH);
            this.Save();

            return new string[] {};
            

        }
    }
}