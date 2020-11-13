<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Registrator.aspx.cs" Inherits="View_Registrator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style2
    {
        width: 163px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2 class="title">Registration</h2>

<div>
    <table style="width: 100%;">

          <tr>
            <td class="style2" >
                &nbsp;</td>
                <td >
                <br />
                   <h3> Information Register</h3>&nbsp;
                    <asp:Label ID="lbstatus" runat="server" 
                        style="color: #003366; font-size: medium; font-family: Arial, Helvetica, sans-serif"></asp:Label>
              </td>
        </tr>
        <tr>
            <td class="style2">
                <label for="username_5">User Name (*)</label>
            </td>
            <td class="style3">
               <asp:TextBox ID="txtuser" runat="server" Width="400px" Height="25px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
               <label for="password_5">Password (*)</label>
            </td>
            <td class="style3">
               <asp:TextBox ID="txtpass" runat="server" Width="400px" Height="25px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <label for="name_5">Name (*)</label>
            </td>
            <td class="style3">
               <asp:TextBox ID="txtname" runat="server" Width="400px" Height="25px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
               <label for="phone_5">Phone (*)</label>
            <td class="style3">
                 <asp:TextBox ID="txtphone" runat="server" Width="400px" Height="25px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <label for="email_5">E-mail (*)</label>
                </td>
            <td class="style3">
                  <asp:TextBox ID="txtemail" runat="server" Width="400px" Height="25px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="style2">
                <label for="address_5">Address (*)</label>
                </td>
            <td class="style3">
                 <asp:TextBox ID="txtaddress" runat="server" Width="400px" Height="25px"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td class="style2">
                <label for="address_5">Account Number (*)</label>
                <br />
                <br />
                </td>
            <td class="style3">
               <asp:TextBox ID="txtaccnumber" runat="server" Width="400px" Height="25px"></asp:TextBox>
               
            </td>
        </tr>

           <tr>
            <td class="style2">
                <label for="address_5">Type Fees (*)</label>
                <br />
                <br />
                </td>
            <td class="style3">
                <asp:DropDownList ID="droptypefees" runat="server" Width="200px" Height="40px">
                    <asp:ListItem>Month</asp:ListItem>
                    <asp:ListItem>Year</asp:ListItem>
                </asp:DropDownList>
                 &nbsp;<asp:Button ID="Button2" runat="server" onclick="btnsubmit_Click" 
                     Text="Submit" Height="40px" Width="70px" />
            </td>
        </tr>
    </table>
</div>



</asp:Content>

