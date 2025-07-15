<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userControl.ascx.cs" Inherits="WebApplication1.aspx.admin.user" %>
<div class="titlePost">Danh sách tài khoản</div>
<div>
    <asp:Repeater ID="rptUserControl" runat="server">
        <HeaderTemplate>
            <table id="cartTable">
                <tr style="background-color: #e63946; color: rgb(224, 224, 224); font-weight: bold">
                    <td style="width: 100px;">Username</td>
                    <td style="width: 100px;">Password</td>
                    <td style="width: 200px;">Full Name</td>
                    <td style="width: 200px;">Email</td>
                    <td style="width: 200px;">Active</td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr class="cart-item">
                <td><%#: Eval("username") %></td>
                <td><%#: Eval("password") %></td>
                <td><%#: Eval("fullName") %></td>
                <td><%#: Eval("email") %></td>
                <td><%#: Eval("active") %></td>
            </tr>   
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
            
    </asp:Repeater>
</div>
