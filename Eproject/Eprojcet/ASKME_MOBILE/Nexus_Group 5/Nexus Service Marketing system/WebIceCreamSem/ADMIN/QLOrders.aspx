<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.master" AutoEventWireup="true" CodeFile="QLOrders.aspx.cs" Inherits="Quantri_QLOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnshow" runat="server">
        <table style="width: 100%;" cellpadding="0" cellspacing="0">
            <tr bgcolor="#669999">
                <td>
                    <asp:ImageButton ID="ibtcheck" runat="server" Height="22px" 
                        ImageUrl="~/images/icon/check.png" onclick="ibtcheck_Click" ToolTip="Check" 
                        Width="25px" />
                    &nbsp;Check&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Da Giao</asp:LinkButton>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp; &nbsp; &nbsp;
                    <asp:GridView ID="grvorderchuacheck" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="97%" AllowPaging="True" 
                        AutoGenerateColumns="True" onpageindexchanging="Pageindex_changing" 
                        PageSize="5">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkallchuacheck" runat="server" AutoPostBack="true"
                                        oncheckedchanged="chkallchuacheck_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate><asp:CheckBox ID="chkitemchuacheck" runat="server" />
                                <asp:TextBox ID="txtmachuacheck" runat="server" Visible="false" Height="20px" Width="37px" Text='<%#Eval("OId") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chuc Nang
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtchitiet" runat="server" ImageUrl="~/images/icon/chitiet.png" 
                                        Width="25px" onclick="ibtchitiet_Click" CommandArgument='<%#Eval("OId") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>
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
                       
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnchitiet" runat="server" Visible="false">
        <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
            <tr bgcolor="#669999">
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="22px" 
                        ImageUrl="~/images/icon/back.png" ToolTip="Update" Width="25px" 
                        onclick="ImageButton1_Click" />
                    &nbsp;Update</td>
                <td>
                    <asp:Label ID="lbtb" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr bgcolor="">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Order Name</td>
                <td colspan="2">
                    <asp:TextBox ID="txtordernam" runat="server" Width="254px"></asp:TextBox>
                    <asp:TextBox ID="txtids" runat="server" Visible="False" Width="53px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Customer Name</td>
                <td class="style5">
                    <asp:TextBox ID="txtcuname" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td>
                    Email</td>
                <td>
                    <asp:TextBox ID="txtmail" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Book Name</td>
                <td>
                    <asp:TextBox ID="txtbookname" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Phone</td>
                <td>
                    <asp:TextBox ID="txtphone" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Address</td>
                <td>
                    <asp:TextBox ID="txtaddress" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    ContactDetail</td>
                <td>
                    <asp:TextBox ID="txtcontact" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Cost</td>
                <td>
                    <asp:TextBox ID="txtcost" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    PayOption</td>
                <td>
                    <asp:TextBox ID="txtpayoption" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    DateOrder</td>
                <td>
                    <asp:TextBox ID="txtdateorder" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    DateDelivery</td>
                <td>
                    <asp:TextBox ID="txtdatedeliver" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td bgcolor="#669999">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="pndacheck" runat="server" Visible="false">
        <table style="width:100%;">
            <tr>
                <td bgcolor="#669999">
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="27px" 
                        ImageUrl="~/images/icon/xoaa.png" onclick="ImageButton2_Click" ToolTip="Xoa" 
                        Width="33px" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ibtback" runat="server" Height="28px" 
                        ImageUrl="~/images/icon/back.png" onclick="ibtback_Click" Width="38px" />
                </td>
                <td bgcolor="#669999">
                    &nbsp;</td>
                <td bgcolor="#669999">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="grvdacheck" runat="server" AllowPaging="True" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" PageSize="5" Width="97%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                        <asp:TemplateField>
                        <HeaderTemplate><asp:CheckBox ID="chkalldacheck" runat="server" 
                                oncheckedchanged="chkalldacheck_CheckedChanged" AutoPostBack="true"/></HeaderTemplate>
                        <ItemTemplate><asp:CheckBox ID="chkitemdacheck" runat="server" />
                        <asp:TextBox ID="txtmadacheck" runat="server" Visible="false" Text='<%#Eval("OId") %>'></asp:TextBox>
                        </ItemTemplate>
                        </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtupdatea" runat="server" 
                                        CommandArgument='<%#Eval("OId") %>' Height="22px" 
                                        ImageUrl="~/images/icon/chitiet.png" onclick="ibtupdatea_Click" Width="24px" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
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
                       
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>

