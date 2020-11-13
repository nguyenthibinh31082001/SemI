<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewVendor.aspx.cs" Inherits="AddNewVendor" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style15
        {
            width: 59%;
        }
        .style16
        {
            font-size: 16pt;
            color: white;
        }
        .style17
        {
            width: 139px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:DefaultSidebarAdmin ID="DefaultSidebarAdmin1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        <br />
                <table align="center" class="style15" __designer:mapid="1b">
                    <tr __designer:mapid="1c">
                        <td align="center" bgcolor="Blue" class="style16" colspan="2" 
                            __designer:mapid="1d">
                            <b __designer:mapid="1e">Add New Vendor</b></td>
                    </tr>
                    <tr __designer:mapid="1f">
                        <td class="style17" __designer:mapid="20">
                            Vendor ID</td>
                        <td __designer:mapid="21">
                            <asp:TextBox ID="txtID" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtID" ErrorMessage="ID is required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr __designer:mapid="23">
                        <td class="style17" __designer:mapid="24">
                            Vendor Name</td>
                        <td __designer:mapid="25">
                            <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr __designer:mapid="2c">
                        <td class="style17" __designer:mapid="2d">
                            Address</td>
                        <td __designer:mapid="2e">
                            <asp:TextBox ID="txtAddress" runat="server" Width="200px" Height="80px" 
                                TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtAddress" Display="Dynamic" 
                                ErrorMessage="Address is required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr __designer:mapid="32">
                        <td class="style17" __designer:mapid="33">
                            Phone</td>
                        <td __designer:mapid="34">
                            <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtPhone" Display="Dynamic" 
                                ErrorMessage="Phone is required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr __designer:mapid="38">
                        <td class="style17" __designer:mapid="39">
                            FAX</td>
                        <td __designer:mapid="3a">
                            <asp:TextBox ID="txtFAX" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="3c">
                        <td align="center" colspan="2" __designer:mapid="3d">
                            <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
                                Text="Create" Width="114px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                Text="Cancel" Width="129px" 
                                onclick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </p>
</asp:Content>

