<%@ Control Language="C#" AutoEventWireup="true" CodeFile="funtionleft.ascx.cs" Inherits="funtionleft" %>
<style type="text/css">
    .style1
    {
        height: 19px;
        color:Blue;
        font-family:@Arial Unicode MS;
        font-size:16px;
        font-weight:bold;
       
    }
</style>
<table class="funtionleft" align="left" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center" class="style1" valign="top" >
         
            Quan Ly</td>
        
    </tr>
    <tr >
        
        <td valign="top" align="left">
            
            <ul class="left-menu">
                <li class="li-left">
                    <img src="../images/icon/admin.png" alt="user" 
                        style="height: 16px; width: 14px"/><asp:LinkButton ID="lbtQLCustomer" 
                        runat="server" onclick="lbtQLnguoidung_Click">User Management</asp:LinkButton></li>
                <li class="li-left"><img src="../images/icon/flavor.png" alt="flavor" style="width:13px; height:16px" /><asp:LinkButton ID="lbtQLFlavor" 
                        runat="server" onclick="lbtQLnguoidung_Click">   Flavor Management</asp:LinkButton></li>
                <li class="li-left"><img src="../images/icon/book.png" alt="book" style="width:13px; height:16px" /><asp:LinkButton ID="lbtQLBook" 
                        runat="server" onclick="lbtQLnguoidung_Click">   Book Management</asp:LinkButton></li>
                 <li class="li-left"><img src="../images/icon/flavor.png" 
                         style="height: 18px; width: 18px" alt="book" style="width:13px; height:16px" /><asp:LinkButton ID="lbtQLFEEDback" 
                        runat="server" onclick="lbtQLnguoidung_Click">FeddBack Management</asp:LinkButton></li>
                
               
            </ul>
        </td>
    </tr>
    </table>
