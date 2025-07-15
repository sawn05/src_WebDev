using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx.profile.profileControl
{
    public partial class Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string f = Request["f"] ?? "account";
                switch (f)
                {
                    case "account":
                        account.Attributes["class"] = "active";
                        break;
                    case "deliveryAddress":
                        deliveryAddress.Attributes["class"] = "active";
                        break;
                    case "pay":
                        pay.Attributes["class"] = "active";
                        break;
                    case "confirm":
                        confirm.Attributes["class"] = "active";
                        break;
                    /*case "unconfirm":
                        unconfirm.Attributes["class"] = "active";
                        break;*/
                    case "like":
                        like.Attributes["class"] = "active";
                        break;
                }
            }
        }
    }
}