using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebApplication1.data;

namespace WebApplication1.aspx
{
    public partial class product : System.Web.UI.Page
    {
        data.Product _product = new data.Product();
        data.ConnectionSQL connectionSQL = new data.ConnectionSQL();
        private string maTheLoai = "";


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

                LoadCategory();
                LoadSupplier();

                
                LoadProductOutstanding();

            }
            LoadProduct();



            maTheLoai = Request.QueryString["maTL"];
            if (!string.IsNullOrEmpty(maTheLoai))
            {
                LoadProductByCategory(maTheLoai);
            }
        }


        protected void btnPrev_Click(object sender, EventArgs e)
        {
            maTheLoai = Request.QueryString["maTL"];
            if (currentPage > 1)
            {
                currentPage--;
                if (txtTimKiem.Value != "")
                {
                    LoadProductByNameProduct(txtTimKiem.Value);
                }
                else if (!string.IsNullOrEmpty(maTheLoai))
                {
                    LoadProductByCategory(maTheLoai);
                }

                else LoadProduct();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            if (txtTimKiem.Value != "")
            {
                LoadProductByNameProduct(txtTimKiem.Value);
            }
            else if (!string.IsNullOrEmpty(maTheLoai))
            {
                LoadProductByCategory(maTheLoai);
            }
            else LoadProduct();
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

        public int currentPage
        {
            get
            {
                return ViewState["currentPage"] == null ? 1 : (int)ViewState["currentPage"];
            }
            set
            {
                ViewState["currentPage"] = value;
            }
        }

        public void ViewSort(DataTable dt)
        {
            string sortOption = hfSortOption.Value;

            if (!string.IsNullOrEmpty(sortOption))
            {
                switch (sortOption)
                {
                    case "sale":
                        dt.DefaultView.Sort = "giamGia DESC";
                        ltCurrentSort.Text = "Giảm giá sâu nhất";
                        break;
                    case "review":
                        dt.DefaultView.Sort = "luotDanhGia DESC";
                        ltCurrentSort.Text = "Lượt đánh giá";
                        break;
                    case "price-low-high":
                        dt.DefaultView.Sort = "giaMoi DESC";
                        ltCurrentSort.Text = "Giảm dần theo giá";
                        break;
                    case "price-high-low":
                        dt.DefaultView.Sort = "giaMoi ASC";
                        ltCurrentSort.Text = "Tăng dần theo giá";
                        break;
                    case "rating-low-high":
                        dt.DefaultView.Sort = "slTon ASC";
                        ltCurrentSort.Text = "Tăng dần theo số lượng";
                        break;
                    case "rating-high-low":
                        dt.DefaultView.Sort = "slTon DESC";
                        ltCurrentSort.Text = "Giảm dần theo số lượng";
                        break;
                    default:
                        ltCurrentSort.Text = "Mặc định";
                        break;
                }
            }

            if (dt.Rows.Count > 0)
            {
                BindDataWithPaging(dt);
            }
        }


        public void LoadProduct()
        {
            DataTable dt = _product.getListProduct();
            ViewSort(dt);
        }


        public void LoadProductByCategory(string maTheLoai)
        {
            DataTable dt = _product.GetProductByCategoryCode(maTheLoai);
            ViewSort(dt);
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

        public void LoadProductByNameProduct(string nameProduct)
        {
            DataTable dt = _product.getProductByNameProduct(nameProduct);
            ViewSort(dt);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtTimKiem.Value)){
                currentPage = 1;
                string nameProduct = txtTimKiem.Value;
                LoadProductByNameProduct(nameProduct);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alertSuccess", "alert('Vui lòng nhập thông tin tìm kiếm!');", true);
            }
        }


        private void BindDataWithPaging(DataTable dt)
        {
            PagedDataSource pagedData = new PagedDataSource();
            pagedData.DataSource = dt.DefaultView;
            pagedData.AllowPaging = true;
            pagedData.PageSize = 10;
            pagedData.CurrentPageIndex = currentPage - 1;

            rptProductCard.DataSource = pagedData;
            rptProductCard.DataBind();

            ltNumProduct.Text = dt.Rows.Count.ToString();
            lblTotalPages.Text = pagedData.PageCount.ToString();
            lblCurrentPage.Text = currentPage.ToString();

            btnPrev.Enabled = !pagedData.IsFirstPage;
            btnNext.Enabled = !pagedData.IsLastPage;
        }


        public void LoadCategory()
        {
            DataTable dt = _product.GetAllCategoryName();
            rptCategory.DataSource = dt;
            rptCategory.DataBind();

            rptCategory_item.DataSource = dt;
            rptCategory_item.DataBind();
        }

        public void LoadSupplier()
        {
            DataTable dt = _product.GetAllSupplier();
            rptSupplier.DataSource = dt;
            rptSupplier.DataBind();
        }




        public void LoadFilter(string query)
        {
            DataTable dt = _product.searchProductByFilter(query);

            if (dt.Rows.Count >= 0)
            {
                PagedDataSource pagedData = new PagedDataSource();
                pagedData.DataSource = dt.DefaultView;
                pagedData.AllowPaging = true;

                // Cần update khi có rất nhiều sản phẩm
                pagedData.PageSize = dt.Rows.Count;
                pagedData.CurrentPageIndex = currentPage - 1;

                rptProductCard.DataSource = pagedData;
                rptProductCard.DataBind();

                ltNumProduct.Text = dt.Rows.Count.ToString();
                lblTotalPages.Text = pagedData.PageCount.ToString();
                lblCurrentPage.Text = currentPage.ToString();
            }


            string sortOption = hfSortOption.Value;

            if (!string.IsNullOrEmpty(sortOption))
            {
                switch (sortOption)
                {
                    case "sale":
                        dt.DefaultView.Sort = "giamGia DESC";
                        ltCurrentSort.Text = "Giảm giá sâu nhất";
                        break;
                    case "review":
                        dt.DefaultView.Sort = "luotDanhGia DESC";
                        ltCurrentSort.Text = "Lượt đánh giá";
                        break;
                    case "price-low-high":
                        dt.DefaultView.Sort = "giaMoi DESC";
                        ltCurrentSort.Text = "Giảm dần theo giá";
                        break;
                    case "price-high-low":
                        dt.DefaultView.Sort = "giaMoi ASC";
                        ltCurrentSort.Text = "Tăng dần theo giá";
                        break;
                    case "rating-low-high":
                        dt.DefaultView.Sort = "slTon ASC";
                        ltCurrentSort.Text = "Tăng dần theo số lượng";
                        break;
                    case "rating-high-low":
                        dt.DefaultView.Sort = "slTon DESC";
                        ltCurrentSort.Text = "Giảm dần theo số lượng";
                        break;
                    default:
                        ltCurrentSort.Text = "Mặc định";
                        break;
                }
            }

            
        }



        protected void btnFilter_Click(object sender, EventArgs e)
        {
            List<string> selectedCategories = new List<string>();

            foreach (RepeaterItem item in rptCategory.Items)
            {
                CheckBox chk = (CheckBox)item.FindControl("chkCategory");
                HiddenField hd = (HiddenField)item.FindControl("hdMaTheLoai");

                if (chk != null && chk.Checked && hd != null)
                {
                    selectedCategories.Add(hd.Value.Trim());
                }
            }



            List<string> selectedSupplier = new List<string>();

            foreach (RepeaterItem item in rptSupplier.Items)
            {
                CheckBox chk = (CheckBox)item.FindControl("chkSupplier");
                HiddenField hd = (HiddenField)item.FindControl("hdMaNCC");

                if (chk != null && chk.Checked && hd != null)
                {
                    selectedSupplier.Add(hd.Value.Trim());
                }
            }

            float startPrice;
            float endPrice;

            if (!string.IsNullOrEmpty(start.Value))
                float.TryParse(start.Value, out startPrice);
            else
            {
                startPrice = 0;
            }

            if (!string.IsNullOrEmpty(end.Value))
                float.TryParse(end.Value, out endPrice);
            else
            {
                endPrice = 1000000000f; 
            }

            StringBuilder sql = new StringBuilder("SELECT *, donGia * (1 - giamGia / 100.0) AS giaMoi FROM SanPham WHERE 1=1");

            if (selectedCategories.Count > 0)
            {
                string whereTheLoai = string.Join(",", selectedCategories.Select(s => $"'{s}'"));
                sql.Append($" AND maTheLoai IN ({whereTheLoai})");
            }


            if (selectedSupplier.Count > 0)
            {
                string whereNCC = string.Join(",", selectedSupplier.Select(s => $"'{s}'"));
                sql.Append($" AND maNCC IN ({whereNCC})");
            }
            sql.Append($" AND donGia * (1 - giamGia / 100.0) BETWEEN {startPrice} AND {endPrice}");

            LoadFilter(sql.ToString());
        }
    }
}