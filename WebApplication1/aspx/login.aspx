<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.aspx.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/responsive-header-footer.css">
    <link rel="stylesheet" href="../style/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="content">
            <div class="login">
                <h2>Đăng nhập</h2>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <div class="password-container">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <i class="fa-regular fa-eye toggle-password"></i>
                </div>
                <small id="error_message" runat="server" class="error-message"></small>

                <div class="button">
                    <asp:Button ID="btn_login" runat="server" Text="Đăng nhập" OnClientClick="return validateLogin();" OnClick="btn_login_Click" />
                </div>
                <div class="foot">
                    <p>Bạn chưa có tài khoản?</p>
                    <a href="signUp.aspx">Đăng ký ngay</a>
                </div>
            </div>
        </div>
    </form>

    <script>
        // Show password
        const toggles = document.querySelectorAll(".toggle-password");

        toggles.forEach(function (toggle) {
            toggle.addEventListener("click", function () {
                const input = this.previousElementSibling;
                const type = input.getAttribute("type") === "password" ? "text" : "password";
                input.setAttribute("type", type);

                this.classList.toggle("fa-eye");
                this.classList.toggle("fa-eye-slash");
            });
        });

        function validateLogin() {
            const username = document.querySelector('input[name="username"]');
            const password = document.querySelector('input[name="password"]');
            const errorMessage = document.querySelector('.error-message');

            if (username.value.trim() === "" || password.value.trim() === "") {
                errorMessage.textContent = "Vui lòng nhập tài khoản và mật khẩu";
                return false;
            }

            errorMessage.textContent = "";
            return true;
        }


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
