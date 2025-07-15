using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx.admin
{
    public partial class post_outstandingControl : System.Web.UI.UserControl
    {
        data.Post_outstanding _outstanding = new data.Post_outstanding();
        data.ConnectionSQL connectionSQL = new data.ConnectionSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }
        public void loadData()
        {
            rptPostOutstandingControl.DataSource = _outstanding.getList();
            rptPostOutstandingControl.DataBind();
        }

        protected void linkAddPost_Click(object sender, EventArgs e)
        {
            hdInsert.Value = "insert";
            txtTenChuDe.Text = "";
            txtNoiDung.Text = "";
            ddlMaTheLoai.SelectedValue = "default";
            mul.ActiveViewIndex = 1;

        }

        protected void btnAddPost_Click(object sender, EventArgs e)
        {
            if(hdInsert.Value == "insert")
            {
                string fileName = "";

                if (fuImage.HasFile)
                {
                    fileName = Path.GetFileName(fuImage.FileName);

                    string savePath = Server.MapPath("~/assets/img/post-outstanding/" + fileName);

                    if (!Directory.Exists(Path.GetDirectoryName(savePath)))
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(savePath));
                    }

                    // Lưu file lên thư mục
                    fuImage.SaveAs(savePath);
                }

                string imagePath = fileName;

                string tenChuDe = txtTenChuDe.Text;
                string noiDung = txtNoiDung.Text;
                string maTheLoai = ddlMaTheLoai.SelectedItem.Text;

                if (!string.IsNullOrEmpty(tenChuDe.Trim()) && !string.IsNullOrEmpty(noiDung.Trim()) && !string.IsNullOrEmpty(imagePath.Trim()) && maTheLoai != "default")
                {
                    _outstanding.Insert(tenChuDe.Trim(), imagePath.Trim(), noiDung.Trim(), maTheLoai.Trim());
                    ltMessage.Text = "<span style='color: green;'>Thêm thành công!</span>";
                    Response.Redirect(Request.Url.ToString());
                }
                else
                {
                    ltMessage.Text = "<span style='color: red;'>Vui lòng nhập đủ thông tin</span>";
                    return;
                }
            }
            else // Update
            {
                string fileName = "";

                if (fuImage.HasFile)
                {
                    fileName = Path.GetFileName(fuImage.FileName);

                    string savePath = Server.MapPath("~/assets/img/post-outstanding/" + fileName);

                    if (!Directory.Exists(Path.GetDirectoryName(savePath)))
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(savePath));
                    }

                    // Lưu file lên thư mục
                    fuImage.SaveAs(savePath);
                }

                string imagePath = fileName;

                string tenChuDe = txtTenChuDe.Text;
                string noiDung = txtNoiDung.Text;
                string maTheLoai = ddlMaTheLoai.SelectedItem.Text;

                if (!string.IsNullOrEmpty(tenChuDe.Trim()) && !string.IsNullOrEmpty(noiDung.Trim()) && !string.IsNullOrEmpty(imagePath.Trim()) && maTheLoai != "default")
                {
                    _outstanding.Update(hdPostID.Value, tenChuDe.Trim(), imagePath.Trim(), noiDung.Trim(), maTheLoai.Trim());
                    ltMessage.Text = "<span style='color: green;'>Cập nhật thành công!</span>";
                    Response.Redirect(Request.Url.ToString());
                }
                else
                {
                    ltMessage.Text = "<span style='color: red;'>Vui lòng nhập đủ thông tin</span>";
                    return;
                }
            }




            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            bool check = false;
            foreach (RepeaterItem item in rptPostOutstandingControl.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("cbSelect");
                HiddenField hfID = (HiddenField)item.FindControl("hfMaChuDe");

                if (cb != null && cb.Checked)
                {
                    string maChuDe = hfID.Value;
                    _outstanding.Delete(maChuDe);
                    check = true;
                }
                else
                {
                    ltError.Text = "<span style='color: red;'>Vui lòng chọn bài viết muốn xóa</span>";
                    //return;
                }
            }

            if(check) ltError.Text = "<span style='color: green;'>Xóa thành công</span>";

            loadData(); 
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            mul.ActiveViewIndex = 0;
            ltError.Text = "";
        }

        protected void rptPostOutstandingControl_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch (e.CommandName.ToString())
            {
                case "update":
                    dt = _outstanding.GetListPostByID(e.CommandArgument.ToString());
                    if (dt.Rows.Count > 0)
                    {
                        txtTenChuDe.Text = dt.Rows[0]["tenChuDe"].ToString();
                        txtNoiDung.Text = dt.Rows[0]["noiDung"].ToString();
                        ddlMaTheLoai.SelectedValue = dt.Rows[0]["maTheLoai"].ToString();

                        hdPostID.Value = e.CommandArgument.ToString();
                        hdInsert.Value = "update";
                        mul.ActiveViewIndex = 1;
                    }

                    break;
            }
        }
    }
}