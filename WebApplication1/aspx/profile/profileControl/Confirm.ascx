<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Confirm.ascx.cs" Inherits="WebApplication1.aspx.profile.profileControl.Confirm" %>
<div class="order-container">
    <asp:Repeater ID="rptOrder" runat="server" OnItemDataBound="rptOrder_ItemDataBound">
        <ItemTemplate>
            <div class="order-card">
                <div class="order-header">
                    <span class="orderID"><%# Eval("maHD") %></span>
                    <span class='order-status <%# Eval("trangThai").ToString().ToLower().Replace(" ", "_") %>'>
                        <%# Eval("trangThai") %>
                    </span>


                </div>

                <asp:Repeater ID="rptProduct" runat="server">
                    <ItemTemplate>
                        <div class="order-body">
                            <div class="product-thumb">
                                <img src='../../assets/img/book/<%# Eval("hinhAnhSanPham") %>' alt="Product" />
                            </div>
                            <div class="product-info">
                                <div class="product-name"><%# Eval("tenSP") %></div>
                                <div class="product-sub">
                                    <%# Eval("moTa").ToString().Length > 200 
                                        ? Eval("moTa").ToString().Substring(0, 100) + "..." 
                                        : Eval("moTa").ToString() %>
                                </div>

                                <div class="product-qty">x<%# Eval("soLuongMua") %></div>
                                <div class="price">
                                    <span>
                                        <%# String.Format("{0:#,##0} VNĐ", Convert.ToDouble(Eval("donGia")) * 
                                        (1 - Convert.ToDouble(Eval("giamGia")) / 100.0)) %>
                                    </span>
                                    <del>
                                        <%# String.Format("{0:#,##0} VNĐ", Eval("donGia")) %>
                                    </del>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="order-footer">
                    <div class="order-total" style="font-size: 20px;">
                        Tổng số tiền: 
                        <span class="total-amount"><%# Eval("tongTien", "{0:N0}₫") %></span>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
