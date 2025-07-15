using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx.admin
{
    public partial class product : System.Web.UI.UserControl
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
            rptProductList.DataSource = _product.getListProduct();
            rptProductList.DataBind();
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            mul.ActiveViewIndex = 1;
        }

        protected void btnConfirmAddProduct_Click(object sender, EventArgs e)
        {
            string fileName = "";

            if (fuImage.HasFile)
            {
                fileName = Path.GetFileName(fuImage.FileName);

                string savePath = Server.MapPath("~/assets/img/book/" + fileName);

                if (!Directory.Exists(Path.GetDirectoryName(savePath)))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(savePath));
                }

                // Lưu file lên thư mục
                fuImage.SaveAs(savePath);
            }

            string imagePath = fileName;

            string maSP = txtMaSP.Text;
            string tenSP = txtTenSP.Text;
            int soLuong = Convert.ToInt32(txtSoLuong.Text);
            if (!decimal.TryParse(txtGiaGoc.Text, out decimal donGia))
            {
                ltMessage.Text = "<span style='color: red;'>Vui lòng nhập đúng định dạng đơn giá</span>";
            }
            if (!decimal.TryParse(txtGiamGia.Text, out decimal giamGia))
            {
                ltMessage.Text = "<span style='color: red;'>Vui lòng nhập đúng định dạng giảm giá</span>";
            }
            if (float.TryParse(txtDanhGia.Text, out float danhGia))
            {
                if (danhGia < 1 || danhGia > 5)
                {
                    ltMessage.Text = "<span style='color: red;'>Đánh giá chỉ từ 1* - 5*</span>";
                }
            }

            
            string moTa = txtMoTa.Text;

            string maTheLoai = ddlMaTheLoai.SelectedItem.Text;
            string maNCC = ddlNCC.SelectedValue;


            if (!string.IsNullOrEmpty(maSP.Trim()) && !string.IsNullOrEmpty(tenSP.Trim()) 
                && !string.IsNullOrEmpty(moTa.Trim()) && maTheLoai != "default" && maNCC != "default" 
                && !string.IsNullOrEmpty(danhGia.ToString().Trim())
                && !string.IsNullOrEmpty(giamGia.ToString().Trim())
                && !string.IsNullOrEmpty(donGia.ToString().Trim())
                && !string.IsNullOrEmpty(soLuong.ToString().Trim()))
            {
                DataTable dt = _product.getProductDetail_byProductID(maSP.Trim());
                if (dt.Rows.Count > 0)
                {
                    ltMessage.Text = "<span style='color: red;'>Mã sản phẩm đã tồn tại</span>";
                }
                else
                {
                    _product.Insert(maSP.Trim(), tenSP.Trim(), donGia, maTheLoai.Trim(), maNCC.Trim(), soLuong, giamGia, danhGia, imagePath.Trim(), moTa.Trim());
                    ltMessage.Text = "<span style='color: green;'>Thêm thành công!</span>";
                    Response.Redirect(Request.Url.ToString());
                }
            }
            else
            {
                ltMessage.Text = "<span style='color: red;'>Vui lòng nhập đủ thông tin</span>";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            mul.ActiveViewIndex = 0;
        }

        protected void rptProductList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                string maSP = e.CommandArgument.ToString();
                _product.Delete(maSP);
                LoadData();
            }
        }
    }
}