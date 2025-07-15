<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="WebApplication1.aspx.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giỏ hàng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/cart.css">
    <link rel="stylesheet" href="../style/responsive-header-footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server">
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
                        <div class="item active-item">
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
            <div class="container">
                <div style="padding-bottom: 20px; text-align: center; color: red;">
                    <asp:Literal ID="ltThongBao" runat="server"></asp:Literal>
                </div>
                <asp:Repeater ID="rptProductCart" runat="server" OnItemCommand="rptProductCart_ItemCommand">
                    <HeaderTemplate>
                        <table id="cartTable">
                            <tr style="background-color: #e63946; color: rgb(224, 224, 224)">
                                <th class="col-img">Hình ảnh</th>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tạm tính</th>
                                <th>Xóa</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="cart-item">
                            <td class="col-img">
                                <img src='../assets/img/book/<%# Eval("Hình ảnh") %>' alt="Book" width="60" /></td>
                            <td><%#:Eval("Mã sản phẩm")%></td>
                            <td><%#:Eval("Tên sản phẩm")%></td>
                            <td class="price">
                                <span>
                                    <%# String.Format("{0:#,##0} VNĐ", Eval("Giá")) %>
                                </span>
                            </td>
                            <td>
                                <input type="number" id="quantity" runat="server" min="1" value='<%# Eval("Số lượng") %>' class="quantity" readonly />
                            </td>
                            <td class="subtotal">
                                <%# String.Format("{0:#,##0} VNĐ", Eval("Tạm tính")) %>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkRemoveItem" runat="server" CommandName="DeleteItem"
                                    CommandArgument='<%# Eval("Mã sản phẩm") %>'>
                                    <i class="fa-solid fa-trash-can" style="color: #e63946"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

                <div class="cart-actions">
                    <asp:Button ID="btnBackProduct" runat="server" CssClass="secondary-btn" Text="Quay lại sản phẩm" OnClick="btnBackProduct_Click" />
                    <asp:Button ID="btnUpdateCart" runat="server" CssClass="secondary-btn" Text="Cập nhật giỏ hàng" OnClick="btnUpdateCart_Click" />
                </div>


                <div class="bottom-section">
                    <div>
                        <div class="coupon-box">
                            <input type="text" placeholder="Nhập mã giảm giá" id="discountCode" runat="server" />
                            <asp:Button ID="btnApDung" runat="server" CssClass="primary-btn" Text="Áp dụng" OnClick="btnApDung_Click" />
                        </div>

                        <div style="margin-top: 20px;">
                            <asp:Label ID="lblPaymentMethod" runat="server" Text="Phương thức thanh toán:" Font-Bold="true"></asp:Label><br />
                            <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="select-payment-method">
                                <asp:ListItem Text="Thanh toán khi nhận hàng (COD)" Value="cod" />
                                <asp:ListItem Text="Chuyển khoản ngân hàng" Value="bank" />
                                <asp:ListItem Text="Ví MoMo" Value="momo" />
                                <asp:ListItem Text="Thẻ tín dụng/Ghi nợ" Value="credit" />
                            </asp:DropDownList>
                        </div>

                        <div style="margin-top: 20px;">
                            <asp:Label ID="lblNote" runat="server" Text="Ghi chú:" Font-Bold="true"></asp:Label><br />
                            <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="3" CssClass="note-box" Width="100%"></asp:TextBox>
                        </div>


                    </div>




                    <div class="cart-summary">
                        <h3>Thanh toán</h3>
                        <div class="summary-item">
                            <span>Tổng tiền hàng:</span>
                            <asp:Literal ID="ltTotal" runat="server" Text="0"></asp:Literal>
                        </div>
                        <hr>
                        <div class="summary-item"><span>Vận chuyển:</span> <span>Miễn phí</span></div>
                        <hr>
                        <div class="summary-item">
                            <span>Giảm giá:</span>
                            <asp:Literal ID="ltDiscountPrice" runat="server" Text="0"></asp:Literal>
                        </div>
                        <hr>
                        <div class="summary-item total">
                            <span>Tổng cộng:</span>
                            <asp:Literal ID="ltAllTotal" runat="server" Text="0"></asp:Literal>
                        </div>
                        <asp:LinkButton ID="btnThanhToan" runat="server" Text="Tiến hành thanh toán" CssClass="primary-btn full" OnClick="btnThanhToan_Click"></asp:LinkButton>
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
