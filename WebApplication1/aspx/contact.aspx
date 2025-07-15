<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication1.aspx.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giới thiệu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/contact.css">
    <link rel="stylesheet" href="../style/responsive-header-footer.css">
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
                    <a href="home.aspx" class="logo">
                        <img src="../assets/img/logo/logotest.png" alt="">
                    </a>
                    <div id="menu">
                        <div class="item">
                            <a href="../aspx/home.aspx">Trang chủ</a>
                        </div>
                        <div class="item">
                            <a href="../aspx/product.aspx">Sản phẩm</a>
                        </div>
                        <div class="item">
                            <a href="../aspx/about.aspx">Giới thiệu</a>
                        </div>
                        <div class="item">
                            <a href="../aspx/contact.aspx" class="active">Liên hệ</a>
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

                    <div id="bar">
                        <div class="item">
                            <i class="fa-solid fa-bars"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Content -->
        <div class="content">
            <div class="contact-container">
                <div class="contact-info">
                    <div class="info-box">
                        <div class="icon"><i class="fas fa-phone"></i></div>
                        <h4>Liên hệ với chúng tôi</h4>
                        <p>
                            Chúng tôi phục vụ 24/7.<br>
                            Số điện thoại: 0123456789
                        </p>
                    </div>
                    <hr>
                    <div class="info-box">
                        <div class="icon"><i class="fas fa-envelope"></i></div>
                        <h4>Gửi đến chúng tôi</h4>
                        <p>
                            Điền vào mẫu của chúng tôi và chúng tôi sẽ liên hệ với bạn trong vòng 24 giờ.<br>
                            Email: sanglaida@gmail.com<br>
                            Email: 23a1001d0317@students.hou.edu.vn
                        </p>
                    </div>
                </div>

                <div class="contact-form">
                    <div class ="form-input">
                        <div class="form-row">
                            <input type="text" placeholder="Tên của bạn *" required />
                            <input type="email" placeholder="Email *" required />
                            <input type="tel" placeholder="Số điện thoại *" required />
                        </div>
                        <textarea id="txtAreaMessage" placeholder="Viết tin nhắn" rows="6" required></textarea>
                        <button type="submit">Gửi tin nhắn</button>
                    </div>
                </div>
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
