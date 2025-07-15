using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx.profile.profileControl
{
    public partial class Confirm : System.Web.UI.UserControl
    {
        data.Product _product = new data.Product();
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

            DataTable dt = _product.GetProductByOrderID(userName);
            if (dt.Rows.Count > 0)
            {
                var list = dt.AsEnumerable().Select(row => new
                {
                    maHD = row["maHD"].ToString(),
                    trangThai = row["trangThai"].ToString(), 
                    tenSP = row["tenSP"].ToString(),
                    moTa = row["moTa"].ToString(),
                    hinhAnhSanPham = row["hinhAnhSanPham"].ToString(),
                    soLuongMua = Convert.ToInt32(row["soLuongMua"]),
                    donGia = Convert.ToDouble(row["donGia"]),
                    giamGia = Convert.ToDouble(row["giamGia"])
                });

                var grouped = list
                    .GroupBy(item => new { item.maHD, item.trangThai }) 
                    .Select(g => new
                    {
                        maHD = g.Key.maHD,
                        trangThai = g.Key.trangThai,
                        tongTien = g.Sum(sp => sp.donGia * (1 - sp.giamGia / 100.0) * sp.soLuongMua),
                        danhSachSanPham = g.ToList()
                    }).ToList();

                rptOrder.DataSource = grouped;
                rptOrder.DataBind();
            }
        }


        protected void rptOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var rptProduct = (Repeater)e.Item.FindControl("rptProduct");

                dynamic data = e.Item.DataItem;
                rptProduct.DataSource = data.danhSachSanPham;
                rptProduct.DataBind();
            }
        }
    }
}