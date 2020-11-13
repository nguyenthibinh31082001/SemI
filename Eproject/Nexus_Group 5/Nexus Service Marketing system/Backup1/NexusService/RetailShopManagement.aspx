<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="RetailShopManagement.aspx.cs" Inherits="Admin_RetailShopManagement" Title="Untitled Page" %>


<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 70%;
        }
        .style13
        {
            width: 61%;
        }
        .style14
        {
            font-size: large;
            font-weight: bold;
            color: #FFFFFF;
        }
        .style15
        {
            font-size: xx-large;
            font-weight: bold;
            color: #0000FF;
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
    <p class="style15" style="text-align: center">
        RETAIL SHOP MANAGEMENT</p>
    <table align="center" class="style9">
        <tr>
            <td style="text-align: center">
                <asp:DropDownList ID="ddlSearch" runat="server" Height="23px">
                    <asp:ListItem Value="Name">Search by Name</asp:ListItem>
                    <asp:ListItem Value="ID">Search by ID</asp:ListItem>
                </asp:DropDownList>
                &nbsp; <asp:TextBox ID="txtSearch" runat="server" Height="19px" Width="148px"></asp:TextBox>
                &nbsp;
                <asp:ImageButton ID="btnSearch" runat="server" Height="22px" 
                    ImageUrl="~/images/Search.png" onclick="btnSearch_Click" Width="29px" />
            </td>
        </tr>
    </table>
    <p>
        <asp:Button ID="btnAddNew" runat="server" onclick="btnAddNew_Click" 
            Text="Add New Retail Shop" Width="178px" style="text-align: center" />
        &nbsp;<asp:GridView ID="grvRetailShop" runat="server" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="RetailID" Width="649px" AllowPaging="True" 
            AllowSorting="True" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onpageindexchanging="grvRetailShop_PageIndexChanging" 
            onsorting="grvRetailShop_Sorting" style="text-align: center">
            <RowStyle BackColor="White" ForeColor="#003399" />
            <Columns>
                <asp:CommandField SelectText="Detail" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" 
                HorizontalAlign="Center" />
            <EditRowStyle HorizontalAlign="Center" />
        </asp:GridView>
    </p>
    <p>
    <br />
        <asp:MultiView ID="MultiView2" runat="server">
            <asp:View ID="View2" runat="server">
                <table align="center" class="style13">
                    <tr>
                        <td class="style14" style="text-align: center; background-color: #0000FF">
                            RETAIL SHOP DETAIL</td>
                    </tr>
                    <tr>
                        <td align="center" style="text-align: center">
                            <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" Height="50px" style="text-align: left" 
                                Width="414px">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                <RowStyle BackColor="#EFF3FB" />
                                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <Fields>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:LinkButton ID="lbtnDelete" runat="server" onclick="lbtnDelete_Click" 
                                                onclientclick="return confirm(&quot;Are you sure Delete?&quot;);">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:DetailsView>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
</p>
    <p>
    </p>
</asp:Content>

<asp:Content ID="Content6" runat="server" 
    contentplaceholderid="MenuContentPlaceHolder">
</asp:Content>



