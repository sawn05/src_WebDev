
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="WebApplication1.aspx.profile.profileControl.Menu" %>
<h4>Quản lý tài khoản</h4>
<ul>
    <li id="account" runat="server"><a href="profile.aspx?f=account">Tài khoản</a></li>
    <li id="deliveryAddress" runat="server"><a href="profile.aspx?f=deliveryAddress">Địa chỉ giao hàng</a></li>
    <li id="pay" runat="server"><a href="profile.aspx?f=pay">Tùy chọn thanh toán</a></li>
</ul>

<h4>Đơn hàng của bạn</h4>
<ul>
    <li id="confirm" runat="server"><a href="profile.aspx?f=confirm">Đã mua</a></li>
    <%--<li id="unconfirm" runat="server"><a href="profile.aspx?f=unconfirm">Chưa xác nhận</a></li>--%>
</ul>

<h4>Danh sách yêu thích</h4>
<ul>
    <li id="like" runat="server"><a href="profile.aspx?f=like">Yêu thích</a></li>
</ul>
    