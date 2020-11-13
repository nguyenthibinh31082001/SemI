<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.master" AutoEventWireup="true" CodeFile="QLBook.aspx.cs" Inherits="Quantri_QLBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
           
            width:20px;
        }
        .style5
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p style="font-family:@Arial Unicode MS; font-size:15px; margin:10px; color:Blue; font-weight:bold">Book Managerment</p>
    <asp:Panel ID="pnshow" runat="server">
     
    <table style="width:100%; margin-left:20px" cellspacing="0" cellpadding="0" >
        <tr valign="top" >
            <td class="style4">
              
                   <asp:ImageButton ID="ibtthem" runat="server" 
                       ToolTip="Them Moi" Height="32px" 
                    ImageUrl="~/images/icon/add.png" Width="38px" onclick="ibtthem_Click" />
                   <asp:ImageButton ID="ibtxoa" runat="server" Height="32px" 
                       ImageUrl="~/images/icon/xoaa.png" onclick="ibtxoa_Click" ToolTip="Xoa" 
                       Width="32px" />
                
           </td>
            <td class="style4">
            
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
               <asp:GridView ID="grvbook" runat="server" CellPadding="4" 
            AutoGenerateColumns="false" Width="99%" 
           BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" AllowPaging="True" 
                   PageSize="5" onpageindexchanging="grvflavor_PageIndexChanging" 
                    onrowupdating="grvflavor_RowUpdating">
           
            <Columns>
                
          <asp:TemplateField>
            <HeaderTemplate>
                
                <asp:CheckBox ID="chkcheckall" runat="server"  oncheckedchanged="chkitem_CheckedChanged"   AutoPostBack="true"/>

            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="chkitem" runat="server"  />
                    
                 <asp:TextBox ID="txtma" runat="server" Visible="false" Text='<%#Eval("BId") %>'></asp:TextBox>
            </ItemTemplate>
            
            </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Image
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Image ID="img" runat="server" ImageUrl='<%# "~/images/imagebook/"+Eval("Image").ToString()%> ' Width="50px" Height="50px"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BName" HeaderText="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        Chuc Nang
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtsua" runat="server" CommandArgument='<%#Eval("BId") %>' 
                            Height="20px" ImageUrl="~/images/icon/xoaa.png" 
                            Width="20px" onclick="ibtsua_Click" />
                            <asp:ImageButton ID="ibtupdate" runat="server" 
                            CommandArgument='<%#Eval("BId") %>' ImageUrl="~/images/icon/update.jpg" Width="20px" 
                            Height="20px" onclick="ibtupdate_Click" />
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
            <td>
                <div style="float:left">
                   <asp:ImageButton ID="ImageButton1" runat="server" 
                       ToolTip="Them Moi" Height="32px" 
                    ImageUrl="~/images/icon/add.png" Width="38px" /></div>
                     <div style="float:left">
                         <asp:ImageButton ID="ImageButton2" runat="server" ToolTip="Xoa" 
                             Height="32px" Width="32px" ImageUrl="~/images/icon/xoaa.png" onclick="ibtxoa_Click" 
                            /></div>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </asp:Panel> 

    <asp:Panel ID="pnthemmoi" runat="server" Visible="False">
        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td class="style5" colspan="2">
                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lbtb" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Name:</td>
                <td>
                    <asp:TextBox ID="txtname" runat="server" Width="291px"></asp:TextBox>
                    <asp:TextBox ID="txtids" runat="server" Enabled="False" Width="49px" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Image</td>
                <td class="style5">
                    <asp:FileUpload ID="flu" runat="server" Width="288px" />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Description</td>
                <td class="style5">
                    <asp:TextBox ID="txtdecreption" runat="server" Height="95px" Width="291px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Price</td>
                <td class="style5">
                    <asp:TextBox ID="txtprice" runat="server" Height="31px" Width="290px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Author</td>
                <td class="style5">
                    <asp:TextBox ID="txtauthor" runat="server" Height="31px" Width="290px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;&nbsp;
                    </td>
                <td class="style5">
                    <asp:ImageButton ID="ImageButton7" runat="server" Height="28px" 
                        ImageUrl="~/images/icon/add.png" onclick="ImageButton3_Click" Width="38px" />
                    &nbsp;
                    <asp:ImageButton ID="ImageButton6" runat="server" Height="26px" 
                        ImageUrl="~/images/icon/back.png" onclick="ImageButton4_Click" Width="40px" />
                </td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>

