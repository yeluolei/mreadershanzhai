using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MReader.Models
{
    public partial class Buyer
    {
        public Buyer(Customer customer)
        {
            this.BuyTime = DateTime.Now;
            this.BuyUserName = customer.UserName;
            OnCreated();
        }
    }
}