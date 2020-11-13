<%@ Page Title="" Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="aaaaaaaaaaaaaaaaa.aspx.cs" Inherits="aaaaaaaaaaaaaaaaa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
  <asp:Panel ID="pnshow" runat="server">
     
    <table style="width:100%; margin-left:20px" cellspacing="0" cellpadding="0" >
        <tr valign="top" >
            <td class="style4">
              
                   <asp:ImageButton ID="ibtthem" runat="server" 
                       ToolTip="Them Moi" Height="32px" 
                    ImageUrl="~/images/icon/add.png" Width="38px" onclick="ibtthem_Click" />
                
           </td>
            <td class="style4">
            
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
               <asp:GridView ID="gvDialup" runat="server" CellPadding="4" Width="480px" 
                    ForeColor="#333333" GridLines="None" Height="111px">
           
            <Columns>
                
          <asp:TemplateField>
            <ItemTemplate>
                <asp:ImageButton ID="ibtupdate0" runat="server" Height="16px" ImageUrl="" 
                    Width="61px" />
            </ItemTemplate>
            
            </asp:TemplateField>
            </Columns>
        

                   <RowStyle BackColor="#EFF3FB" />
        

            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                   <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                   <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                   <EditRowStyle BackColor="#2461BF" />
                   <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <div style="float:left">
                   </div>
                     <div style="float:left">
                         </div>
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
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            DialUp ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtDialUpID1" runat="server" Width="220px" Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Package</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPackage1" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                            <asp:TextBox ID="txtids" runat="server" Visible="False" Width="46px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style18">
                                            &nbsp;</td>
                                        <td class="style12">
                                            Duration</td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtDuration1" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Price</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPrice1" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                      <tr>
                                        <td align="right" class="style20">
                                            </td>
                                        <td align="right" class="style21">
                                            Validity</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:TextBox ID="txtValidity1" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    </tr>
                                      <tr>
                                        <td align="right" class="style20">
                                            </td>
                                        <td align="right" class="style21">
                                            PlanID</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:DropDownList ID="drplan2" runat="server" Height="16px" Width="178px" 
                                                onselectedindexchanged="PlanID2_SelectedIndexChanged">
                                            </asp:DropDownList>
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

