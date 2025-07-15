using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.data;

namespace WebApplication1.aspx
{
    public partial class profilee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {

                    signIn.InnerHtml = "<a href='#' id='logoutBtn'>Đăng xuất</a>";

                    signUp.InnerHtml = $"<span>Xin chào, {Session["user"]}</span>";
                }
                else
                {
                    signUp.InnerHtml = "<a href='../signUp.aspx'>Đăng ký</a>";
                    signIn.InnerHtml = "<a href='../login.aspx'>Đăng nhập</a>";
                }
            }

            plLoad.Controls.Clear();
            string f = Request["f"];
            switch (f)
            {
                case "deliveryAddress":
                    plLoad.Controls.Add(LoadControl("profileControl/DeliveryAddress.ascx"));
                    break;
                case "pay":
                    plLoad.Controls.Add(LoadControl("profileControl/Pay.ascx"));
                    break;
                case "confirm":
                    plLoad.Controls.Add(LoadControl("profileControl/Confirm.ascx"));
                    break;
                case "unconfirm":
                    plLoad.Controls.Add(LoadControl("profileControl/Unconfirm.ascx"));
                    break;
                case "account":
                default:
                    plLoad.Controls.Add(LoadControl("profileControl/QuanLyTaiKhoan.ascx"));
                    break;
            }
        }
    }
}