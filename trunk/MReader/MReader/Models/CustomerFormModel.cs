using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace MReader.Models
{   
    public class CustomerFormModel
    {
        public Customer Customer{get;set;}
        public string Message { get; set; }
        public CustomerFormModel(Customer customer,string message="")
        {
            Customer = customer;
            Message = message;
        }

        public string StringCurrentMoney
        {
            get
            {
                return Customer.CurrentMoney.ToString("C");
            }
        }


        [Required]
        [DisplayName("Money To Add")]
        public decimal MoneyToAdd { get; set; }


        public IEnumerable<RuleViolation> GetRuleViolations()
        {
            yield return new RuleViolation("Must specify a valid money.","MoneyToAdd");
        }
    }
}