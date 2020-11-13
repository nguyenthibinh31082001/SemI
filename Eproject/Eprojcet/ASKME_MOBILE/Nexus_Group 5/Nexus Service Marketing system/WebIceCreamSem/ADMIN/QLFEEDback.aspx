<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.master" AutoEventWireup="true" CodeFile="QLFEEDback.aspx.cs" Inherits="Quantri_QLFEEDback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 107px;
        }
        .style3
        {
            width: 769px;
        }
        .style5
        {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnshow" runat="server">
    <p style="font-family:@Arial Unicode MS; font-size:15px; margin:10px; color:Blue; font-weight:bold">Feddback management</p>
        <table style="width:100%; margin-left:20px; margin-top:20px" cellpadding="0" cellspacing="0">
            <tr>
                <td width="97%" valign="top">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" 
                        ImageUrl="~/images/icon/check.png" ToolTip="Update" Width="30px" 
                        onclick="ImageButton1_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="lbtdacheck" runat="server" onclick="lbtdacheck_Click" CssClass="linkbt a">Da Check</asp:LinkButton>
                </td>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" valign="top" >
                    <asp:GridView ID="grvchuacheck" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" PageSize="5" Width="97%" 
                        onpageindexchanging="grvchuacheck_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkallchuacheck" runat="server" AutoPostBack="true" 
                                    oncheckedchanged="chkallchuacheck_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkitemchuacheck" runat="server" />
                                <asp:TextBox ID="txtmachuacheck" runat="server" Text='<%#Eval("FBId") %>' Visible="false"></asp:TextBox>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        <asp:BoundField DataField="Sender" HeaderText="Sender" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField>
                            <HeaderTemplate>Chuc Nang</HeaderTemplate>
                            <ItemTemplate><asp:ImageButton ID="ibtchuacheck" runat="server" 
                                    ImageUrl="~/images/icon/chitiet.png" Width="30px"  
                                    CommandArgument='<%#Eval("FBId") %>' 
                                    onclick="ibtchuacheck_Click"/>
                            <asp:ImageButton ID="ibtxoachuacheck" runat="server" ImageUrl="~/images/icon/xoaa.png"
                                    Width="30px" CommandArgument='<%#Eval("FBId") %>' 
                                    onclick="ibtxoachuacheck_Click" Height="34px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
   
    <asp:Panel ID="pnupdate" runat="server" Visible="false">
        <table style="width: 100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td class="style3">
                    &nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="23px" 
                        ImageUrl="~/images/icon/xoaa.png" onclick="ImageButton2_Click" Width="32px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ibtback" runat="server" Height="26px" 
                        ImageUrl="~/images/icon/back.png" onclick="ibtback_Click" Width="33px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grvdachech" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" onpageindexchanging="grvdachech_PageIndexChanging" 
                        PageSize="5" Width="97%">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkalldacheck" runat="server" AutoPostBack="true" 
                                        oncheckedchanged="chkalldacheck_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkitemdacheck" runat="server" />
                                    <asp:TextBox ID="txtmadacheck" runat="server" Text='<%#Eval("FBId") %>' 
                                        Visible="false"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Sender" HeaderText="Sender" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chuc Nang
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtdacheck0" runat="server" 
                                        CommandArgument='<%#Eval("FBId") %>' CommandName="chuacheck" 
                                        ImageUrl="~/images/icon/chitiet.png" Width="30px" onclick="ibtdacheck0_Click" 
                                         />
                                    <asp:ImageButton ID="ibtxoadacheck0" runat="server" 
                                        CommandArgument='<%#Eval("FBId") %>' ImageUrl="~/images/icon/xoaa.png" 
                                        Width="22px" onclick="ibtxoadacheck0_Click1" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;
                </td>
                <td>
                    &nbsp; &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
   
    <asp:Panel ID="pnchitiet" runat="server" Visible="false">
        <table style="width: 100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td width="180px">
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:Label ID="lbtbchitiet" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="180px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Sender</td>
                <td>
                    <asp:TextBox ID="txtsender" runat="server" Width="257px"></asp:TextBox>
                    <asp:TextBox ID="txtids" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Title</td>
                <td>
                    <asp:TextBox ID="txttitle" runat="server" Width="257px"></asp:TextBox>
                    <asp:TextBox ID="txtchuyenhuong" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Contents</td>
                <td>
                    <asp:TextBox ID="txtcontent" runat="server" TextMode="MultiLine" Width="255px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Check</td>
                <td>
                    <asp:CheckBox ID="chkcheck" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Date</td>
                <td>
                    <asp:TextBox ID="txtdate" runat="server" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone</td>
                <td>
                    <asp:TextBox ID="txtphone" runat="server" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Email</td>
                <td class="style5">
                    <asp:TextBox ID="txtmail" runat="server" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Address</td>
                <td class="style5">
                    <asp:TextBox ID="txtaddress" runat="server" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButton4" runat="server" Height="28px" 
                        ImageUrl="~/images/icon/update.jpg" onclick="ImageButton3_Click" Width="30px" />
                    <asp:ImageButton ID="ibtquaylai0" runat="server" Height="31px" 
                        ImageUrl="~/images/icon/back.png" onclick="ibtquaylai_Click" Width="35px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

