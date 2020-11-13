<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="BookDetail.aspx.cs" Inherits="View_BookDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2 class="title">Book Recipe</h2>
    <asp:DataList ID="dtdetailbook" runat="server" 
       >
<ItemTemplate>
<div style="width:100%; height:auto;">
            
        <div class="detail-book img"><img src="../images/imagebook/<%#Eval("Image") %>"/></div>
        <div class="imgmuahang">
        <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/images/imagebook/icon_dathang.png"/>
        </div>
        <br />
        <div class="detail-books"><%# "Name: "+Eval("BName") %>
        <br />
        <%# "Author: "+Eval("Author") %>
        <br /><%# "Description: " + Eval("Description")%>
        <br /><%# "Price: "+Eval("Price") %>
        </div>                     
        </div>
    
</ItemTemplate>
</asp:DataList>
</asp:Content>

