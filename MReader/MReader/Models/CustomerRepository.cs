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


        
    }
}