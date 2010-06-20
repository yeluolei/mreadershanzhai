using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;
namespace MReader.Controllers
{
    public class UserCenterController : Controller
    {
        CustomerRepository cusDb = new CustomerRepository();
        BookRepository bookdb = new BookRepository();
        //
        // GET: /UserCenter/
        [Authorize]
        public ActionResult Index()
        {
            string userName = User.Identity.Name;
            Customer cus = cusDb.getCustomer(userName);
            return View(new CustomerFormModel(cus));
        }
        [Authorize]
        public ActionResult History()
        {
            string userName = User.Identity.Name;
            Customer cus = cusDb.getCustomer(userName);
            return View(new CustomerFormModel(cus));
        }
        [Authorize]
        public ActionResult Favourite()
        {
            string userName = User.Identity.Name;
            Customer cus = cusDb.getCustomer(userName);
            return View(new CustomerFormModel(cus));
        }
        [Authorize]
        public ActionResult Balance()
        {
            string userName = User.Identity.Name;
            Customer cus = cusDb.getCustomer(userName);
            return View(new CustomerFormModel(cus));
        } 

        [Authorize]
        [HttpPost]
        public ActionResult Balance(FormCollection fc)
        {
            string userName = User.Identity.Name;
            
            CustomerFormModel cus =new CustomerFormModel(cusDb.getCustomer(userName));
            try
            {
                UpdateModel(cus);
            }
                catch
            {
                foreach (var issue in cus.GetRuleViolations())
                {
                    ModelState.AddModelError(issue.PropertyName, issue.ErrorMessage);
                }
                return View(cus);
            }
             

            cus.Customer.CurrentMoney+=cus.MoneyToAdd;
            cusDb.Save();
            cus.Message = "Successfully added!";
            return View(cus);
        }

        public ActionResult DeleteFavourite(int bookid)
        {
            Customer customer = cusDb.getCustomer(User.Identity.Name);
            if (customer.HasFaved(bookid))
            {
                FavouriteBook fav = customer.FavouriteBooks.Single(f=>f.BookID == bookid);
                customer.FavouriteBooks.Remove(fav);
                cusDb.Save();
            }
            return View("Favourite", new CustomerFormModel(customer));
        }
    }
}
