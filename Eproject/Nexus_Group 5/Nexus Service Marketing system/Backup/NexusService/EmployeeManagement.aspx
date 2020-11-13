<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeManagement.aspx.cs" Inherits="Admin_EmployeeManagement" Title="Untitled Page" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>


<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style4
        {
            font-size: medium;
        }
        .style9
        {
            text-align: left;
            font-size: 12pt;
            width: 383px;
        }
        .style12
        {
            width: 31%;
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
            width: 100%;
            font-weight: bold;
        }
        .style16
        {
            font-size: 21pt;
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
    <br />
    <table class="style15">
        <tr>
            <td class="style16" style="text-align: center">
                Employee Management</td>
        </tr>
    </table>
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

    <p align="center">
        <asp:Button ID="btnAddNew" runat="server" onclick="btnAddNew_Click" 
            Text="Add New Employee" Width="178px" style="text-align: center" />
        &nbsp;<asp:GridView ID="gvEmployee" runat="server" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="EmployeeID" Width="649px" AllowPaging="True" 
            AllowSorting="True" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onpageindexchanging="gvEmployee_PageIndexChanging" 
            onsorting="gvEmployee_Sorting">
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
        <asp:MultiView ID="MultiView2" runat="server">
            <asp:View ID="View2" runat="server">
                <table align="center" class="style13">
                    <tr>
                        <td class="style14" style="text-align: center; background-color: #0000FF">
                            EMPLOYEE DETAIL</td>
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
                                            <asp:LinkButton ID="btnEditRole" runat="server" onclick="btnEditRole_Click">Edit 
                                            Role</asp:LinkButton>
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
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table align="center" class="style12">
                    <tr>
                        <td>
                            <b>Role: </b>
                        </td>
                        <td>
                            <span class="style4">
                            <asp:DropDownList ID="ddlEditRole" runat="server" Height="22px" Width="135px">
                                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                <asp:ListItem Value="Technician">Technician</asp:ListItem>
                                <asp:ListItem Value="Accountant">Accountant</asp:ListItem>
                            </asp:DropDownList>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:LinkButton ID="lbtnUpdate" runat="server" onclick="lbtnUpdate_Click">Update</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lbtnCancel" runat="server" onclick="lbtnCancel_Click">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>

<asp:Content ID="Content6" runat="server" 
    contentplaceholderid="MenuContentPlaceHolder">
</asp:Content>


