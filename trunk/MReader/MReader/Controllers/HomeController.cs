﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;


namespace MReader.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        BookRepository db = new BookRepository();
        
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

         


    }

  
}
