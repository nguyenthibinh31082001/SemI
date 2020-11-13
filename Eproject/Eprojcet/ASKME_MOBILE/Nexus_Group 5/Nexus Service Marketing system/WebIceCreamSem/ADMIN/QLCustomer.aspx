<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.master" AutoEventWireup="true" CodeFile="QLCustomer.aspx.cs" Inherits="Quantri_QLAdmin" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
          
        }
        .style6
        {
            height: 24px;
        }
        .style7
        {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <asp:Panel ID="pnupdate" runat="server" Visible="False">
      <p  style="font-family:@Arial Unicode MS; font-size:15px; margin:10px; color:Blue; font-weight:bold">User Management</p>
        <table style="width:100%; margin-left:20px" cellpadding="0" cellspacing="0">
            <tr>
                <td class="style5">
                       &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                </td>
                <td class="style5">
                    <asp:Label ID="lbtb" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5" colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="170">
                    Name</td>
                <td>
                    <asp:TextBox ID="txtname" runat="server" Width="222px"></asp:TextBox>
                    <asp:TextBox ID="txtids" runat="server" Visible="False" Width="40px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td >
                    UserName</td>
                <td>
                    <asp:TextBox ID="txtusername" runat="server" Width="222px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td >
                    PassWord</td>
                <td>
                    <asp:TextBox ID="txtpass" runat="server" Width="222px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email</td>
                <td>
                    <asp:TextBox ID="txtmail" runat="server" Width="222px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td >
                    Address</td>
                <td>
                    <asp:TextBox ID="txtaddress" runat="server" Width="222px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Phone</td>
                <td class="style7">
                    <asp:TextBox ID="txtphone" runat="server" Width="222px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="style7">
                    AccountNumber</td>
                <td class="style7">
                    <asp:TextBox ID="txtaccount" runat="server" Width="222px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    TotalAmount</td>
                <td class="style7">
                    <asp:TextBox ID="txttoalamount" runat="server" Width="222px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    TypeFees</td>
                <td class="style7">
                    <asp:DropDownList ID="ddlmont" runat="server">
                        <asp:ListItem>Month</asp:ListItem>
                        <asp:ListItem>Year</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    DateRegist</td>
                <td class="style7">
                    <asp:TextBox ID="txtdateregist" runat="server" Width="222px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    DateExpired</td>
                <td class="style7">
                    <asp:TextBox ID="txtdateepi" runat="server" Width="222px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    IsAdmin</td>
                <td class="style7">
                    <asp:CheckBox ID="chkisadmin" runat="server" />
                </td>
            </tr>
            <tr>
                <td > &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButton5" runat="server" Height="33px" 
                        ImageUrl="~/images/icon/add.png" onclick="ImageButton1_Click" 
                        ToolTip="Them Moi" Width="32px" />
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" Height="33px" 
                        ImageUrl="~/images/icon/back.png" onclick="ibtback_Click" Width="32px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnshow" runat="server">
        <table style="width:100%; margin-top: 1px; margin-left:20px" cellpadding="0" cellspacing="0">
            <tr>
                <td class="style6"> &nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:ImageButton ID="btnthem" runat="server" Height="33px" 
                        ImageUrl="~/images/icon/add.png" Width="32px" ToolTip="Them Moi" onclick="btnthem_Click" 
                        />
                         &nbsp;&nbsp;
                         <asp:ImageButton ID="ibtxoa" runat="server" Height="31px" 
                        ImageUrl="~/images/icon/xoaa.png" Width="29px" ToolTip="Xoa" 
                        onclick="ibtxoa_Click"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="lbtadmin" runat="server" onclick="lbtadmin_Click">View Admin</asp:LinkButton>
                        </td>    
                        
                <td class="style6">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grvadmin" runat="server" BackColor="White" 
                        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        Width="99%" AutoGenerateColumns="False">
                        <Columns>
                        <asp:TemplateField>
                        <HeaderTemplate>
                        <asp:CheckBox ID="chkall" runat="server" AutoPostBack="true"  oncheckedchanged="chkitem_CheckedChanged" />
                        </HeaderTemplate>
                        <ItemTemplate>
                        <asp:CheckBox ID="chkitem" runat="server" />
                        <asp:TextBox ID="txtma" runat="server" Text='<%#Eval("CId") %>' Visible="false"></asp:TextBox>
                        </ItemTemplate>
                        </asp:TemplateField>
                            <asp:BoundField DataField="UserName" HeaderText="UserName" />
                            <asp:BoundField DataField="PassWord" HeaderText="PassWord" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                            <asp:BoundField DataField="IsAdmin" HeaderText="IsAdmin" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chuc Nang
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtxoaitem" runat="server" 
                                        CommandArgument='<%#Eval("CId") %>' Height="20" 
                                        ImageUrl="~/images/icon/xoaa.png" onclick="ibtxoaitem_Click2" Width="20px" CommandName='<%#Eval("IsAdmin") %>'/>
                                    <asp:ImageButton ID="ibtupdate" runat="server"  
                                        CommandArgument='<%#Eval("CId") %>' Height="20px" 
                                        ImageUrl="~/images/icon/chitiet.png" onclick="ibtupdate_Click2" 
                                        Width="20px"  />
                                </ItemTemplate>
                            </asp:TemplateField>
      
                        </Columns>
                       
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td> &nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:ImageButton ID="ImageButton2" runat="server" Height="33px" 
                        ImageUrl="~/images/icon/add.png" Width="32px" ToolTip="Them Moi" onclick="btnthem_Click" />
                         &nbsp;&nbsp;
                         <asp:ImageButton ID="ImageButton4" runat="server" Height="31px" 
                        ImageUrl="~/images/icon/xoaa.png" Width="29px" ToolTip="Xoa" 
                        onclick="ibtxoa_Click"/></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

   
    <asp:Panel ID="pnAdmin" runat="server" Visible="false">
     <p  style="font-family:@Arial Unicode MS; font-size:15px; margin:10px; color:Blue; font-weight:bold">Admin Management</p>
                
    <asp:GridView ID="grvamin" runat="server" BackColor="White" 
                        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        Width="99%" AutoGenerateColumns="False">
                        <Columns>
                        <asp:TemplateField>
                        <ItemTemplate>
                        <asp:TextBox ID="txtma" runat="server" Text='<%#Eval("CId") %>' Visible="false"></asp:TextBox>
                        </ItemTemplate>
                        </asp:TemplateField>
                            <asp:BoundField DataField="UserName" HeaderText="UserName" />
                            <asp:BoundField DataField="PassWord" HeaderText="PassWord" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                            <asp:BoundField DataField="IsAdmin" HeaderText="IsAdmin" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chuc Nang
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtupdate" runat="server"  CommandArgument='<%#Eval("CId") %>' Height="20px" 
                                        ImageUrl="~/images/icon/update.jpg" onclick="ibtupdate_Click2" Width="20px"  />
                                </ItemTemplate>
                            </asp:TemplateField>
      
                        </Columns>
                       
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>

                         <asp:ImageButton ID="ImageButton3" runat="server" Height="33px" 
                        ImageUrl="~/images/icon/back.png" Width="32px" 
            onclick="ImageButton3_Click" />
                
    
    </asp:Panel>
    </asp:Content>

