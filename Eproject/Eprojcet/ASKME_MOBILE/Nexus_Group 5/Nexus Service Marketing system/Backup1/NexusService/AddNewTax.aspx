<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewTax.aspx.cs" Inherits="AddNewTax" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style15
        {
            width: 61%;
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
                <table align="center" class="style15" __designer:mapid="107">
                    <tr __designer:mapid="108">
                        <td align="center" bgcolor="Blue" class="style16" colspan="2" 
                            __designer:mapid="109">
                            <b __designer:mapid="10a">ADD NEW TAX</b></td>
                    </tr>
                    <tr __designer:mapid="10f">
                        <td class="style17" __designer:mapid="127">
                            Tax Name</td>
                        <td __designer:mapid="128">
                            <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr __designer:mapid="12b">
                        <td class="style17" __designer:mapid="12c">
                            Value</td>
                        <td __designer:mapid="12d">
                            <asp:TextBox ID="txtValue" runat="server" Width="200px"></asp:TextBox>
                            %<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtValue" Display="Dynamic" 
                                ErrorMessage="Value is required"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="txtValue" ErrorMessage="Float number" MaximumValue="1000000" 
                                MinimumValue="0" Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr __designer:mapid="110">
                        <td class="style17" __designer:mapid="111">
                            Description</td>
                        <td __designer:mapid="112">
                            <asp:TextBox ID="txtDescription" runat="server" Width="200px" Height="80px" 
                                style="text-align: left" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="11e">
                        <td align="center" colspan="2" __designer:mapid="11f">
                            <asp:Button ID="btnCreate" runat="server" onclick="btnUpdate_Click" 
                                Text="Create" Width="114px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                Text="Cancel" Width="129px" onclick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </p>
    <p>
    </p>
</asp:Content>

