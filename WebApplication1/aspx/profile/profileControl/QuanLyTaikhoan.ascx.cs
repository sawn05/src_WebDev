using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx.profile.profileControl
{
    public partial class QuanLyTaikhoan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        public void LoadData()
        {
            string userName = Session["user"] as string;
            if (string.IsNullOrEmpty(userName))
            {
                Response.Redirect("../login.aspx");
                return;
            }
            
        }
    }
}