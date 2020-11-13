<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="PayBill.aspx.cs" Inherits="PayBill" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultMenu.ascx" tagname="DefaultMenu" tagprefix="uc2" %>
<%@ Register src="DefaultSidebarCU.ascx" tagname="DefaultSidebarCU" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            color: #0000FF;
            font-size: x-large;
        }
        .style2
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
    <uc3:DefaultSidebarCU ID="DefaultSidebarCU1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p class="style2">
        &nbsp;</p>
    <p class="style2">
        &nbsp;</p>
    <p class="style2">
        &nbsp;</p>
    <p class="style2">
        &nbsp;</p>
    <p class="style2">
        &nbsp;</p>
    <p class="style2">
        <span id="result_box" class="" lang="en">
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">Please</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">come</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">to our</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">branch</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">where you</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">ordered</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">to</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">pay</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">this</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">bill,</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">we</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">apologize for</span> 
        <span class="style1" 
            title="Nhấp để xem bản dịch thay thế">the inconvenience .</span></span></p>
</asp:Content>

