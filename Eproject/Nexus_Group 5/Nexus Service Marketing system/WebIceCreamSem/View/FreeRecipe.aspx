<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="FreeRecipe.aspx.cs" Inherits="View_FreeRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h2 class="title">Free Recipe</h2>
 <asp:DataList ID="dtlist" runat="server" >
        
        <ItemTemplate>
        <div style="width:100%; height:auto;">
            
        <div class="anh"><img src="../images/imageflavor/<%#Eval("FImage") %>"/></div>
        <div class="nguyenlieufree"><%# "Flavor: "+Eval("FName") %><br /><%# "Ingredient: " + Eval("Ingredient")%>
        <br />
       
        <asp:HyperLink ID="hplink" runat="server" NavigateUrl='<%#"~/View/FreeRecipeDetail.aspx?id="+Eval("FId")%>'><span>Detail</span></asp:HyperLink>
  
        </div>
        <br />
        </div>
        </ItemTemplate>
        
    </asp:DataList>
</asp:Content>

