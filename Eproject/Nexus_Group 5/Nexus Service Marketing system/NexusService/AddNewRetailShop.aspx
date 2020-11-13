<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewRetailShop.aspx.cs" Inherits="Admin_ADD" Title="Untitled Page" %>


<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">


        .style8
        {
            text-align: left;
            font-weight: bold;
            width: 148px;
            font-size: 12pt;
        }
        .style10
        {
            width: 70%;
        }
        .style11
        {
            width: 805px;
        }
        .style12
        {
            width: 148px;
            text-align: left;
            height: 26px;
            font-weight: bold;
            font-size: 12pt;
        }
        .style13
        {
            height: 26px;
        }
        .style14
        {
            text-align: left;
            font-weight: bold;
            width: 52px;
            font-size: 12pt;
        }
        .style15
        {
            width: 52px;
            text-align: left;
            height: 26px;
            font-weight: bold;
            font-size: 12pt;
        }
        .style16
        {
            width: 52px;
        }
        .style24
        {
            font-weight: normal;
            color: black;
            font-size: small;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:DefaultSidebarAdmin ID="DefaultSidebarAdmin1" runat="server" />
    </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
    <br />
</p>
                            <table align="center" class="style10">
                                <tr>
                                    <td class="style11">
                                        <asp:Panel ID="Panel1" runat="server" GroupingText="Create new Retail Shop" 
                                            style="text-align: center" Width="587px">
                                            <table border="0" 
        style="font-size: 100%; width: 568px;" align="center">
                                                <tr>
                                                    <td align="right" class="style14">
                                                        &nbsp;</td>
                                                    <td align="right" class="style8">
                                                        Retail Shop ID</td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" Width="220px">Name</asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style14">
                                                        &nbsp;</td>
                                                    <td align="right" class="style8">
                                                        <b>Retail Shop Name</b></td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtName" runat="server" Width="220px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtName" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style14">
                                                        &nbsp;</td>
                                                    <td align="right" class="style8">
                                                        E-mail</td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtEmail" runat="server" Width="220px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                            ControlToValidate="txtEmail" ErrorMessage="E-mail is required." 
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="txtEmail" Display="Dynamic" 
                                            ErrorMessage="Invalid Format E-mail" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        &nbsp;</td>
                                                    <td class="style12">
                                                        Phone</td>
                                                    <td style="text-align: left" class="style13">
                                                        <asp:TextBox ID="txtPhone" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style14">
                                                        &nbsp;</td>
                                                    <td class="style8">
                                                        Address</td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtAddress" runat="server" Height="92px" TextMode="MultiLine" 
                                            Width="220px" Wrap="False"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtAddress" ErrorMessage="Address is required."></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style14">
                                                        &nbsp;</td>
                                                    <td class="style8">
                                                        <b>City</b></td>
                                                    <td style="text-align: left">
                                                        <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                                            DataTextField="CityName" DataValueField="CityID" Height="22px" 
                                            onload="ddlCity_Load" Width="221px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style14">
                                                        &nbsp;</td>
                                                    <td class="style8">
                                                        <b>District</b></td>
                                                    <td style="text-align: left">
                                                        <asp:DropDownList ID="ddlDistrict" runat="server" 
                                            DataTextField="DistrictName" DataValueField="DistrictID" Height="22px" 
                                            Width="221px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="color: Red;" class="style16">
                                                        &nbsp;</td>
                                                    <td align="center" colspan="2" style="color: Red;">
                                                        <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
                                                            Text="Create" Width="80px" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                                            onclick="btnCancel_Click" Text="Cancel" Width="80px" />
                                                        <br />
                                                        <span class="style24">(After create successfully,UserName and password will be 
                                                        sent to email of retail shop)</span></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
    </table>
    <p>
                            &nbsp;</p>
</asp:Content>

<asp:Content ID="Content6" runat="server" 
    contentplaceholderid="MenuContentPlaceHolder">
    </asp:Content>


