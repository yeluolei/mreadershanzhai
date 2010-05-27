using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MReader.Controllers
{
    public class BookViewController : Controller
    {
        //
        // GET: /BookView/

        public ActionResult Index()
        {
            return View();
        }

    }
}
