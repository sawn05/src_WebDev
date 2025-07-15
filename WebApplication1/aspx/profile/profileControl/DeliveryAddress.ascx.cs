using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx.profile.profileControl
{
    public partial class DeliveryAddress : System.Web.UI.UserControl
    {
        data.DeliveryAddress _deliveryAddress = new data.DeliveryAddress();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        public void LoadData()
        {
            string username = Session["user"] as string;
            if (string.IsNullOrEmpty(username))
            {
                Response.Redirect("../login.aspx");
                return;
            }

            DataTable dt = _deliveryAddress.GetListAddress(username);
            rptListAddress.DataSource = dt;
            rptListAddress.DataBind();

            if (dt.Rows.Count == 0)
            {
                lblMessage.Text = "Bạn chưa có địa chỉ giao hàng nào.";
            }
        }

        protected void btnSaveAddress_Click(object sender, EventArgs e)
        {


            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        }
    }
}