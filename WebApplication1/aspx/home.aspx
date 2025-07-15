<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication1.aspx.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carabook</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/responsive-header-footer.css"/>
    <link rel="stylesheet" href="../style/home.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
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
                        <img src="../assets/img/logo/logotest.png" alt=""/>
                    </a>
                    <div id="menu">
                        <div class="item">
                            <a class="active" href="../aspx/home.aspx">Trang chủ</a>
                        </div>
                        <div class="item">
                            <a href="../aspx/product.aspx">Sản phẩm</a>
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

            <div class="banner">
                <div class="box-left">
                    <h2>
                        <span>Ưu đãi siêu giá trị</span>
                        <br/>
                        <span>Dành cho khách hàng lần đầu tiên mua hàng</span>
                    </h2>
                    <p>Giảm ngay 300k cho đơn hàng đầu tiên dành cho thành viên mới</p>
                    <button>Xem ngay</button>
                </div>
            </div>

            <div id="deals">
                <div class="deal free-ship">
                    <img src="../assets/img/Service/free-ship.png" alt=""/>
                    <div class="text">
                        <h4>Miễn phí ship</h4>
                        <p>Đơn hàng trên 1 triệu</p>
                    </div>
                </div>
                <div class="deal free-return">
                    <img src="../assets/img/Service/free-return.png" alt=""/>
                    <div class="text">
                        <h4>Miễn phí trả hàng</h4>
                        <p>Trong 30 ngày</p>
                    </div>
                </div>
                <div class="deal free-deal">
                    <img src="../assets/img/Service/free-deal.png" alt=""/>
                    <div class="text">
                        <h4>Nhận ưu đãi 30%</h4>
                        <p>Khi đăng ký thành viên</p>
                    </div>
                </div>
                <div class="deal help">
                    <img src="../assets/img/Service/help.png" alt=""/>
                    <div class="text">
                        <h4>Hỗ trợ 24/24</h4>
                        <p>Dịch vụ Hỗ trợ 24/24</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <!-- Thể loại (Duyệt theo danh mục) -->
            <div class="categories-header">
                <div class="left-label">
                    <div class="text-red">
                        <div class="dot"></div>
                        <div class="categories">Thể loại</div>
                    </div>
                    <div class="categories-title">Duyệt theo danh mục</div>
                </div>
                <div class="categories-list">
                    <div class="categorie first">
                        <a href="product.aspx?maTL=DCGD" style="text-decoration: none;">
                            <img src="../assets/img/Categories/toy.png" alt="" />
                            <div class="text">
                                <h4>Đồ chơi giáo dục</h4>
                            </div>
                        </a>
                    </div>

                    <div class="categorie second">
                        <a href="product.aspx?maTL=DCHT" style="text-decoration: none;">
                            <img src="../assets/img/Categories/learning-tools.png" alt="" />
                            <div class="text">
                                <h4>Dụng cụ học tập</h4>
                            </div>
                        </a>
                    </div>

                    <div class="categorie third">
                        <a href="product.aspx?maTL=SACH" style="text-decoration: none;">
                            <img src="../assets/img/Categories/book.png" alt="" />
                            <div class="text">
                                <h4>Sách</h4>
                            </div>
                        </a>
                    </div>

                    <div class="categorie fourth">
                        <a href="product.aspx?maTL=TCVB" style="text-decoration: none;">
                            <img src="../assets/img/Categories/newspaper.png" alt="" />
                            <div class="text">
                                <h4>Báo</h4>
                            </div>
                        </a>
                    </div>

                    <div class="categorie fifth">
                        <a href="product.aspx?maTL=TRUYEN" style="text-decoration: none;">
                            <img src="../assets/img/Categories/story.png" alt="" />
                            <div class="text">
                                <h4>Truyện</h4>
                            </div>
                        </a>
                    </div>

                    <div class="categorie sixth">
                        <a href="product.aspx?maTL=TBCN" style="text-decoration: none;">
                            <img src="../assets/img/Categories/technology.png" alt="" />
                            <div class="text">
                                <h4>Thiết bị công nghệ</h4>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Sản phẩm bán chạy -->
            <div class="bestSelling-header">
                <div class="left-label">
                    <div class="text-red">
                        <div class="dot"></div>
                        <div class="best-selling">Tháng này</div>
                    </div>
                    <div class="selling-title">Sản phẩm bán chạy</div>
                </div>


                <ul class="product-list">
                    <asp:Repeater ID="rptBestSellingProduct" runat="server">
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

                                    
                                    <asp:LinkButton ID="lnkAddToCart" CssClass="add-to-cart" runat="server" OnClick="lnkAddToCart_Click">🛒 Thêm vào giỏ hàng</asp:LinkButton>
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

            <!-- Tính năng ưu đãi khách hàng -->
            <div class="feature-footer">
                <ul>
                    <li class="feature-item item1">
                        <div class="text-left">
                            <p class="text-title">Khuyến mãi</p>
                            <p class="text-content">Giảm giá 30%<br>
                                Trọn bộ combo</p>
                            <a href="" class="watch-now">Xem ngay
                            <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="image-right">
                            <img src="../assets/img/book/khuyenmai.png" alt="Khuyến mãi">
                        </div>
                    </li>
                    <li class="feature-item item2">
                        <div class="text-left">
                            <p class="text-title">Giảm 300k</p>
                            <p class="text-content">Bộ sưu tập<br>
                                Sách giáo dục</p>
                            <a href="" class="watch-now">Xem ngay
                            <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="image-right">
                            <img src="../assets/img/book/giam300k.png" alt="Khuyến mãi">
                        </div>
                    </li>

                    <li class="feature-item item3">
                        <div class="text-left">
                            <p class="text-title">Mới nhất</p>
                            <p class="text-content">Hàng mới<br>
                                Trọn bộ luyện thi</p>
                            <a href="" class="watch-now">Xem ngay
                            <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="image-right">
                            <img src="../assets/img/book/moinhat.png" alt="Khuyến mãi">
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Bài viết nổi bật -->
            <div class="post-outstanding">
                <div class="left-label">
                    <div class="text-red">
                        <div class="dot"></div>
                        <div class="read-more">Xem thêm</div>
                    </div>
                    <div class="document">Bài viết nổi bật</div>
                </div>

                <!-- Contents -->
                <ul class="post-list">
                    <asp:Repeater ID="rptPostList" runat="server">
                        <ItemTemplate>
                            <li>
                                <div class="post-content">
                                    <img src='../assets/img/post-outstanding/<%#: Eval("hinhAnhChuDe") %>' alt="Tài liệu học Tiếng Việt">
                                    <div class="text-content">
                                        <div class="name-title"><%#: Eval("tenChuDe") %></div>
                                        <a href="#" class="description"><%#: Eval("noiDung") %></a>
                                        <br>
                                        <a href="#" class="read-more">Đọc thêm
                                        <i class="fa-solid fa-arrow-right"></i>
                                        </a>
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
