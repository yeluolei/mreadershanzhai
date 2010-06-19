using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MReader.Models;
using MReader.Helps;

namespace MReader.Controllers
{
    public class SiteIncomeController : Controller
    {
        //
        // GET: /SiteIncome/
        BookRepository bookdb = new BookRepository();
        CustomerRepository cusdb = new CustomerRepository();


        [Authorize(Roles="admin")]
        public ActionResult Index(DateTime ?starttime,DateTime ? endtime,int pageIndex=0,int pageSize=3)
        {
            DateTime innerstarttime = starttime ?? new  DateTime(2010, 1, 1);
            DateTime innerendtime = endtime ?? DateTime.Now;
            SiteIncomeFormModel model = new SiteIncomeFormModel(cusdb.GetPurchaseHistory(innerstarttime,innerendtime),pageIndex,pageSize,innerstarttime,innerendtime);
            return View("index", model);
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult Index()
        {
            SiteIncomeFormModel model = new SiteIncomeFormModel();
            try
            {
                UpdateModel(model);
                
            }
            catch
            {
                return View("index", model);
            }


            return RedirectToAction("index", new { starttime = model.StartTime, endtime = model.EndTime });
        }
    }
}
