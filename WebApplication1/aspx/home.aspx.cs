using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.data;
using System.Data;

namespace WebApplication1.aspx
{
    public partial class home : System.Web.UI.Page
    {
        data.Product _product = new data.Product();
        data.Post_outstanding _post_Outstanding = new data.Post_outstanding();
        data.Cart _cart = new data.Cart();
        string maSP = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            maSP = Request["id"];
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {

                    signIn.InnerHtml = "<a href='#' id='logoutBtn'>Đăng xuất</a>";

                    signUp.InnerHtml = $"<span>Xin chào, {Session["user"]}</span>";
                }
                else
                {
                    signUp.InnerHtml = "<a href='../aspx/signUp.aspx'>Đăng ký</a>";
                    signIn.InnerHtml = "<a href='../aspx/login.aspx'>Đăng nhập</a>";
                }

                LoadBestSellingProduct();
                LoadPostOutStandingProduct();
            }

            
        }

        protected string RenderStars(double rating)
        {
            int fullStars = (int)Math.Round(rating);
            int emptyStars = 5 - fullStars;

            StringBuilder html = new StringBuilder();

            for (int i = 0; i < fullStars; i++)
                html.Append("<i class='fa-solid fa-star'></i>");

            for (int i = 0; i < emptyStars; i++)
                html.Append("<i class='fa-regular fa-star'></i>");

            return html.ToString();
        }

        public void LoadBestSellingProduct()
        {
            DataTable dt = new DataTable();
            dt = _product.getListBestSellingProduct(8);
            if (dt.Rows.Count > 0)
            {
                rptBestSellingProduct.DataSource = dt;
                rptBestSellingProduct.DataBind();
            }
        }

        public void LoadPostOutStandingProduct()
        {
            DataTable dt = new DataTable();
            dt = _post_Outstanding.GetListPostOutstading(4);
            if (dt.Rows.Count > 0)
            {
                rptPostList.DataSource = dt;
                rptPostList.DataBind();
            }
        }

        protected void lnkAddToCart_Click(object sender, EventArgs e)
        {
            _cart.AddToCart(maSP, 10);
            Response.Redirect("cart.aspx");
        }

    }
}