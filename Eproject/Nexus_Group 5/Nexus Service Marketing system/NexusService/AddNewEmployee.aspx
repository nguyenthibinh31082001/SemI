<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewEmployee.aspx.cs" Inherits="AddNewEmployee" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
     <style type="text/css">
        .style1
        {
            text-align: center;
        }
                        

        .style8
        {
            text-align: left;
            font-weight: bold;
            width: 148px;
            font-size: 12pt;
        }
        .style12
        {
            width: 148px;
            text-align: left;
            height: 26px;
            font-weight: bold;
            font-size: 12pt;
        }
         .style20
         {
             height: 25px;
         }
         .style21
         {
             text-align: left;
             font-weight: bold;
             width: 148px;
             font-size: 12pt;
             height: 25px;
         }
         .style24
         {
             height: 25px;
             width: 146px;
         }
         .style25
         {
             text-align: left;
             font-weight: bold;
             width: 75px;
             font-size: 12pt;
             height: 25px;
         }
         .style26
         {
             height: 25px;
             width: 75px;
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
    <table align="center" class="style1">
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Width="603px" Font-Bold="False" 
                    GroupingText="Create New Employee">
                 <table align="center" border="0" 
            style="font-size: 100%; width: 585px;" class="style1">
            <tr>
                <td class="style26">
                    </td>
                <td class="style21">
                    Role</td>
                <td style="text-align: left" class="style20">
                    <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="True" Height="22px" 
                        onload="ddlRole_Load" Width="221px">
                        <asp:ListItem Value="AD">Admin</asp:ListItem>
                        <asp:ListItem Value="TE">Technician</asp:ListItem>
                        <asp:ListItem Value="AC">Accountant</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    Employee ID</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" Width="220px">Name</asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                        ControlToValidate="txtUserName" ErrorMessage="User Name is required." 
                        ToolTip="User Name is required.">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td class="style10">
                    Pass</td>
                <td class="style7" style="text-align: left">
                    <asp:TextBox ID="txtIden" runat="server" EnableViewState="False" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                        ControlToValidate="txtIden" Display="Dynamic" 
                        ErrorMessage="Identification is required" Font-Bold="False" 
                        ToolTip="Password is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtIden" Display="Dynamic" 
                        ErrorMessage="Must be 5-20 Characters" ValidationExpression="\w{5,20}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    Employee Name</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtName" runat="server" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    E-mail</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtEmail" runat="server" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="E-mail is required." 
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" 
                        ErrorMessage="Invalid Format E-mail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style11">
                    Birthday</td>
                <td style="text-align: left" class="style12">
                    <dxe:ASPxDateEdit ID="txtDate" runat="server" Width="220px">
                    </dxe:ASPxDateEdit>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtDate" Display="Dynamic" 
                        ErrorMessage="Birthday is required."></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ErrorMessage="Must be greater 18 Ages" 
                        onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    Sex</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlSex" runat="server" Height="22px" Width="221px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    Phone</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtPhone" runat="server" Height="22px" Width="220px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    Address</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtAddress" runat="server" Height="92px" TextMode="MultiLine" 
                        Width="220px" Wrap="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtAddress" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    City</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                        DataTextField="CityName" DataValueField="CityID" Height="22px" 
                        onload="ddlCity_Load" Width="221px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    District</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlDistrict" runat="server" DataTextField="DistrictName" 
                        DataValueField="DistrictID" Height="22px" Width="221px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style8">
                    Retail Shop</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlRetailsShop" runat="server" DataTextField="RetailName" 
                        DataValueField="RetailID" Height="22px" Width="221px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center" class="style25" style="color: Red;">
                    &nbsp;</td>
                <td align="center" class="style14" colspan="2" style="color: Red;">
                    <b>
                    <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
                        Text="Create" Width="87px" />
                    &nbsp;&nbsp;&nbsp;&nbsp; </b>
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                        onclick="btnCancel_Click" Text="Cancel" Width="87px" />
                    <br />
                    <span class="style24">(After create successfully,UserName and password will be 
                    sent to email of employee)</span></td>
            </tr>
        </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <p>
    </p>
</asp:Content>

