using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;
namespace MReader.Controllers
{
    public class AdminUserController : Controller
    {
        //
        // GET: /AdminUser/
        CustomerRepository db = new CustomerRepository();

         [Authorize(Roles = "admin")]
        public ActionResult Index()
        {
            var customers = db.getAllCustomers().ToList();
            return View("Index",customers);
        }

        //
        // GET: /AdminUser/Details/5
        [Authorize(Roles = "admin")]
        public ActionResult Details(string username)
        {
            if (username == "")
                username = "admin";
            return View(db.getCustomer(username));
        }

        //
        // GET: /AdminUser/Create
        
        [Authorize(Roles = "admin")]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /AdminUser/Create

        [Authorize(Roles = "admin")]        
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            Customer cus = new Customer();
            try
            {
                UpdateModel(cus);
                db.AddCustomer(cus);
                db.Save();
                // TODO: Add insert logic here
                return RedirectToAction("Details", new { username = cus.UserName });
            }
            catch
            {
                return RedirectToAction("Error");
            }
        }
        
        //
        // GET: /AdminUser/Edit/5

        [Authorize(Roles = "admin")]
        public ActionResult Edit(string username)
        {
            Customer cus = db.getCustomer(username);
            return View(cus);
        }

        //
        // POST: /AdminUser/Edit/5
        
        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult Edit(string username, FormCollection collection)
        {
            Customer cus = db.getCustomer(username);
            try
            {
                // TODO: Add update logic here
                UpdateModel(cus);
                db.Save();
                return RedirectToAction("Details", new { username = cus.UserName });
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /AdminUser/Delete/5
        
        [Authorize(Roles = "admin")] 
        public ActionResult Delete(string username)
        {
            Customer cus = db.getCustomer(username);
            return View(cus);
        }

        //
        // POST: /AdminUser/Delete/5
        public ActionResult Success()
        {
            return View();
        }
        public ActionResult NotFound()
        {
            return View();
        }

        public ActionResult Error()
        {
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult Delete(string username, FormCollection collection)
        {
            if (!db.isExist(username))
                return RedirectToAction("NotFound");
            Customer cus = db.getCustomer(username);
            try
            {
                // TODO: Add delete logic here
                db.DeleteCustomer(cus);
                db.Save();
                return RedirectToAction("Success");
            }
            catch
            {
                return RedirectToAction("Error");
            }
        }
    }
}
