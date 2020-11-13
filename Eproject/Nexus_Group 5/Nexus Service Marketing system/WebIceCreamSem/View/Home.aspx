<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="View_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="title">
 <h2 >Flavor</h2>
 </div>

 <asp:DataList ID="dtlist" runat="server" 
        onselectedindexchanged="dtlist_SelectedIndexChanged">
        
        <ItemTemplate>
        <div style="width:100%; height:auto;">
            
        <div class="anh"><img src="../images/imageflavor/<%#Eval("FImage") %>"/></div>
        <div class="nguyenlieu"><%# "Flavor: "+Eval("FName") %> 
          &nbsp;  <img src="../images/imagepage/new.gif" /><br /><%# "Ingredient: " + Eval("Ingredient")%>
        <br />
        <asp:HyperLink ID="hplink" runat="server" NavigateUrl='<%#"~/View/DetailFlavor.aspx?id="+Eval("FId")%>'><span>Detail</span></asp:HyperLink>
  
        </div>
        <br />
        </div>
        </ItemTemplate>
        
    </asp:DataList>

  <%--  <div class="phantrang"><cc1:CollectionPager ID="clpage" runat="server" 
            MaxPages="100" SectionPadding="10" PageSize="8" ResultsFormat=""
            ShowFirstLast="True" >
    </cc1:CollectionPager></div>
--%>
<br />
    <asp:Label ID="lbphantrang" runat="server" Text="Page"></asp:Label>
     <asp:DataList ID="datalistflavor" runat="server" CellPadding="4" ForeColor="" RepeatColumns="3">
        <AlternatingItemStyle BackColor="Red" />
        <FooterStyle BackColor="#000000" Font-Bold="True" ForeColor="Red" />
        <HeaderStyle BackColor="#000000" Font-Bold="True" ForeColor="Red" />
        <ItemStyle BackColor="Red" />
        <SelectedItemStyle BackColor="#000000" Font-Bold="True" ForeColor="#000000" />
    </asp:DataList>


        <%--book recipe--%>
        <p />
         <h2 class="title">Book Recipes</h2>
 <asp:DataList ID="dtlisbook" runat="server" RepeatColumns="3">
        
        <ItemTemplate>
        <div class="book" >
            
   <div class="anhbook">
       <img src="../images/imagebook/<%#Eval("Image") %>" style="width:110px; height:92px;"/>
   <%# "Name: "+Eval("Bname") %> 
       <img src="../images/imagepage/hot.gif" /><br /><%# "Price: " + Eval("Price")%>
   <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/View/BookDetail.aspx?id="+Eval("BId")%>' ForeColor="Red"><span>Detail </span></asp:HyperLink> |
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#"~/View/Cart.aspx?id="+Eval("BId")%>' ForeColor="Red"><span>Add to cart</span></asp:HyperLink>
   </div>
      
        </div>
        </ItemTemplate>
    </asp:DataList>

    <asp:Label ID="lbphantrangbook" runat="server" Text="Page"></asp:Label>
     <asp:DataList ID="datalistbook" runat="server" CellPadding="4" ForeColor="Red" 
        RepeatColumns="3">
        <AlternatingItemStyle BackColor="Red" />
        <FooterStyle BackColor="#000000" Font-Bold="True" ForeColor="Red" />
        <HeaderStyle BackColor="#000000" Font-Bold="True" ForeColor="Red" />
        <ItemStyle BackColor="Red" />
        <SelectedItemStyle BackColor="#000000" Font-Bold="True" ForeColor="#000000" />
    </asp:DataList>

</asp:Content>

