<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="BillManagement.aspx.cs" Inherits="ManagementBills" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarACC.ascx" tagname="DefaultSidebarACC" tagprefix="uc2" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style3
        {
            width: 80%;
        }
        .style4
        {
            text-align: center;
            font-weight: bold;
            font-size: x-large;
            color: #0000FF;
        }
        .style5
        {
            text-align: left;
        }
        .style6
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:DefaultSidebarACC ID="DefaultSidebarACC1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        <br />
        <table class="style3">
            <tr>
                <td class="style4">
                    BILL MANAGEMENT</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    Search Connection by Order ID:<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                        Text="SEARCH" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:GridView ID="GridView1" runat="server" align="center" AllowPaging="True" 
                        AllowSorting="True" DataKeyNames="OrderID" 
                        onpageindexchanging="GridView1_PageIndexChanging" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        onsorting="GridView1_Sorting" style="text-align: left">
                        <Columns>
                            <asp:CommandField ButtonType="Button" SelectText="Create Bill" 
                                ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </p>
    <asp:Panel ID="pnlBillDetails" runat="server" align="center" Height="476px" 
        style="text-align: center" Width="650px">
        <table align="center" class="style1">
            <tr>
                <td class="style6" colspan="2">
                    <b>CREATE BILL</b></td>
            </tr>
            <tr>
                <td class="style5">
                    Month Bill:</td>
                <td style="text-align: left">
                    <dxe:ASPxDateEdit ID="deMonthYear" runat="server" Width="150px" 
                        ondatechanged="deMonthYear_DateChanged1">
                    </dxe:ASPxDateEdit>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="deMonthYear" Display="Dynamic" 
                        ErrorMessage="Choose Month Bill"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Customer ID:</td>
                <td class="style2" style="text-align: left">
                    <asp:Label ID="lblCusID" runat="server" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Customer Name:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblCusName" runat="server" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Address:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblAddress" runat="server" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Email:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblEmail" runat="server" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    District:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblDistrict" runat="server" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    City:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblCity" runat="server" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Plan:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblPlan" runat="server" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Package:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblPackage" runat="server" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Duration:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblDuration" runat="server" style="font-weight: 700"></asp:Label>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td style="text-align: left">
                    <asp:Panel ID="pnlLandLine" runat="server">
                        <asp:Label ID="lblChargeType" runat="server" Text="Charge Type:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="lblChargeTypeValue" runat="server" style="font-weight: 700"></asp:Label>
                        <br />
                        <asp:Label ID="lblCallCharge" runat="server">Call Charge:</asp:Label>
                        &nbsp;&nbsp;<asp:Label ID="lblCallChargeValue" runat="server" style="font-weight: 700"></asp:Label>
                        &nbsp;$ *&nbsp;<asp:TextBox ID="txtMinute" runat="server" AutoPostBack="True" 
                            ontextchanged="txtMinute_TextChanged" Width="60px">1</asp:TextBox>
                        &nbsp;Minute(s)<asp:RangeValidator ID="RangeValidator1" runat="server" 
                            ControlToValidate="txtMinute" ErrorMessage="Must be Integer " 
                            MaximumValue="45000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                        <br />
                        <asp:Label ID="lblMessage" runat="server">Messaging For Mobiles:</asp:Label>
                        &nbsp;<asp:Label ID="lblMessageValue" runat="server" style="font-weight: 700"></asp:Label>
                        &nbsp;*&nbsp;<asp:TextBox ID="txtMessage" runat="server" AutoPostBack="True" Width="60px">1</asp:TextBox>
                        <asp:Label ID="lblMessages" runat="server" Text="Message(s)"></asp:Label>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" 
                            ControlToValidate="txtMessage" ErrorMessage="Must be Integer " 
                            MaximumValue="65000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Amount:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblAmount" runat="server" style="font-weight: 700"></asp:Label>
                    &nbsp; $</td>
            </tr>
            <tr>
                <td class="style5">
                    Tax:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlTax" runat="server" AutoPostBack="True" 
                        DataTextField="TaxValue" DataValueField="TaxID" 
                        onselectedindexchanged="ddlTax_SelectedIndexChanged">
                    </asp:DropDownList>
                    %</td>
            </tr>
            <tr>
                <td class="style5">
                    Total:</td>
                <td style="text-align: left">
                    <asp:Label ID="lblTotal" runat="server" style="font-weight: 700"></asp:Label>
                    &nbsp; $</td>
            </tr>
            <tr>
                <td class="style5">
                    Bill Status:</td>
                <td style="text-align: left">
                    <asp:RadioButton ID="radPaid" runat="server" GroupName="billstatus" 
                        Text="Paid" Visible="False" />
                    <asp:RadioButton ID="radUnpaid" runat="server" Checked="True" 
                        GroupName="billstatus" Text="Unpaid" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: left">
                    <asp:Button ID="btnCreateBill" runat="server" onclick="btnCreateBill_Click" 
                        style="height: 26px" Text="CREATE BILL" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                        onclick="btnCancel_Click" Text="CANCEL" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p align="center">
        &nbsp;
</asp:Content>

