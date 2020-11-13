<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewEquipment.aspx.cs" Inherits="AddNewEquipment" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style10
        {
            width: 70%;
        }
        .style11
        {
            width: 805px;
        }
        .style15
        {
            width: 85%;
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
            text-align: left;
        }
        .style18
        {
            width: 139px;
            font-weight: bold;
            height: 29px;
        }
        .style19
        {
            height: 29px;
            text-align: left;
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
    </p>
                            <table align="center" class="style10">
                                <tr>
                                    <td class="style11">
                                        <asp:Panel ID="Panel1" runat="server" GroupingText="Create new Equipment" 
                                            style="text-align: center" Width="587px">
                                            <table align="center" class="style15">
                                                <tr>
                                                    <td align="center" bgcolor="Blue" class="style16" colspan="2">
                                                        <b>NEW EQUIPMENT</b></td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        Equipment ID</td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtID" runat="server" Width="150px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                            ControlToValidate="txtID" ErrorMessage="ID is required."></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style18">
                                                        Equipment Name</td>
                                                    <td class="style19">
                                                        <asp:TextBox ID="txtName" runat="server" Width="150px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        Vendor</td>
                                                    <td style="text-align: left">
                                                        <asp:DropDownList ID="ddlVendor" runat="server" DataTextField="VendorName" 
                                DataValueField="VendorID" Width="151px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        Price</td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtPrice" runat="server" Width="150px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtPrice" Display="Dynamic" 
                                ErrorMessage="Price is required"></asp:RequiredFieldValidator>
                                                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="txtPrice" CultureInvariantValues="True" 
                                ErrorMessage="Float number" MaximumValue="10000000" Type="Double"></asp:RangeValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        Warranty</td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtWarranty" runat="server" Width="150px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtWarranty" Display="Dynamic" 
                                ErrorMessage="Warranty is required"></asp:RequiredFieldValidator>
                                                        <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                ControlToValidate="txtWarranty" Display="Dynamic" ErrorMessage="Integer Number" 
                                MaximumValue="100000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        Equipment Type</td>
                                                    <td style="text-align: left">
                                                        <asp:DropDownList ID="ddlEquipType" runat="server" Width="151px" DataTextField="EquipmentTypeName" 
                                DataValueField="EquipmentTypeID">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
                                Text="Create" Width="114px" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                Text="Cancel" Width="129px" 
                                onclick="btnCancel_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
    </table>
    <p>
    </p>
</asp:Content>

