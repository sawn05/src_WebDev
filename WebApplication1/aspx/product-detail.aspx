<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product-detail.aspx.cs" Inherits="WebApplication1.aspx.product_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carabook</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/wishlist.css">
    <link rel="stylesheet" href="../style/responsive-header-footer.css">
    <link rel="stylesheet" href="../style/product-detail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server" method="post">
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

        <div class="content">
            <div class="content-left">
                <div class="book-container">
                    <div class="book-image">
                        <asp:Image ID="imgProduct" runat="server" />
                    </div>
                    <div class="book-info">
                        <h2><asp:Literal ID="ltTenSP" runat="server"></asp:Literal></h2>
                        <div class="stars">
                            <asp:Literal ID="ltStars" runat="server" />
                        </div>
                        <div class="price">
                            <span>
                                <asp:Literal ID="ltGiaSauGiam" runat="server" /></span>
                        </div>

                        <div class="actions">
                            <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="quantity"
                                type="number" min="1" Style="width: 50px; padding: 3px; padding-left: 10px" />

                            <asp:LinkButton ID="lnkAddToCart" CssClass="cart-btn" runat="server" OnClick="lnkAddToCart_Click">THÊM VÀO GIỎ</asp:LinkButton>
                            <button class="buy-btn">MUA NGAY</button>
                            <button class="like-btn"><i class="fa-regular fa-heart"></i></button>
                        </div>
                        <div class="extra-info">
                            <p>Danh mục: <asp:Literal ID="ltTheLoai" runat="server" /></p>
                            <p>Tình trạng: <span class="status">Còn hàng</span></p>
                        </div>
                    </div>
                </div>

                <div class="desc">
                    <div class="section-label">
                        <div class="dot"></div>
                        <h3>Mô tả</h3>
                    </div>
                    <p>
                        <asp:Literal ID="ltMoTa" runat="server" />
                    </p>
                </div>

                <div class="section-label">
                    <div class="dot"></div>
                    <h3>Sản phẩm liên quan</h3>
                    <button class="btn-see-all">Xem tất cả</button>
                </div>

                <ul class="product-list">
                    <asp:Repeater ID="rptWatchMore" runat="server">
                        <ItemTemplate>
                            <li class="product-card">
                                <div class="product-img">
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
            <div class="content-right">
                <ul class="categories-list">
                    <p>Danh mục sản phẩm</p>
                    <li class="category-item">
                        <a href="#">- Sách</a>
                    </li>
                    <li class="category-item">
                        <a href="#">- Truyện</a>
                    </li>
                    <li class="category-item">
                        <a href="#">- Báo</a>
                    </li>
                    <li class="category-item">
                        <a href="#">- Đồ chơi</a>
                    </li>
                    <li class="category-item">
                        <a href="#">- Thiết bị công nghệ</a>
                    </li>
                    <li class="category-item">
                        <a href="#">- Dụng cụ học tập</a>
                    </li>
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
    </form>


    <script>
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
</body>
</html>
