<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signUp.aspx.cs" Inherits="WebApplication1.aspx.signUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/responsive-header-footer.css"/>
    <link rel="stylesheet" href="../style/login.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()" method="post">
        <div class="content">
            <div class="signUp">
                <h2>Đăng ký</h2>
                <input type="text" id="email_user" name="email_user" placeholder="Nhập email"/>
                <input type="text" id="username" name="username" placeholder="Tên đăng nhập"/>

                <div class="password-container">
                    <input type="password" id="password_user" name="password_user" class="password" placeholder="Mật khẩu"/>
                    <i class="fa-regular fa-eye toggle-password"></i>
                </div>

                <div class="password-container">
                    <input type="password" id="confirm-password_user" name="confirm_password_user" class="password" placeholder="Xác nhận mật khẩu"/>
                    <i class="fa-regular fa-eye toggle-password"></i>
                </div>
                
                <p id="match_message" runat="server"></p>

                <div class="button">
                    <asp:Button ID="btn_signUp" runat="server" Text="Đăng ký" OnClientClick="return validateForm();" OnClick="btn_signUp_Click" />
                </div>
                
                <div class="foot">
                    <p>Bạn đã có tài khoản?</p>   
                    <a href="login.aspx">Đăng nhập ngay</a>
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

        // Check password
        function validateForm() {
            let isValid = true;
            let messages = [];

            const email = document.getElementById("email_user");
            const username = document.getElementById("username");
            const password = document.getElementById("password_user");
            const confirmPassword = document.getElementById("confirm-password_user");
            const matchMessage = document.getElementById("match_message");

            const emailValue = email.value.trim();
            const usernameValue = username.value.trim();
            const passwordValue = password.value.trim();
            const confirmPasswordValue = confirmPassword.value.trim();

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            // Reset màu và thông báo
            matchMessage.innerHTML = "";
            matchMessage.style.color = "red";

            if (emailValue === "" || !emailRegex.test(emailValue)) {
                messages.push("Email không hợp lệ.");
                isValid = false;
            }

            if (usernameValue === "") {
                messages.push("Vui lòng nhập tên đăng nhập.");
                isValid = false;
            }

            if (passwordValue === "") {
                messages.push("Vui lòng nhập mật khẩu.");
                isValid = false;
            } else if (passwordValue.length < 6) {
                messages.push("Mật khẩu phải có ít nhất 6 ký tự.");
                isValid = false;
            }

            if (confirmPasswordValue === "") {
                messages.push("Vui lòng xác nhận lại mật khẩu.");
                isValid = false;
            } else if (passwordValue !== confirmPasswordValue) {
                messages.push("Mật khẩu xác nhận không khớp.");
                isValid = false;
            }

            if (!isValid) {
                matchMessage.innerHTML = messages.join("<br>");
            }

            return isValid;
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
