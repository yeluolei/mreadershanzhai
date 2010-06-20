using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MReader
{
    public partial class ApplicationErroy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Application["erroy"].ToString());
            Response.Write("HHH");
        }
    }
}