<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="View_AddRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="title">Add Recipe</h2>
   <div class="addrecipe">
       <table style="width: 100%;">
           <tr>
               <td colspan="2">
                   &nbsp;
                   &nbsp;
             
                   <p class="style4" > Please enter in form below</p>
                   <p class="style4" > 
                       <asp:Label ID="lbthongbaoaddrecipe" runat="server"></asp:Label>
                   </p>
               </td>
           </tr>
            <tr>
               <td class="style5">
                  Your name (*)</td>
               <td>
                 
                   <asp:TextBox ID="txtprovider" runat="server" Width="455px"></asp:TextBox>
               </td>
           </tr>

            <tr>
               <td class="style5">
                  Address (*)</td>
               <td>
                 
                   <asp:TextBox ID="txtaddress" runat="server" Width="455px"></asp:TextBox>
               </td>
           </tr>
            <tr>
               <td class="style5">
                  Phone (*)</td>
               <td>
                 
                   <asp:TextBox ID="txtphone" runat="server" Width="455px"></asp:TextBox>
               </td>
           </tr>
            <tr>
               <td class="style5">
                  Email (*)</td>
               <td>
                 
                   <asp:TextBox ID="txtemail" runat="server" Width="455px"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="style5">
                   Name of flavor (*)</td>
               <td>
                 
                   <asp:TextBox ID="txtname" runat="server" Width="455px"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="style5">
                   Image of flavor (*)</td>
               <td>
                   <asp:FileUpload ID="uploadimage" runat="server" Width="455px" />
               </td>
           </tr>
           <tr>
               <td class="style5">
                   Ingredient(*)<br />
                   <br />
                   <br />
                   <br />
                   <br />
                   <br />
               </td>
               <td>
                  <asp:TextBox ID="txtingredient" runat="server" Width="455px" 
                       TextMode="MultiLine" Height="100px"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="style5">
                   Recipe (*)<br />
                   <br />
                   <br />
                   <br />
                   <br />
                   <br />
               </td>
               <td>
                 <asp:TextBox ID="txtrecipe" runat="server" Width="455px" TextMode="MultiLine" 
                       Height="100px"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="style5">
                   &nbsp;</td>
               <td>
                   <asp:Button ID="btnadd" runat="server" Text="Add" Height="40px" Width="80px" 
                       onclick="btnadd_Click" />
&nbsp;<asp:Button ID="btnreset" runat="server" Text="Reset" Height="40px" Width="80px" 
                       onclick="btnreset_Click" />
               </td>
           </tr>
       </table>
   </div>

</asp:Content>

