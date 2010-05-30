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
        CustomerRepository cusRepo = new CustomerRepository();
        //
        // GET: /UserCenter/
        [Authorize]
        public ActionResult Index()
        {
            string userName = User.Identity.Name;
            Customer cus = cusRepo.getCustomer(userName);
            return View(new CustomerFormModel(cus));
        }
        [Authorize]
        public ActionResult History()
        {
            string userName = User.Identity.Name;
            Customer cus = cusRepo.getCustomer(userName);
            return View(new CustomerFormModel(cus));
        }
        [Authorize]
        public ActionResult Favourite()
        {
            string userName = User.Identity.Name;
            Customer cus = cusRepo.getCustomer(userName);
            return View(new CustomerFormModel(cus));
        }
        [Authorize]
        public ActionResult Balance()
        {
            string userName = User.Identity.Name;
            Customer cus = cusRepo.getCustomer(userName);
            return View(new CustomerFormModel(cus));
        } 

        [Authorize]
        [HttpPost]
        public ActionResult Balance(FormCollection fc)
        {
            string userName = User.Identity.Name;
            CustomerFormModel cus =new CustomerFormModel(cusRepo.getCustomer(userName));
            UpdateModel(cus);
            cus.Customer.CurrentMoney+=cus.MoneyToAdd;
            cusRepo.Save();
            cus.Message = "Successfully added!";
            return View(cus);
        } 
    }
}
