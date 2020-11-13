<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="KeepTrackConnection.aspx.cs" Inherits="KeepTrackConnection" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>

<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 70%;
        }
        .style2
        {
            height: 23px;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            height: 23px;
            font-weight: bold;
        }
        .style5
        {
            height: 23px;
            font-weight: bold;
            font-size: xx-large;
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
    <uc2:CommonSidebar ID="CommonSidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        &nbsp;</p>
    <asp:Panel ID="Panel3" runat="server">
        <table align="center" class="style1">
            <tr>
                <td class="style5" style="text-align: center">
                    KEEP TRACK CONNECTION</td>
            </tr>
            <tr>
                <td class="style2" style="text-align: center">
                    Search Order ID:
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                        Text="SEARCH" />
                </td>
            </tr>
            <tr>
                <td class="style2" style="text-align: center" align="center">
                    <asp:GridView ID="gvKeeptrack" runat="server" align="center" AllowPaging="True" 
                        AllowSorting="True" DataKeyNames="ConnectionID" 
                        onpageindexchanging="gvKeeptrack_PageIndexChanging" 
                        onselectedindexchanged="gvKeeptrack_SelectedIndexChanged" 
                        onsorting="gvKeeptrack_Sorting" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="546px">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:CommandField SelectText="Detail" ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:DetailsView ID="dtconnection" runat="server" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" Height="50px" style="text-align: center" 
                        Width="511px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" onclick="lbtnEdit_Click" 
                                        style="font-weight: 700">Edit Status</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <br />
                    <asp:Panel ID="pnlConSta" runat="server" HorizontalAlign="Center" 
        style="text-align: center" Visible="False">
                        <table align="center" class="style3">
                            <tr>
                                <td align="center" colspan="2">
                                    <b>UPDATE CONNECTION STATUS</b></td>
                            </tr>
                            <tr>
                                <td align="center" class="style4" style="text-align: right">
                                    Connection Status:</td>
                                <td align="center" style="text-align: left">
                                    <asp:DropDownList ID="ddlStatus" runat="server">
                                        <asp:ListItem>Active</asp:ListItem>
                                        <asp:ListItem>Permanently inactive</asp:ListItem>
                                        <asp:ListItem>Temporarily inactive</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="style4" style="text-align: center" colspan="2">
                                    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                        Text="UPDATE" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                        Text="CANCEL" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <table align="center" class="style3">
            <tr>
                <td align="center">
                    <asp:DetailsView ID="dtconnection0" runat="server" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" Height="50px" style="text-align: center" 
                        Width="511px">
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
    </asp:Panel>
    <p>
        <br />
    </p>
</asp:Content>

