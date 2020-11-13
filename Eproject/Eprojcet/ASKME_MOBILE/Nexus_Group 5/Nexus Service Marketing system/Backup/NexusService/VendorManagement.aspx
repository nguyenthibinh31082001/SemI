<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="VendorManagement.aspx.cs" Inherits="VendorManagement" Title="Untitled Page" %>

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
            width: 59%;
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
        .style18
        {
            font-size: 22pt;
            font-weight: bold;
            color: #0000FF;
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
    <p class="style18" style="text-align: center">
        VENDOR MANAGEMENT</p>
    <table align="center" class="style9">
        <tr>
            <td style="text-align: center">
                <asp:DropDownList ID="ddlSearch" runat="server" Height="23px">
                    <asp:ListItem Value="Name">Search by Equipment&#39;s Name</asp:ListItem>
                    <asp:ListItem Value="ID">Search by Vendor&#39;s Name</asp:ListItem>
                </asp:DropDownList>
                &nbsp; <asp:TextBox ID="txtSearch" runat="server" Height="19px" Width="148px"></asp:TextBox>
                &nbsp;
                <asp:ImageButton ID="btnSearch" runat="server" Height="22px" 
                    ImageUrl="~/images/Search.png" onclick="btnSearch_Click" Width="29px" 
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
    <p style="text-align: center">
        <asp:Button ID="btnAddNew" runat="server" onclick="btnAddNew_Click" 
            Text="Add New Vendor" Width="178px" CausesValidation="False" />
</p>
    <p align="center">
        <asp:GridView ID="gvVendor" runat="server" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="VendorID" Width="650px" AllowPaging="True" 
            AllowSorting="True" 
            onselectedindexchanged="gvVendor_SelectedIndexChanged" 
            onpageindexchanging="gvVendor_PageIndexChanging" 
            onsorting="gvVendor_Sorting">
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
                            VENDOR DETAIL</td>
                    </tr>
                    <tr>
                        <td align="center" style="text-align: center">
                            <asp:DetailsView ID="dtVendor" runat="server" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" Height="50px" style="text-align: center" 
                                Width="650px">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                <RowStyle BackColor="#EFF3FB" />
                                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <Fields>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            &nbsp;&nbsp;<asp:LinkButton ID="lbtnEdit" runat="server" onclick="lbtnEdit_Click">Edit</asp:LinkButton>
                                            &nbsp;&nbsp;
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
        <asp:MultiView ID="MultiView3" runat="server">
            <asp:View ID="View3" runat="server">
                <table align="center" class="style15">
                    <tr>
                        <td align="center" bgcolor="Blue" class="style16" colspan="2">
                            <b>Edit Vendor</b></td>
                    </tr>
                    <tr>
                        <td class="style17">
                            Vendor ID</td>
                        <td>
                            <asp:Label ID="lblID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            Vendor Name</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            Address</td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Width="200px" Height="80px" 
                                TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtAddress" Display="Dynamic" 
                                ErrorMessage="Address is required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            Phone</td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtPhone" Display="Dynamic" 
                                ErrorMessage="Phone is required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            FAX</td>
                        <td>
                            <asp:TextBox ID="txtFAX" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                                Text="Update" Width="114px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                Text="Cancel" Width="129px" onclick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <br />
        </asp:MultiView>
    </p>
    <p>
        &nbsp;</p>
    </asp:Content>

