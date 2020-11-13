<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="FreeRecipeDetail.aspx.cs" Inherits="View_FreeRecipeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2 class="title">Flavor Detail</h2>

    <asp:DataList ID="dtlFreeFlavorDetail" runat="server">
    <ItemTemplate>
<div style="width:100%; height:auto;">
            
        <div class="detail-anh"><img src="../images/imageflavor/<%#Eval("FImage") %>"/></div>
        <br />
        <div class="detail-nguyenlieu"><%# "Flavor: "+Eval("FName") %><br /><%# "Ingredient: " + Eval("Ingredient")%></div>
        
        <div style="clear:both"></div>
        <p>

        <div class="detail-congthuc">
           <%-- <asp:Panel ID="pnDetail" runat="server" Visible="false">--%>
            <%# "Recipe: "+Eval("Recipe")%>
            <%--</asp:Panel>--%>
          <span style="margin-left:220px">  <%# "Author: " + Eval("FProvider")%></span>
            <asp:Label ID="lbxemchitiet" runat="server" Text="" ForeColor="#FF0066"></asp:Label>
        </div>
        </p>
        <br />
        </div>
</ItemTemplate>
    </asp:DataList>
</asp:Content>

