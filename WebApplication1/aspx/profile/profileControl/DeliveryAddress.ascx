<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeliveryAddress.ascx.cs" Inherits="WebApplication1.aspx.profile.profileControl.DeliveryAddress" %>
<div class="content-right">
    <h2 class="title-section">Địa chỉ giao hàng</h2>

    <div class="address-box">
        <%--<label>Địa chỉ hiện tại:</label>--%>

        <asp:Repeater ID="rptListAddress" runat="server">
            <ItemTemplate>
                <div class="current-address">
                    <%#:Eval("diaChi") %>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

    <div class="add-address-section" style="margin-top: 20px; text-align: left;">
        <asp:Button ID="btnOpenModal" runat="server" Text="Thêm địa chỉ mới" CssClass="btn btn-danger" OnClientClick="showModal(); return false;" />
    </div>
</div>

<div id="addressModal" class="modal">
    <div class="modal-content">
        <h3>Thêm địa chỉ mới</h3>

        <label>Tên người nhận:</label>
        <asp:TextBox ID="txtReceiverName" runat="server" CssClass="form-control" />

        <label>Số điện thoại:</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />

        <label>Địa chỉ:</label>
        <asp:TextBox ID="txtNewAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />

        <div style="margin-top: 15px; text-align: right;">
            <asp:Button ID="btnSaveAddress" runat="server" Text="Lưu" CssClass="btn btn-success" OnClick="btnSaveAddress_Click" />
            <button type="button" class="btn btn-secondary" onclick="hideModal()">Hủy</button>
        </div>
    </div>
</div>