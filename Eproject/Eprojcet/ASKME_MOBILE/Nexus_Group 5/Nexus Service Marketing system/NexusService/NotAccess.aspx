<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="NotAccess.aspx.cs" Inherits="NotAccess" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebar1.ascx" tagname="DefaultSidebar1" tagprefix="uc2" %>
<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            font-size: xx-large;
            font-weight: bold;
            color: #FF0000;
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
    <p class="style1">
        <br />
        <span class="style2">You don&#39;t have permission for this page !</span></p>
    <p class="style1">
        <b>Click
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../MainPage.aspx"><b>here</b></asp:HyperLink>
&nbsp;to come back home page !</b></p>
</asp:Content>

