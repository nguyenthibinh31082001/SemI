<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultMenu.ascx" tagname="DefaultMenu" tagprefix="uc2" %>
<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
            font-weight: bold;
            color: #0000FF;
        }
        .style2
        {
            color: red;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc3:CommonSidebar ID="CommonSidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p style="text-align: center; height: 20px;" class="style1">
        Welcome to NEXUS MAKETING SYSTEM
    </p>
    <p style="text-align: center; height: 20px;">
        <br />
        &nbsp;</p>
    <asp:Panel ID="Panel1" runat="server" Direction="LeftToRight" 
        GroupingText="" Height="685px" style="text-align: left" 
        Width="662px">
        <b>Nexus Communication System is an Organization system that provides two 
        services like the tele-communications and Internet Services. </b>
        <br />
        <br />
        You can find our Retail Shop at your area and Place Orders for interested 
        services. Our services include:
        <br />
        <br />
        <br />
       <asp:Panel ID="Panel2" runat="server" GroupingText="DialUp Connection" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvDialup3" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Height="112px" Width="450px" AllowPaging="True">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel3" runat="server" GroupingText="BroadBand Connection" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvBB3" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Height="121px" Width="444px" AllowPaging="True">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel4" runat="server" GroupingText="LandLine Connection" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvLL3" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Height="128px" Width="447px" AllowPaging="True">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
               
        <span class="style2">Please contact to Retail Shop to get place order and get 
        connection !</span></b>
        <br />
    </asp:Panel>
</asp:Content>

