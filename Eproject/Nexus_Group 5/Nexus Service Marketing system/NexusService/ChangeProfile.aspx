<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeProfile.aspx.cs" Inherits="ChangeProfile" Title="Untitled Page" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style14
        {
            width: 162px;
        }
        .style15
        {
            font-size: 12pt;
            width: 164px;
        }
        .style17
        {
            text-align: center;
        }
        .style25
        {
            width: 19%;
        }
        .style54
        {
            font-size: 14pt;
            color: #FFFFFF;
        }
        .style55
        {
            font-size: 12pt;
            width: 13px;
        }
        .style56
        {
            width: 13px;
        }
        .style57
        {
            text-align: center;
            width: 13px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <p>
        &nbsp;</p>
    <uc3:CommonSidebar ID="CommonSidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        <br />
    </p>
    <table cellpadding="0" border="0" align="center" bgcolor="#CEFFFF">
			<tr>
				<td align="center" colspan="3" bgcolor="Blue" class="style54">Change Your Password</td>
			</tr><tr>
				<td align="right" class="style55" style="text-align: left">&nbsp;</td>
				<td align="right" class="style15" style="text-align: left">Password</td>
                <td class="style14"><asp:TextBox runat="server" TextMode="Password" ID="txtOldPass" 
                        Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtOldPass" ErrorMessage="*" 
                        ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
</td>
			</tr><tr>
				<td align="right" class="style55" style="text-align: left">&nbsp;</td>
				<td align="right" class="style15" style="text-align: left">New Password</td>
                <td class="style14">
                    <asp:TextBox runat="server" TextMode="Password" 
                        ID="txtNewPassword" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtNewPassword" ErrorMessage="*" 
                        ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
</td>
			</tr><tr>
				<td align="right" class="style55" style="text-align: left">&nbsp;</td>
				<td align="right" class="style15" style="text-align: left">Confirm New Password</td>
                <td class="style14">
                    <asp:TextBox runat="server" TextMode="Password" 
                        ID="txtConfirmNewPassword" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtConfirmNewPassword" Display="Dynamic" ErrorMessage="*" 
                        ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
</td>
			</tr><tr>
				<td align="center" class="style56">
                    &nbsp;</td>
				<td align="center" colspan="2">
                    <asp:Label ID="lbtb" runat="server"></asp:Label>
</td>
			</tr><tr>
				<td align="right" class="style57">&nbsp;</td>
				<td align="right" class="style17" colspan="2">
                    <asp:Button runat="server" CommandName="ChangePassword" 
                        Text="Change" ValidationGroup="ChangePass" ID="btnChange" 
                        onclick="btnChange_Click" Width="90px"></asp:Button>
                    &nbsp;&nbsp; <asp:Button runat="server" CausesValidation="False" CommandName="Cancel" 
                        Text="Cancel" ID="btnCancelChange" Width="90px"></asp:Button>
</td>
			</tr>
		    <tr>
				<td align="right" class="style57">&nbsp;</td>
				<td align="right" class="style17" colspan="2">
                    &nbsp;</td>
			</tr>
		</table>
    <br />
    <br />
    <table align="center" class="style25">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    </asp:Content>

