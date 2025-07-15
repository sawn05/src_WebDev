<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="WebApplication1.aspx.product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sản phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/wishlist.css">
    <link rel="stylesheet" href="../style/responsive-header-footer.css">
    <link rel="stylesheet" href="../style/product-detail.css">
    <link rel="stylesheet" href="../style/product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header top -->
        <div id="wrapper">
            <div class="header-top">
                <div id="topbar">
                    <div class="text">
                        <p class="topbar">Hotline: 0123456789</p>
                        <p class="shop-now">Mua ngay</p>
                    </div>
                    <div id="btnRegister_Login" class="btnRegister-Login" runat="server">
                        <div id="signUp" class="btnIO btnRegister" runat="server">
                            <a href="../aspx/signUp.aspx">Đăng ký</a>
                        </div>
                        <div id="signIn" class="btnIO btnLogin" runat="server">
                            <a href="../aspx/login.aspx">Đăng nhập</a>
                        </div>
                    </div>
                </div>

                <div id="header">
                    <a href="../aspx/home.aspx" class="logo">
                        <img src="../assets/img/logo/logotest.png" alt="">
                    </a>
                    <div id="menu">
                        <div class="item">
                            <a href="../aspx/home.aspx">Trang chủ</a>
                        </div>
                        <div class="item">
                            <a class="active" href="../aspx/product.aspx">Sản phẩm</a>
                        </div>
                        <div class="item">
                            <a href="../aspx/about.aspx">Giới thiệu</a>
                        </div>
                        <div class="item">
                            <a href="../aspx/contact.aspx">Liên hệ</a>
                        </div>
                    </div>

                    <div id="action">
                        <div class="item">
                            <a href="../aspx/wishlist.aspx" class="fa-regular fa-heart"></a>
                        </div>
                        <div class="item">
                            <a href="../aspx/profile/profile.aspx" class="fa-regular fa-circle-user"></a>
                        </div>
                        <div class="item">
                            <a href="../aspx/cart.aspx" class="fa-solid fa-cart-shopping"></a>
                        </div>
                    </div>

                    <div class="mobile-menu" id="bar">
                        <div class="item">
                            <i class="fa-solid fa-bars"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Content -->
        <div class="content">
            <div class="content-left">
                <div class="filter-section">
                    <div class="filter-toggle-wrapper">
                        <a class="filter-toggle-btn" href="#">
                            <span class="icon fas fa-filter"></span>
                            <span class="toggle-title">Bộ lọc</span>
                        </a>


                        <div class="search-bar">
                            <input type="text" placeholder="Tìm kiếm" runat="server" id="txtTimKiem" />
                            <button class="keyboard-btn"><i class="fas fa-keyboard"></i></button>
                            
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="search-btn" OnClick="btnSearch_Click">
                                <i class="fas fa-search"></i>
                            </asp:LinkButton>
                        </div>
                    </div>


                    <form action="" method="GET" id="filter-form">
                        <input type="hidden" name="layout" value="product-right-sidebar"/>

                        <div class="filter-panel">
                            <div class="row">
                                <div class="filter-group">
                                    <h5 class="filter-title">Danh mục</h5>
                                    <div class="filter-options scrollable">
                                        <asp:Repeater ID="rptCategory" runat="server">
                                            <ItemTemplate>
                                                <div class="category-item">
                                                    <asp:CheckBox ID="chkCategory" runat="server" Text='<%# Eval("tenTheLoai") %>' />
                                                    <asp:HiddenField ID="hdMaTheLoai" runat="server" Value='<%# Eval("maTheLoai") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>

                                <div class="filter-group">
                                    <h5 class="filter-title">Nhà cung cấp</h5>
                                    <div class="filter-options">


                                        <asp:Repeater ID="rptSupplier" runat="server">
                                            <ItemTemplate>
                                                <div class="supplier-item">
                                                    <asp:CheckBox ID="chkSupplier" runat="server" Text='<%# Eval("tenNCC") %>' />
                                                    <asp:HiddenField ID="hdMaNCC" runat="server" Value='<%# Eval("maNCC") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        
                                    </div>
                                </div>

                                <div class="filter-group">
                                    <div class="price-range">
                                        <h3>Theo Giá</h3>
                                        Từ:
                                        <input type="number" id="start" runat="server" />
                                        Đến:
                                        <input type="number" id="end" runat="server" />
                                    </div>
                                </div>
                            </div>

                            <div>
                                <asp:LinkButton ID="btnFilter" CssClass="btnFilter" runat="server" Text="Lọc" OnClick="btnFilter_Click"></asp:LinkButton>
                            </div>
                        </div>
                    </form>
                </div>
                
                <div class="infomation">
                    <asp:Label ID="lbNumProduct" runat="server">
                        Chúng tôi đã tìm thấy
                        <span class="num-product-filter">
                            <asp:Literal ID="ltNumProduct" runat="server" Text="0" />
                        </span>sản phẩm cho bạn
                    </asp:Label>
                   <%-- <p>
                        Chúng tôi đã tìm thấy 
                        <span class="num-product-filter">
                            <asp:Literal ID="ltNumProduct" runat="server" Text="0" />
                        </span>sản phẩm cho bạn
                    </p>--%>
                        
                    <div class="sort-dropdown">
                        <button id="sortToggle" type="button">
                            <i class="fa-solid fa-arrow-down-wide-short"></i>Sắp xếp theo: 
                            <span id="currentSort"><asp:Literal ID="ltCurrentSort" runat="server" Text="Mặc định" /></span>
                            <i class="fa fa-angle-down"></i>
                        </button>
                        <ul class="sort-menu hidden" id="sortMenu">
                            <li data-value="default" class="active">Mặc định</li>
                            <li data-value="sale">Giảm giá sâu nhất</li>
                            <li data-value="review">Lượt đánh giá</li>
                            <li data-value="price-low-high">Giảm dần theo giá</li>
                            <li data-value="price-high-low">Tăng dần theo giá</li>
                            <li data-value="rating-low-high">Tăng dần theo số lượng</li>
                            <li data-value="rating-high-low">Giảm dần theo số lượng</li>
                        </ul>
                        <asp:HiddenField ID="hfSortOption" runat="server" />
                    </div>
                </div>

                <div class="product">
                    <ul class="product-list">
                        <asp:Repeater ID="rptProductCard" runat="server">
                            <ItemTemplate>
                                <li class="product-card">
                                    <div class="product-img" style="padding: 25px 0px; position: relative; text-align: center; border-radius: 8px; background: rgb(245, 245, 245); overflow: hidden; margin-bottom: 20px; height: 45%; display: flex; justify-content: center; align-items: center;">
                                        <div class="label sale">
                                            <%# "-" + (Convert.ToDouble(Eval("giamGia"))) + "%" %>
                                        </div>
                                        <a href='product-detail.aspx?id=<%# Eval("maSP") %>&maTheLoai=<%# Eval("maTheLoai") %>' style="color: #000000">
                                            <i class="fa-regular fa-eye"></i>
                                            <img src='../assets/img/book/<%# Eval("hinhAnhSanPham") %>' alt="Product" />
                                        </a>
                                        <button class="add-to-cart">🛒 Thêm vào giỏ hàng</button>
                                    </div>

                                    <div class="product-info">
                                        <h4><%#:Eval("tenSP")%></h4>
                                        <div class="price">
                                            <span>
                                                <%#String.Format("{0:#,##0} VNĐ", Convert.ToDouble(Eval("donGia")) * 
                                                (1 - Convert.ToDouble(Eval("giamGia")) / 100.0))%>
                                            </span>
                                            <del>
                                                <%# String.Format("{0:C0}", Eval("donGia")) %>
                                            </del>
                                        </div>

                                        <div class="stars">
                                            <%# RenderStars(Convert.ToDouble(Eval("danhGia"))) %> ( <%# Eval("luotDanhGia") %> )
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

                <div class="pagination">
                    <asp:Button ID="btnPrev" runat="server" Text="&lt;" OnClick="btnPrev_Click" />
                    <asp:Label ID="lblCurrentPage" runat="server" />
                    /
                    <asp:Label ID="lblTotalPages" runat="server" />
                    <asp:Button ID="btnNext" runat="server" Text="&gt;" OnClick="btnNext_Click" />
                </div>

            </div>

            <div class="content-right">
                <ul class="categories-list">
                    <p>Danh mục sản phẩm</p>

                    <asp:Repeater ID="rptCategory_item" runat="server">
                        <ItemTemplate>
                            <li class="category-item">
                                <a
                                    href='?maTL=<%# Eval("maTheLoai") %>'
                                    class='<%# (Request.QueryString["maTL"] != null && Request.QueryString["maTL"].ToString() == Eval("maTheLoai").ToString()) ? "active" : "" %>'>- <%# Eval("tenTheLoai") %>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>

                </ul>
                <ul class="product-outstanding">
                    <p>Sản phẩm nổi bật</p>
                    <asp:Repeater ID="rptProductOutstanding" runat="server">
                        <ItemTemplate>
                            <li class="product-item">
                                <div class="product-thumb">
                                    <a href='product-detail.aspx?id=<%# Eval("maSP") %>&maTheLoai=<%# Eval("maTheLoai") %>' style="color: #000000">
                                        <i class="fa-regular fa-eye"></i>
                                        <img src='../assets/img/book/<%# Eval("hinhAnhSanPham") %>' alt="Product" />
                                    </a>
                                </div>
                                <div class="product-info">
                                    <h4><%#:Eval("tenSP")%></h4>
                                    <div class="price">
                                        <span>
                                            <%#String.Format("{0:#,##0} VNĐ", Convert.ToDouble(Eval("donGia")) * 
                                                (1 - Convert.ToDouble(Eval("giamGia")) / 100.0))%>
                                        </span>
                                        <del>
                                            <%# String.Format("{0:C0}", Eval("donGia")) %>
                                        </del>
                                    </div>

                                    <div class="stars">
                                        <%# RenderStars(Convert.ToDouble(Eval("danhGia"))) %> ( <%# Eval("luotDanhGia") %> )
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>



        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col">
                        <h4>Chăm sóc khách hàng</h4>
                        <ul>
                            <li><a href="#">Hướng dẫn thanh toán</a></li>
                            <li><a href="#">Chính sách bảo hành</a></li>
                            <li><a href="#">Chỉnh sách bảo mật</a></li>
                            <li><a href="#">Hoàn trả hàng</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Danh mục</h4>
                        <ul>
                            <li><a href="#">Sách</a></li>
                            <li><a href="#">Truyện</a></li>
                            <li><a href="#">Báo</a></li>
                            <li><a href="#">Đồ chơi</a></li>
                            <li><a href="#">Thiết bị công nghệ</a></li>
                            <li><a href="#">Dụng cụ học tập</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Về chúng tôi</h4>
                        <ul>
                            <li><a href="#">Giới thiệu</a></li>
                            <li><a href="#">Liên hệ</a></li>
                            <li><a href="#">Điều khoản sử dụng</a></li>
                            <li><a href="#">Trợ giúp</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Thông tin liên hệ</h4>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>




        <script>
            if (typeof (__doPostBack) !== 'function') {
                function __doPostBack(eventTarget, eventArgument) {
                    var theForm = document.forms['form1'];
                    if (!theForm) {
                        theForm = document.form1;
                    }
                    if (!theForm.__EVENTTARGET) {
                        var input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = '__EVENTTARGET';
                        theForm.appendChild(input);
                    }
                    theForm.__EVENTTARGET.value = eventTarget;

                    if (!theForm.__EVENTARGUMENT) {
                        var input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = '__EVENTARGUMENT';
                        theForm.appendChild(input);
                    }
                    theForm.__EVENTARGUMENT.value = eventArgument;

                    theForm.submit();
                }
            }

            document.addEventListener("DOMContentLoaded", function () {
                const sortToggle = document.getElementById("sortToggle");
                const sortMenu = document.getElementById("sortMenu");
                const sortOptions = sortMenu.querySelectorAll("li");
                const currentSort = document.getElementById("currentSort");
                const hfSortOption = document.getElementById("<%= hfSortOption.ClientID %>");

                // Toggle ẩn/hiện menu khi click nút
                sortToggle.addEventListener("click", function (e) {
                    e.preventDefault();
                    sortMenu.classList.toggle("hidden");
                });

                // Xử lý khi chọn 1 tùy chọn sắp xếp
                sortOptions.forEach(option => {
                    option.addEventListener("click", function () {
                        sortOptions.forEach(i => i.classList.remove("active"));
                        this.classList.add("active");

                        const value = this.dataset.value;
                        const text = this.textContent;

                        currentSort.textContent = text;
                        hfSortOption.value = value;

                        sortMenu.classList.toggle("hidden");

                        // Gửi yêu cầu postback tới server để sắp xếp lại
                        __doPostBack('', '');
                    });
                });

                // Ẩn menu khi click ra ngoài
                document.addEventListener("click", function (e) {
                    if (!sortToggle.contains(e.target) && !sortMenu.contains(e.target)) {
                        sortMenu.classList.add("hidden");
                    }
                });
            });


            document.addEventListener("DOMContentLoaded", function () {
                const sortItems = document.querySelectorAll("#sortMenu li");
                const hfSort = document.getElementById('<%= hfSortOption.ClientID %>');

                sortItems.forEach(item => {
                    item.addEventListener("click", function () {
                        // Lấy giá trị
                        const selectedValue = this.getAttribute("data-value");
                        hfSort.value = selectedValue;

                        // Gọi postback (tự động gọi lại Page_Load)
                        __doPostBack('', '');
                    });
                });
            });


            document.addEventListener("DOMContentLoaded", function () {
                const logoutBtn = document.getElementById("logoutBtn");
                if (logoutBtn) {
                    logoutBtn.addEventListener("click", function (e) {
                        e.preventDefault();
                        window.location.href = "../aspx/logout.aspx";
                    });
                }
            });


        </script>
    </form>
</body>
</html>
