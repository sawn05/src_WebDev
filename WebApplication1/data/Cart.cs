using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1.data
{
    public class Cart
    {
        ConnectionSQL connectionSQL = new ConnectionSQL();
        Product _product = new Product();

        public void CreateCart()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Hình ảnh", typeof(string));
            dt.Columns.Add("Mã sản phẩm", typeof(string));
            dt.Columns.Add("Tên sản phẩm", typeof(string));
            dt.Columns.Add("Giá", typeof(float));
            dt.Columns.Add("Số lượng", typeof(int));
            dt.Columns.Add("Tạm tính", typeof(float));
            System.Web.HttpContext.Current.Session["cart"] = dt;
        }

        public void AddToCart(string maSP, int quantity)
        {
            if (System.Web.HttpContext.Current.Session["cart"] == null)
            {
                CreateCart();
            }

            DataTable dtCart = (DataTable)System.Web.HttpContext.Current.Session["cart"];
            DataTable dt = _product.getProductDetail_byProductID(maSP);

            if (dt.Rows.Count > 0)
            {
                string hinhAnhSP = dt.Rows[0]["hinhAnhSanPham"].ToString();
                string id = dt.Rows[0]["maSP"].ToString();
                string name = dt.Rows[0]["tenSP"].ToString();
                float price = string.IsNullOrEmpty(dt.Rows[0]["donGia"].ToString()) ? 0 : float.Parse(dt.Rows[0]["donGia"].ToString());
                float sale = string.IsNullOrEmpty(dt.Rows[0]["giamGia"].ToString()) ? 0 : float.Parse(dt.Rows[0]["giamGia"].ToString());

                float unitPrice = price * (1 - sale / 100);
                float subtotal = unitPrice * quantity;

                // Kiểm tra nếu sản phẩm đã có trong giỏ
                bool exists = false;
                foreach (DataRow row in dtCart.Rows)
                {
                    if (row["Mã sản phẩm"].ToString() == maSP)
                    {
                        int oldQuantity = Convert.ToInt32(row["Số lượng"]);
                        int newQuantity = oldQuantity + quantity;
                        row["Số lượng"] = newQuantity;
                        row["Tạm tính"] = unitPrice * newQuantity;
                        exists = true;
                        break;
                    }
                }

                if (!exists)
                {
                    DataRow dr = dtCart.NewRow();
                    dr["Hình ảnh"] = hinhAnhSP;
                    dr["Mã sản phẩm"] = id;
                    dr["Tên sản phẩm"] = name;
                    dr["Số lượng"] = quantity;
                    dr["Giá"] = unitPrice;
                    dr["Tạm tính"] = subtotal;

                    dtCart.Rows.Add(dr);
                }

                System.Web.HttpContext.Current.Session["cart"] = dtCart;
            }
        }

        public void RemoveProductCart(string maSP)
        {
            DataTable dtCart = new DataTable();
            dtCart = (DataTable)System.Web.HttpContext.Current.Session["cart"];

            for (int i=0; i < dtCart.Rows.Count; i++)
            {
                if (dtCart.Rows[i]["Mã sản phẩm"].ToString()== maSP.ToString())
                {
                    dtCart.Rows.RemoveAt(i);
                    break;
                }
            }
            System.Web.HttpContext.Current.Session["cart"] = dtCart;
        }


        public DataTable getDiscountCode(string maGiamGia)
        {
            string query = "Select * from MaGiamGia where maGiamGia = @maGiamGia";
            SqlCommand sqlCommand = new SqlCommand(query);
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.Parameters.AddWithValue("@maGiamGia", maGiamGia);
            return connectionSQL.GetData(sqlCommand);
        }
    }
}