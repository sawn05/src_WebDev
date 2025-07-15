using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplication1.aspx
{
    public partial class adminControl : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = Request["f"];
            switch (s)
            {
                case "post_outstanding":
                    plLoad.Controls.Add(LoadControl("post_outstandingControl.ascx"));
                    break;
                case "product":
                    plLoad.Controls.Add(LoadControl("productControl.ascx"));
                    break;
                case "user":
                    plLoad.Controls.Add(LoadControl("userControl.ascx"));
                    break;
            }
        }
    }
}