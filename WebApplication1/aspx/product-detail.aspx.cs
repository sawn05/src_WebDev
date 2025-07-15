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
    public partial class product_detail : System.Web.UI.Page
    {
        data.Product _product = new data.Product();
        data.Cart _cart = new data.Cart();
        string maSP = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            maSP = Request.QueryString["id"] ?? "";
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

                LoadProductDetail();
                LoadWatchMore();
                LoadProductOutstanding();
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

        public void LoadProductDetail()
        {
            string id = Request.QueryString["id"].ToString();
            if (!string.IsNullOrEmpty(id))
            {
                DataTable dt = _product.getProductDetail_byProductID(id);

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];

                    double giamGia = Convert.ToDouble(row["giamGia"]);
                    double donGia = Convert.ToDouble(row["donGia"]);

                    imgProduct.ImageUrl = "~/assets/img/book/" + row["hinhAnhSanPham"];

                    ltTenSP.Text = row["tenSP"].ToString();
                    ltGiaSauGiam.Text = (donGia * (1 - giamGia / 100.0)).ToString("#,##0") + " VNĐ";

                    double danhGia = Convert.ToDouble(row["danhGia"]);
                    int luotDanhGia = Convert.ToInt32(row["luotDanhGia"]);
                    ltStars.Text = RenderStars(danhGia) + " (" + luotDanhGia + ")";
                    ltTheLoai.Text = row["tenTheLoai"].ToString();
                    ltMoTa.Text = row["moTa"].ToString();
                }
            }
        }

        public void LoadWatchMore()
        {
            string maSP = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
            string maTL = Request.QueryString["maTheLoai"] != null ? Request.QueryString["maTheLoai"].ToString() : "";
            DataTable dt = new DataTable();
            dt = _product.getListProduct_WatchMore(maTL, maSP, 4);
            if (dt.Rows.Count > 0)
            {
                rptWatchMore.DataSource = dt;
                rptWatchMore.DataBind();
            }
        }

        public void LoadProductOutstanding()
        {
            DataTable dt = new DataTable();
            dt = _product.getListBestSellingProduct(3);
            if (dt.Rows.Count > 0)
            {
                rptProductOutstanding.DataSource = dt;
                rptProductOutstanding.DataBind();
            }
        }


        protected void lnkAddToCart_Click(object sender, EventArgs e)
        {
            int quantity = 1;

            if (!string.IsNullOrEmpty(txtQuantity.Text))
            {
                int.TryParse(txtQuantity.Text, out quantity);
            }

            _cart.AddToCart(maSP, quantity);

            ClientScript.RegisterStartupScript(this.GetType(), "alertSuccess", "alert('Thêm sản phẩm vào giỏ hàng thành công');", true);
        }
    }
}