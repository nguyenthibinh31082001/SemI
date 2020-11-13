<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="DetailFlavor.aspx.cs" Inherits="View_DetailFlavor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="title">
 <h2 >Flavor Detail</h2>
 </div>

<asp:DataList ID="dtlistdetail" runat="server" 
        onitemdatabound="dtlistdetail_ItemDataBound">
<ItemTemplate>
<div style="width:100%; height:auto;">
            
        <div class="detail-anh"><img src="../images/imageflavor/<%#Eval("FImage") %>"/></div>
        <br />
        <div class="detail-nguyenlieu"> <b> <%# "Flavor: </b>" + Eval("FName")%><br /><b> <%# "Ingredient: </b>" + Eval("Ingredient")%></div>
       
        <div style="clear:both"></div>
        <p>

        <div class="detail-congthuc">  
             <asp:Panel ID="pnDetail" runat="server" Visible="false">
          <b>  <%# "Recipe:</b> " + Eval("Recipe")%>
            </asp:Panel>

            <asp:Label ID="lbxemchitiet" runat="server" Text="" ForeColor="#FF0066"></asp:Label>
        </div>
        </p>
        <br />
        </div>
</ItemTemplate>
</asp:DataList>
</asp:Content>

