<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="PlanManagement.aspx.cs" Inherits="PlanManagement" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 78%;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            font-size: xx-large;
            font-weight: bold;
            color: #0000FF;
        }
        .style14
        {
            text-align: left;
            font-weight: bold;
            width: 52px;
            font-size: 12pt;
        }
        

        .style8
        {
            text-align: left;
            font-weight: bold;
            width: 148px;
            font-size: 12pt;
        }
        .style15
        {
            width: 52px;
            text-align: left;
            height: 26px;
            font-weight: bold;
            font-size: 12pt;
        }
        .style12
        {
            width: 148px;
            text-align: left;
            height: 26px;
            font-weight: bold;
            font-size: 12pt;
        }
        .style13
        {
            height: 26px;
        }
        .style16
        {
            width: 52px;
        }
        .style17
        {
            text-align: left;
            font-weight: bold;
            width: 53px;
            font-size: 12pt;
        }
        .style18
        {
            width: 53px;
            text-align: left;
            height: 26px;
            font-weight: bold;
            font-size: 12pt;
        }
        .style19
        {
            width: 53px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:DefaultSidebarAdmin ID="DefaultSidebarAdmin1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        <br />
    </p>
    <table align="center" class="style1">
        <tr>
            <td class="style3" style="text-align: center">
                PLAN MANAGEMENT</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" GroupingText="Plans" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvPlan" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Width="481px">
                                        <Columns>
                                    <asp:TemplateField>
                                    <HeaderTemplate>manager</HeaderTemplate>
                                    <ItemTemplate><asp:ImageButton ID="ibtupdate" runat="server" ImageUrl="~/images/button.png"
                                            Width="61px" Height="16px" CommandArgument='<%#Eval("PlanID") %>' onclick="ibtupdate_Click"/>
                                           
                                            </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:Button ID="Button11" runat="server" Text="Add New" 
                                    onclick="Button11_Click" />
                                <br />
                                <asp:Panel ID="pnchitiet" runat="server" Visible="false">
                                     <table align="center" border="0" style="font-size: 100%; width: 568px;" 
                                    ID="table1" runat="server" >
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Plan ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlanID" runat="server" ReadOnly="True" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            <span style="color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(80, 124, 209); display: inline !important; float: none;">
                                            PlanName</span></td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlanName" runat="server" Width="220px" 
                                                ontextchanged="txtPlanName_TextChanged"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style18">
                                            &nbsp;</td>
                                        <td class="style12">
                                            <span style="color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(80, 124, 209); display: inline !important; float: none;">
                                            SecurityDeposit</span></td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtSecurityDeposit" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            &nbsp;</td>
                                        <td class="style8">
                                            <span style="color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(80, 124, 209); display: inline !important; float: none;">
                                            Description</span></td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtDescription" runat="server" Width="220px" Height="92px" 
                                                TextMode="MultiLine" Wrap="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style19" style="color: Red;">
                                            &nbsp;</td>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Button ID="btnUpdatePlans" runat="server" 
                        Text="Update" Width="87px" onclick="btnUpdatePlans_Click" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                        onclick="btnCancel_Click" Text="Cancel" Width="87px" />
                                            <br />
                                            </td>
                                    </tr>
                                </table>
                                </asp:Panel>
                           
                                <table ID="table6" runat="server" align="center" border="0" 
                                    style="font-size: 100%; width: 568px;">
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Plan ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlanID4" runat="server" ReadOnly="True" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            PlanName
                                        </td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlanName1" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style18">
                                            &nbsp;</td>
                                        <td class="style12">
                                            SecurityDeposit</td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtSecurityDeposit1" runat="server" Height="22px" 
                                                Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Description</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtDescription1" runat="server" Height="92px" 
                                                TextMode="MultiLine" Width="220px" Wrap="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style19" style="color: Red;">
                                            &nbsp;</td>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Button ID="btnNew" runat="server" onclick="btnNew_Click" Text="New" 
                                                Width="87px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnCancel6" runat="server" CausesValidation="False" 
                                                onclick="btnCancel_Click" Text="Cancel" Width="87px" />
                                            <asp:Label ID="lbtb" runat="server"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                           
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel2" runat="server" GroupingText="DialUp Connection" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvDialup" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Height="111px" Width="480px">
                                        <Columns>
                                    <asp:TemplateField>
                                    <ItemTemplate><asp:ImageButton ID="ibtupdate" runat="server" ImageUrl="" 
                                            Width="61px" Height="16px"/></ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:Button ID="Button12" runat="server" Text="Add New" 
                                    onclick="Button12_Click" />
                                <br />
                                <table align="center" border="0" style="font-size: 100%; width: 568px;" 
                                    ID="table2" runat="server">
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            DialUp ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtDaiUp" runat="server" ReadOnly="True" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Package</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPackage" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style12">
                                            Duration</td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtDuration" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            <b>Price</b></td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPrice" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Validity</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtValidity" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style16" style="color: Red;">
                                            &nbsp;</td>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Button ID="Button3" runat="server" Text="Button" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Button4" runat="server" Text="Button" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel3" runat="server" GroupingText="BroadBand Connection" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvBB" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Height="164px" Width="481px">
                                        <Columns>
                                    <asp:TemplateField>
                                    <ItemTemplate><asp:ImageButton ID="ibtupdate" runat="server" ImageUrl="" 
                                            Width="61px" Height="16px"/></ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:Button ID="Button13" runat="server" Text="Add New" 
                                    onclick="Button13_Click" />
                                <br />
                                <table align="center" border="0" style="font-size: 100%; width: 568px;" 
                                    ID="table3" runat="server">
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            DialUp ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtDaiUp2" runat="server" ReadOnly="True" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Plan ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlanID1" runat="server" ReadOnly="True" Width="220px">aaaaaaa</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Package</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPackage2" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style12">
                                            Duration</td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtDuration2" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Address</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtAddress2" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            <b>Price</b></td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPrice2" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Validity</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtValidity2" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style16" style="color: Red;">
                                            &nbsp;</td>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Button ID="Button5" runat="server" Text="Button" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Button6" runat="server" Text="Button" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel4" runat="server" GroupingText="LandLine Connection" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvLL" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Height="202px" Width="480px">
                                        <Columns>
                                    <asp:TemplateField>
                                    <ItemTemplate><asp:ImageButton ID="ibtupdate" runat="server" ImageUrl="" 
                                            Width="61px" Height="16px"/></ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:Button ID="Button14" runat="server" Text="Add New" 
                                    onclick="Button14_Click" />
                                <br />
                                <table align="center" border="0" style="font-size: 100%; width: 568px;" 
                                    ID="table4" runat="server">
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            DialUp ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtDaiUp3" runat="server" ReadOnly="True" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Plan ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlanID2" runat="server" ReadOnly="True" Width="220px">aaaaaaa</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Package</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPackage3" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style12">
                                            Duration</td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtDuration3" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Address</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtAddress3" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            <b>Price</b></td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPrice3" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Validity</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtValidity3" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style16" style="color: Red;">
                                            &nbsp;</td>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Button ID="Button7" runat="server" Text="Button" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Button8" runat="server" Text="Button" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel5" runat="server" GroupingText="LandLine Call Charge" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvLLCC" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Height="197px" Width="477px">
                                        <Columns>
                                    <asp:TemplateField>
                                    <ItemTemplate><asp:ImageButton ID="ibtupdate" runat="server" ImageUrl="" 
                                            Width="61px" Height="16px"/></ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <br />
                                <asp:Button ID="Button15" runat="server" Text="Add New" 
                                    onclick="Button15_Click" />
                                <br />
                                <table align="center" border="0" style="font-size: 100%; width: 568px;" 
                                    ID="table5" runat="server">
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            DialUp ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtDaiUp4" runat="server" ReadOnly="True" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Plan ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlanID3" runat="server" ReadOnly="True" Width="220px">aaaaaaa</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style14">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Package</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPackage4" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style12">
                                            Duration</td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtDuration4" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Address</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtAddress4" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            <b>Price</b></td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPrice4" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Validity</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtValidity4" runat="server" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style16" style="color: Red;">
                                            &nbsp;</td>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Button ID="Button9" runat="server" Text="Button" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Button10" runat="server" Text="Button" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p>
    </p>
</asp:Content>

