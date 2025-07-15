using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.data;

namespace WebApplication1.aspx
{
    public partial class login : System.Web.UI.Page
    {
        data.User _user = new data.User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUsername.Attributes["placeholder"] = "Tên đăng nhập";
                txtPassword.Attributes["placeholder"] = "Mật khẩu";
            }
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
             if (!string.IsNullOrEmpty(txtUsername.Text) && !string.IsNullOrEmpty(txtPassword.Text))
             {
                checkUser(txtUsername.Text, txtPassword.Text);
             }
            else
            {
                error_message.InnerText = "Vui lòng nhập đầy đủ tài khoản và mật khẩu";
            }
        }


        public void checkUser(string username, string password)
        {
            DataTable dt = _user.GetUserByUsername(username);

            if (dt.Rows.Count > 0)
            {
                bool isAdmin = Convert.ToBoolean(dt.Rows[0]["active"]);
                string storedPassword = dt.Rows[0]["password"].ToString();

                if (password == storedPassword)
                {
                    Session["user"] = username;

                    error_message.InnerHtml = "Đăng nhập thành công! Đang chuyển hướng...";
                    error_message.Style["color"] = "green";
                    if (!isAdmin) {
                        ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript",
                        "setTimeout(function(){ window.location.href='home.aspx'; }, 2300);", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript",
                        "setTimeout(function(){ window.location.href='../Administrator.aspx'; }, 2300);", true);
                    }
                }
                else
                {
                    error_message.InnerText = "Mật khẩu không chính xác";
                }
            }
            else
            {
                error_message.InnerText = "Tài khoản không tồn tại, vui lòng đăng ký!";
            }
        }
    }
}