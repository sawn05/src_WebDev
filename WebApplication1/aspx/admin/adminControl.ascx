<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="adminControl.ascx.cs" Inherits="WebApplication1.aspx.adminControl" %>
<%@ Register src="menu.ascx" tagname="menu" tagprefix="uc1" %>
<div style="font-size: 30px; padding: 10px; margin-left: 20px; text-align: center;">Administrator</div>
<table cellspacing="0" cellpadding="0" style="width: 100%">
    <tr>
        <td style="vertical-align: top; padding-top: 15px; text-align: left">
            <uc1:menu ID="menu1" runat="server" />
        </td>
        <td class="menu-left">
            <div class="menu">
                <asp:PlaceHolder ID="plLoad" runat="server"></asp:PlaceHolder>
            </div>
        </td>
    </tr>
</table>
    