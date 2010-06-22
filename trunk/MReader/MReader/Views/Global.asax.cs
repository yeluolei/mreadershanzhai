using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MReader
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("bookinfo.rate",
                "BookInfo/rate/{bookid}/{rating}",
                new { controller = "bookInfo", action = "rate", bookid = UrlParameter.Optional, rating = UrlParameter.Optional });

            routes.MapRoute("search",
                "search/{action}",
                new { controller = "search", action = "title" });

            routes.MapRoute("bookinfo",
                "BookInfo/{action}/{bookid}/{page}",
                new { controller = "bookInfo", action = "index", bookid = UrlParameter.Optional, page = UrlParameter.Optional });

            routes.MapRoute("viewbook",
            "BookView/{action}/{id}/{page}", 
            new { controller = "BookView", action = "ViewBook", page = UrlParameter.Optional, id = UrlParameter.Optional });

            routes.MapRoute("addbookmark",
                "BookView/addbookmark",
                new { Controller = "BookView", action = "ViewBook" });

            routes.MapRoute("adminuser",
                "AdminUser/{action}/{username}",
                new { Controller = "AdminUser", action = "Index",username=""});


            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );
            routes.RouteExistingFiles = false;

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);

        }
        //protected void Application_Error()
        //{
        //    Exception erroy = Server.GetLastError();
        //    string err = "出错页面是：" + Request.Url.ToString() + "<br>";
        //    err += "异常信息：" + erroy.Message + "<br>";
        //    err += "Source:" + erroy.Source + "<br>";
        //    err += "StackTrace:" + erroy.StackTrace + "<br>";
        //    Server.ClearError();
        //    Application["erroy"] = err;
            
        //    Response.Redirect("/home/error?errmsg=undefined error");
        //}
    }
}