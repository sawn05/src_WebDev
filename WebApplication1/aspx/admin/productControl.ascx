<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="productControl.ascx.cs" Inherits="WebApplication1.aspx.admin.product" %>
<div class="titlePost">
    <div>Danh sách sản phẩm</div>
    <asp:Button ID="btnAddProduct" runat="server" CssClass="btnAddProduct" Text="Thêm sản phẩm" OnClick="btnAddProduct_Click" />
</div>


<asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
    <asp:View ID="v1" runat="server">
        <asp:Repeater ID="rptProductList" runat="server" OnItemCommand="rptProductList_ItemCommand">
            <HeaderTemplate>
                <table id="cartTable">
                    <tr style="background-color: #e63946; color: rgb(224, 224, 224)">
                        <th class="col-img">Hình ảnh</th>
                        <th>Mã sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá gốc</th>
                        <th>Số lượng tồn kho</th>
                        <th>Giảm giá</th>
                        <th>Giá bán</th>
                        <th>Xóa</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="cart-item">
                    <td class="col-img">
                        <img src='../assets/img/book/<%# Eval("hinhAnhSanPham") %>' alt="Book" width="60" /></td>
                    <td><%#:Eval("maSP")%></td>
                    <td><%#:Eval("tenSP")%></td>
                    <td class="price">
                        <span>
                            <%# String.Format("{0:#,##0} VNĐ", Eval("donGia")) %>
                        </span>
                    </td>
                    <td><%#:Eval("slTon")%></td>
                    <td class="sale">
                        <%# String.Format("{0}% ", Eval("giamGia")) %>
                    </td>
                    <td><span>
                        <%# String.Format("{0:#,##0} VNĐ", Eval("giaMoi")) %>
                    </span></td>
                    <td>
                        <asp:LinkButton ID="lnkRemoveItem" runat="server" CommandName="DeleteItem"
                            CommandArgument='<%# Eval("maSP") %>'>
                                    <i class="fa-solid fa-trash-can" style="color: #e63946"></i>
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </asp:View>

    <asp:View ID="v2" runat="server">
        <table>
            <tr>
                <td>Mã sản phẩm</td>
                <td>
                    <asp:TextBox ID="txtMaSP" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Tên sản phẩm</td>
                <td>
                    <asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Hình ảnh</td>
                <td>
                    <asp:FileUpload ID="fuImage" runat="server" />
                </td>
            </tr>

            <tr>
                <td>Số lượng</td>
                <td>
                    <asp:TextBox ID="txtSoLuong" runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Giá</td>
                <td>
                    <asp:TextBox ID="txtGiaGoc" runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Giảm giá</td>
                <td>
                    <asp:TextBox ID="txtGiamGia" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Đánh giá (1-5)</td>
                <td>
                    <asp:TextBox ID="txtDanhGia" runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Mô tả</td>
                <td>
                    <asp:TextBox ID="txtMoTa" runat="server" TextMode="MultiLine" Rows="5" Columns="50"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Mã thể loại</td>
                <td>
                    <asp:DropDownList ID="ddlMaTheLoai" runat="server">
                        <asp:ListItem Text="Chọn mã thể loại" Value="default" />
                        <asp:ListItem Text="DCGD" Value="doChoiGiaoDuc" />
                        <asp:ListItem Text="DCHT" Value="dungCuHocTap" />
                        <asp:ListItem Text="SACH" Value="sach" />
                        <asp:ListItem Text="TBCN" Value="thietBiCongNghe" />
                        <asp:ListItem Text="TCVB" Value="tapChiVaBao" />
                        <asp:ListItem Text="TRUYEN" Value="truyen" />
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Nhà cung cấp</td>
                <td>
                    <asp:DropDownList ID="ddlNCC" runat="server">
                        <asp:ListItem Text="Chọn nhà cung cấp" Value="default" />
                        <asp:ListItem Text="Công ty cổ phần phát hành Sách TP.HCM" Value="NCC01" />
                        <asp:ListItem Text="Công ty Văn Phòng Phẩm Hoa Mai" Value="NCC02" />
                        <asp:ListItem Text="Công ty Công Nghệ Tiến Mạnh LMN" Value="NCC03" />
                        <asp:ListItem Text="Công ty Đồ Chơi Giáo Dục QRS" Value="NCC04" />
                        <asp:ListItem Text="Công ty Tạp Chí và Báo UVW" Value="NCC05" />
                    </asp:DropDownList>
                </td>
            </tr>


        </table>

        <div>
            <asp:Literal ID="ltMessage" runat="server" />
        </div>

        <div>
            <asp:Button ID="btnConfirmAddProduct" runat="server" Text="Xác nhận" OnClick="btnConfirmAddProduct_Click" />
            <asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click">Quay lại</asp:LinkButton>
        </div>

    </asp:View>

</asp:MultiView>


