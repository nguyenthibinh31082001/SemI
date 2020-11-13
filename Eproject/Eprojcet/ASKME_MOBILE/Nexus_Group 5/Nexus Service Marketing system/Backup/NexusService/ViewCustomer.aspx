<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCustomer.aspx.cs" Inherits="ViewCustomer" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 80%;
        }
        .style3
        {
            width: 766px;
            text-align: center;
            font-weight: bold;
            font-size: 20pt;
            color: #0000FF;
        }
        .style2
        {
            width: 766px;
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:CommonSidebar ID="CommonSidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        <br />
        <table align="center" class="style1">
            <tr>
                <td class="style3">
                    VIEW CUSTOMERS</td>
            </tr>
            <tr>
                <td class="style2">
                    Search Customer by
                    <asp:DropDownList ID="ddlSearch" runat="server">
                        <asp:ListItem Value="CustomerID">Customer ID</asp:ListItem>
                        <asp:ListItem Value="CustomerName">Customer Name</asp:ListItem>
                        <asp:ListItem Value="OrderID">Order ID</asp:ListItem>
                    </asp:DropDownList>
                    :&nbsp;&nbsp;
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                        style="height: 26px" Text="SEARCH" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:GridView ID="GridView1" runat="server" ALIGN="CENTER" AllowPaging="True" 
                        AllowSorting="True" DataKeyNames="CustomerID" 
                        onpageindexchanging="GridView1_PageIndexChanging" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        onsorting="GridView1_Sorting" style="text-align: left" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" Width="437px">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:CommandField SelectText="Details" 
                                ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:DetailsView ID="DetailsView1" runat="server" align="left" Height="50px" 
                        HorizontalAlign="Center" style="text-align: left" Visible="False" 
                        Width="439px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="BACK" />
                </td>
            </tr>
        </table>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

