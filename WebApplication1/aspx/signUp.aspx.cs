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
    public partial class signUp : System.Web.UI.Page
    {
        data.User _user = new data.User();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (!IsPostBack)
            {
                if (Session["User"] != null)
                {

                    signIn.InnerHtml = "<a href='#' id='logoutBtn'>Đăng xuất</a>";

                    dangky.InnerHtml = $"<span>Xin chào, {Session["user"]}</span>";
                }
                else
                {
                    dangky.InnerHtml = "<a href='../aspx/signUp.aspx'>Đăng ký</a>";
                    signIn.InnerHtml = "<a href='../aspx/login.aspx'>Đăng nhập</a>";
                }
            }*/
        }

        protected void btn_signUp_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string email = Request.Form.Get("email_user");
                string username = Request.Form.Get("username");
                string password = Request.Form.Get("password_user");

                DataTable dtUserByUsername = _user.GetUserByUsername(username);
                DataTable dtUserByEmail = _user.GetUserByEmail(email);

                if (dtUserByEmail.Rows.Count > 0)
                {
                    match_message.InnerHtml = "Email đã tồn tại, vui lòng đăng ký lại!";
                    match_message.Style["color"] = "red";
                    return;
                }

                if (dtUserByUsername.Rows.Count > 0)
                {
                    match_message.InnerHtml = "Tài khoản đã tồn tại, vui lòng đăng ký lại!";
                    match_message.Style["color"] = "red";
                    return;
                }

                _user.InsertUser(username, password);

                // Đăng nhập người dùng luôn
                Session["User"] = username;

                match_message.InnerHtml = "Đăng ký thành công! Đang chuyển hướng...";
                match_message.Style["color"] = "green";
                ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript",
                    "setTimeout(function(){ window.location.href='home.aspx'; }, 2300);", true);
            }
        }
    }
}