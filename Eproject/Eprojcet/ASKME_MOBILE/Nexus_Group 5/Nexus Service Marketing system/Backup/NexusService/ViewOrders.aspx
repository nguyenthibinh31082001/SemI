<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="ViewOrders" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-size: 20pt;
            font-weight: bold;
            color: #0000FF;
        }
        .style3
        {
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
        <div class="style3">
        <br />
            <span class="style2">VIEW ORDERS</span><br />
        </div>
        <table align="center" class="style1">
            <tr>
                <td align="center">
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="style1">
                            <tr>
                                <td style="text-align: center" class="style2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    Search Orders by&nbsp;
                                    <asp:DropDownList ID="ddlSearchOrders" runat="server">
                                        <asp:ListItem Value="OrderID">Order ID</asp:ListItem>
                                        <asp:ListItem Value="CustomerID">Customer ID</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txtSearchOrders" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                        Text="SEARCH" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" align="center" AllowPaging="True" 
                        AllowSorting="True" CellPadding="4" DataKeyNames="OrderID" ForeColor="#333333" 
                        GridLines="None" onpageindexchanging="GridView1_PageIndexChanging" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        onsorting="GridView1_Sorting" PageSize="6" Width="522px">
                                        <RowStyle BackColor="#E3EAEB" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" SelectText="Details" 
                                ShowSelectButton="True" />
                                        </Columns>
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DetailsView ID="DetailsView1" runat="server" align="center" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="50px" 
                        Width="327px">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:DetailsView>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="create connection" Visible="False" />
                                    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="BACK" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <table align="center" class="style1">
            <tr>
                <td>
                    <asp:DetailsView ID="DetailsView2" runat="server" align="center" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="50px" 
                        Width="327px" Visible="False">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                </td>
            </tr>
        </table>
        <br />
        <br />
    </p>
    </asp:Content>

