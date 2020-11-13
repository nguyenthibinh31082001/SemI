<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.master" AutoEventWireup="true" CodeFile="QLFlavor.aspx.cs" Inherits="Quantri_QLFlavor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
           
        }
        .style5
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-family:@Arial Unicode MS; font-size:15px; margin:10px; color:Blue; font-weight:bold">Flavor Management</p>
    <asp:Panel ID="pnshow" runat="server">
     
    <table style="width:100%; margin-left:20px" cellspacing="0" cellpadding="0" >
        <tr valign="top">
            <td class="style4">
                <div style="float:left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ibtthem" runat="server" Height="32px" 
                        ImageUrl="~/images/icon/add.png" onclick="ibtthem_Click" ToolTip="Them Moi" 
                        Width="38px" />
                    <asp:ImageButton ID="ibtxoa" runat="server" Height="32px" 
                        ImageUrl="~/images/icon/xoaa.png" onclick="ibtxoa_Click" ToolTip="Xoa" Width="32px" />
                    &nbsp;</div>
           </td>
            <td class="style4">
            
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
               <asp:GridView ID="grvflavor" runat="server" CellPadding="4" 
            AutoGenerateColumns="False" Width="97%" AllowPaging="True" 
                    onpageindexchanging="grvflavor_PageIndexChanging" PageSize="5" 
                    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
           
            <Columns>
                
          <asp:TemplateField>
            <HeaderTemplate>
                
                <asp:CheckBox ID="chkcheckall" runat="server" oncheckedchanged="chkitem_CheckedChanged" AutoPostBack="true"/>

            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="chkitem" runat="server"   />
                 <asp:TextBox ID="txtma" runat="server" Visible="false" Text='<%#Eval("FId") %>'></asp:TextBox>
            </ItemTemplate>
            
            </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Image
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Image ID="img" runat="server" ImageUrl='<%# "~/images/imageflavor/"+Eval("Fimage").ToString()%>' Width="50px" Height="50px"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FName" HeaderText="Name" />
                <asp:BoundField DataField="Ingredient" HeaderText="Ingredient" />
                <asp:BoundField DataField="Recipe" HeaderText="Recipe" />
                <asp:BoundField DataField="TypeFlavor" HeaderText="TypeFlavor" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        Chuc Nang
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtsua" runat="server" CommandArgument='<%#Eval("FId") %>' 
                            Height="20px" ImageUrl="~/images/icon/xoaa.png" onclick="ibtsua_Click" 
                            Width="20px" />
                            <asp:ImageButton ID="ibtupdate" runat="server" 
                            CommandArgument='<%#Eval("FId") %>' ImageUrl="~/images/icon/update.jpg" Width="20px" 
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
               
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
                   <asp:ImageButton ID="ImageButton1" runat="server" 
                       ToolTip="Them Moi" Height="32px" 
                    ImageUrl="~/images/icon/add.png" Width="38px" onclick="ibtthem_Click" />
                    
                         &nbsp;&nbsp;&nbsp;
                         <asp:ImageButton ID="ImageButton2" runat="server" ToolTip="Xoa" 
                             Height="32px" Width="32px" ImageUrl="~/images/icon/xoaa.png" 
                             onclick="ibtxoa_Click"/>
                   &nbsp;</td>
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
                    <asp:FileUpload ID="fluimage" runat="server" Width="288px" />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Ingredient</td>
                <td class="style5">
                    <asp:TextBox ID="txtingre" runat="server" Height="39px" Width="290px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Recipe</td>
                <td class="style5">
                    <asp:TextBox ID="txtrecipe" runat="server" Height="33px" Width="291px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    TypeFlavor</td>
                <td class="style5">
                    <asp:CheckBox ID="chktype" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Address</td>
                <td class="style5">
                    <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Width="291px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Provider</td>
                <td class="style5">
                    <asp:TextBox ID="txtprovider" runat="server" Width="291px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Email</td>
                <td class="style5">
                    <asp:TextBox ID="txtmail" runat="server" Width="291px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Phone</td>
                <td class="style5">
                    <asp:TextBox ID="txtphone" runat="server" Width="291px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style5">
                    <asp:ImageButton ID="ibtthemm" runat="server" Height="26px" 
                        ImageUrl="~/images/icon/add.png" onclick="ibtthemm_Click" Width="28px" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ibtback" runat="server" Height="26px" 
                        ImageUrl="~/images/icon/back.png" onclick="ibtback_Click" Width="26px" />
                </td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>

