using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.aspx.admin;
using WebApplication1.data;

namespace WebApplication1.aspx
{
    public partial class cart : System.Web.UI.Page
    {
        data.Cart _cart = new data.Cart();
        data.Order _order = new data.Order();
        data.Product _product = new data.Product();

        private float total;
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
                    signUp.InnerHtml = "<a href='../aspx/signUp.aspx'>Đăng ký</a>";
                    signIn.InnerHtml = "<a href='../aspx/login.aspx'>Đăng nhập</a>";
                }
            }


            if (Session["cart"] != null)
            {
                DataTable dtCart = (DataTable)Session["cart"];
                rptProductCart.DataSource = dtCart;
                rptProductCart.DataBind();

                total = 0;
                for (int i=0; i<dtCart.Rows.Count; i++)
                {
                    total += Convert.ToSingle(dtCart.Rows[i]["Tạm tính"]);
                }
                ltTotal.Text = String.Format("{0:#,##0} VNĐ", total);

                if (ltDiscountPrice.Text == "0")
                {
                    ltAllTotal.Text = ltTotal.Text;
                }
            }
            else
            {
                // Thông báo không có sản phẩm trong giỏ hàng
                ltThongBao.Text = "Không có sản phẩm nào trong giỏ hàng";
            }


            
        }

        protected void btnBackProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("product.aspx");
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            Page_Load(sender, e);
        }

        protected void btnApDung_Click(object sender, EventArgs e)
        {
            if (Session["cart"] != null)
            {
                string discount = discountCode.Value.Trim();

                DataTable dt = _cart.getDiscountCode(discount);
                if (dt.Rows.Count > 0)
                {
                    float discountValue = float.Parse(dt.Rows[0]["giaTriGiam"].ToString());
                    ltDiscountPrice.Text = String.Format("{0:#,##0} VNĐ", discountValue);

                    if ((total - discountValue) > 0)
                    {
                        ltAllTotal.Text = String.Format("{0:#,##0} VNĐ", (total - discountValue));
                    }
                    else
                    {
                        ltAllTotal.Text = "0";
                    }
                }
                else
                {
                    ltDiscountPrice.Text = "0 VNĐ";
                }
            }
        }

        protected void rptProductCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                string maSP = e.CommandArgument.ToString();
                _cart.RemoveProductCart(maSP);
                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("../aspx/login.aspx");
                return;
            }
            if (System.Web.HttpContext.Current.Session["cart"] != null)
            {
                DataTable dtCart = (DataTable)System.Web.HttpContext.Current.Session["cart"];

                // Cập nhật tổng tiền
                float totalPrice = 0;
                foreach (DataRow row in dtCart.Rows)
                {
                    totalPrice += Convert.ToSingle(row["Tạm tính"]);
                }

                DateTime ngayLap = DateTime.Now;
                string paymentMethod = ddlPaymentMethod.SelectedItem.Text;

                _order.InsertToOrder(Session["user"].ToString(), decimal.Parse(totalPrice.ToString()), ngayLap, txtNote.Text, paymentMethod);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thanh toán thành công!');", true);
                

                foreach (DataRow row in dtCart.Rows)
                {
                    string maSanPham = row["Mã sản phẩm"].ToString();
                    int soLuong = Convert.ToInt32(row["Số lượng"]);
                    float donGia = Convert.ToSingle(row["Giá"]);
                    _order.InsertToOrderDetails(Session["user"].ToString(), maSanPham, soLuong, donGia);
                }

                Session["cart"] = null;
            }
        }


    }
}