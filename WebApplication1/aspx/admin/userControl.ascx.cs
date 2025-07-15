using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx.admin
{
    public partial class user : System.Web.UI.UserControl
    {
        data.User _user = new data.User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }

        public void loadData()
        {
            rptUserControl.DataSource = _user.getList();
            rptUserControl.DataBind();
        }
    }
}