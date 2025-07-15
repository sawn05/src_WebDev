<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="post_outstandingControl.ascx.cs" Inherits="WebApplication1.aspx.admin.post_outstandingControl" %>
<div class="titlePost">Danh sách bài viết nổi bật</div>

<asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
    <asp:View ID="v1" runat="server">
        <div>
            <asp:Repeater ID="rptPostOutstandingControl" runat="server" OnItemCommand="rptPostOutstandingControl_ItemCommand">
                <HeaderTemplate>
                    <table id="cartTable">
                        <tr style="background-color: #e63946; color: rgb(224, 224, 224)">
                            <th style="width: 100px">Chọn</th>
                            <th style="width: 70px;">Mã chủ đề</th>
                            <th style="width: 120px;">Hình ảnh chủ đề</th>
                            <th style="width: 100px;">Tên chủ đề</th>
                            <th style="width: 500px;">Nội dung</th>
                            <th style="width: 100px;">Mã thể loại</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="cart-item">
                        <td>
                            <asp:CheckBox ID="cbSelect" runat="server" />
                            <asp:HiddenField ID="hfMaChuDe" runat="server" Value='<%# Eval("maChuDe") %>' />
                        </td>

                        <td><%#: Eval("maChuDe") %></td>
                        <td class="col-img"><img src='../assets/img/post-outstanding/<%# Eval("hinhAnhChuDe") %>' alt="Post-outstanding" width="120" /></td>
                        <td> <asp:LinkButton ID="lnkUpdate" runat="server" CssClass="nameTitle" CommandName="update" CommandArgument='<%#:Eval("maChuDe")%>'> <%#: Eval("tenChuDe") %></asp:LinkButton></td>
                        <td><%#: Eval("noiDung") %></td>
                        <td style="text-transform: uppercase"><%#: Eval("maTheLoai") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>

            </asp:Repeater>
        </div>

        <div>
            <asp:Literal ID="ltError" runat="server" />
        </div>
        <div>   
            <asp:LinkButton CssClass="btnAddPost" ID="linkAddPost" runat="server" OnClick="linkAddPost_Click">Thêm bài viết</asp:LinkButton>
            <asp:Button CssClass="btnDelete" ID="btnDelete" runat="server" Text="Xóa bài viết" OnClick="btnDelete_Click" />
        </div>
    </asp:View>


    <asp:View ID="v2" runat="server">
        <asp:HiddenField ID="hdPostID" runat="server" />
        <asp:HiddenField ID="hdInsert" runat="server" />

        <table class="tblAddPost">
            <tr>
                <td class="attribute">Tên chủ đề</td>
                <td><asp:TextBox ID="txtTenChuDe" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td class="attribute">Nội dung</td>
                <td>
                    <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" Rows="5" Columns="50"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="attribute">Hình ảnh</td>
                <td>
                    <asp:FileUpload ID="fuImage" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="attribute">Mã thể loại</td>
                <td>
                    <asp:DropDownList ID="ddlMaTheLoai" runat="server">
                        <asp:ListItem Text="Chọn mã thể loại" Value="default" />
                        <asp:ListItem Text="DCGD" Value="DCGD" />
                        <asp:ListItem Text="DCHT" Value="DCHT" />
                        <asp:ListItem Text="SACH" Value="SACH" />
                        <asp:ListItem Text="TBCN" Value="TBCN" />
                        <asp:ListItem Text="TCVB" Value="TCVB" />
                        <asp:ListItem Text="TRUYEN" Value="TRUYEN" />
                    </asp:DropDownList>
                </td>
            </tr>

            
        </table>

        <div>
            <asp:Literal ID="ltMessage" runat="server" />
        </div>

        <div>
            <asp:Button ID="btnAddPost" CssClass="btnAddPost" runat="server" Text="Xác nhận" OnClick="btnAddPost_Click" />
            <asp:LinkButton ID="btnBack" CssClass="btnBack" runat="server" OnClick="btnBack_Click">Quay lại</asp:LinkButton>
        </div>

    </asp:View>



</asp:MultiView>

