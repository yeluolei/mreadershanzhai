using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace MReader.Models
{   
    public enum ViewWhat  {index,history,favourite,balance};
    public class CustomerFormModel
    {
        public Customer Customer{get;set;}
        //public ViewWhat ViewWhat { get; set; }
        public CustomerFormModel(Customer customer,string message="")
        {
            Customer = customer;
            Message = message;
          
        }



        [Required]
        [DisplayName("Money To Add")]
        public decimal MoneyToAdd { get; set; }

        public string Message { get; set; }
    }
}