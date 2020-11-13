<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="CreateConnection.aspx.cs" Inherits="CreateConnection" Title="Untitled Page" %>

<%@ Register namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v9.1, Version=9.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler.Controls" tagprefix="dxwschsc" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>


<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultVerticalMenuTE.ascx" tagname="DefaultVerticalMenuTE" tagprefix="uc2" %>


<%@ Register src="DefaultSidebarTE.ascx" tagname="DefaultSidebarTE" tagprefix="uc3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 61%;
        }
        .style2
        {
        }
        .style3
        {
            width: 127px;
            font-weight: bold;
        }
        .style4
        {
            font-size: x-large;
            font-weight: bold;
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
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc3:DefaultSidebarTE ID="DefaultSidebarTE1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        <br />
        <table align="center" class="style1">
            <tr align="center">
                <td style="text-align: center" class="style4" colspan="2">
                    CREATE CONNECTION</td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Customer ID:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtCusID" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Customer Name:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtCusName" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtCusName" ErrorMessage="Customer Name is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Identification:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtIdentification" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtIdentification" Display="Dynamic" 
                        ErrorMessage="Identification is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Birthday</td>
                <td style="text-align: left">
                    <dxe:ASPxDateEdit ID="deBirthday" runat="server" AllowUserInput="False" 
                        AutoResizeWithContainer="True" EditFormat="DateTime" Width="200px">
                    </dxe:ASPxDateEdit>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="deBirthday" Display="Dynamic" 
                        ErrorMessage="Birthday is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Sex:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlSex" runat="server" Width="200px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Address:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="81px" 
                        Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    City:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                        DataTextField="CityName" DataValueField="CityID" onload="ddlCity_Load" 
                        onselectedindexchanged="ddlCity_SelectedIndexChanged" Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    District:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlDistrict" runat="server" DataTextField="DistrictName" 
                        DataValueField="DistrictID" onload="ddlDistrict_Load" AutoPostBack="True" 
                        Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Email:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" 
                        ErrorMessage="Email entered invalid" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Phone:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                        ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Order ID:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtOrderID" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: left" class="style3">
                    Connection Status:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlConnectionStatus" runat="server" Width="200px">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Permanently inactive</asp:ListItem>
                        <asp:ListItem>Temporarily inactive</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: right" class="style2">
                    &nbsp;</td>
                <td style="text-align: left">
                    <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
                        Text="CREATE" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="CANCEL" 
                        CausesValidation="False" onclick="btnCancel_Click1" />
                </td>
            </tr>
            <tr align="center">
                <td style="text-align: center" class="style2" colspan="2">
                    <span class="style24">(After create successfully,UserName and password will be 
                    sent to email of Customer)</span></td>
            </tr>
        </table>
    </p>
    <p>
    </p>
</asp:Content>

