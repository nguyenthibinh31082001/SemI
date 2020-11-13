<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="VewOrdersDaiup.aspx.cs" Inherits="ViewOrders" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
     <style type="text/css">
         .style17
        {
            text-align: left;
            font-weight: bold;
            width: 53px;
            font-size: 12pt;
        }
                

        .style8
        {
            text-align: left;
            font-weight: bold;
            width: 148px;
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
        .style19
        {
            width: 53px;
        }
        .style2
        {
            width: 100%;
        }
        .style20
        {
            width: 53px;
            text-align: left;
            height: 24px;
            font-weight: bold;
            font-size: 12pt;
        }
        .style22
        {
            height: 24px;
        }
         .style23
         {
             text-align: left;
             font-weight: bold;
             width: 53px;
             font-size: 12pt;
             height: 23px;
         }
         .style24
         {
             text-align: left;
             font-weight: bold;
             width: 148px;
             font-size: 12pt;
             height: 23px;
         }
         .style25
         {
             height: 23px;
         }
         .style26
         {
             text-align: left;
             font-weight: bold;
             width: 53px;
             font-size: 12pt;
             height: 42px;
         }
         .style27
         {
             text-align: left;
             font-weight: bold;
             width: 148px;
             font-size: 12pt;
             height: 42px;
         }
         .style28
         {
             height: 42px;
         }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:CommonSidebar ID="CommonSidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="Add New Dialup Connection" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <br />
                                Registered passport: <asp:TextBox ID="txttim" runat="server" 
                                    Height="22px" Width="220px"></asp:TextBox>
                                <asp:Button ID="btnsearch" runat="server" onclick="btnsearch_Click" 
                                    Text="Search" />
                                <br />
                                <br />
                                <asp:Label ID="lbtbtimkiem" runat="server"></asp:Label>
                                <asp:GridView ID="gvDialup" runat="server" AllowPaging="True" CellPadding="4" 
                                    ForeColor="#333333" PageSize="10" Width="522px" 
                                    onpageindexchanging="gvDialup_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField>
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
                                <asp:Button ID="Button11" runat="server" onclick="Button11_Click" 
                                    Text="Add New" />
                               <tr>
                               
                               </td></tr>
                                
                                     
                                
                                     <table align="center" border="0" style="font-size: 100%; width: 568px;" 
                                    ID="table1" runat="server" >
                                    <tr>
                                        <td align="right" class="style23">
                                            </td>
                                        <td align="right" class="style24">
                                            &nbsp;</td>
                                        <td style="text-align: left" class="style25">
                                            </td>
                                    </tr>
                                                                        <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            OrderID</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            Order Status</td>
                                        <td style="text-align: left">
                                            <asp:DropDownList ID="drplanStatus" runat="server" Height="16px" Width="174px">
                                                <asp:ListItem>Inactive</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td align="right" class="style8">
                                            DialUp Connection</td>
                                        <td style="text-align: left">
                                            <asp:DropDownList ID="drplanUd" runat="server" Height="16px" 
                                                onselectedindexchanged="PlanID2_SelectedIndexChanged" Width="178px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td align="right" class="style18">
                                            </td>
                                        <td align="right" class="style12">
                                            SecurityDeposit</td>
                                        <td style="text-align: left" class="style13">
                                            <asp:TextBox ID="txtSecurityDepositUd" runat="server" Height="22px" 
                                                Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td align="right" class="style20">
                                            &nbsp;</td>
                                        <td align="center" class="style12">
                                            City</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:DropDownList ID="ddlcity1" runat="server" Height="16px" Width="216px">
                                            </asp:DropDownList>
                                         </td>
                                    </tr>  <tr>
                                        <td align="right" class="style20">
                                            &nbsp;</td>
                                        <td align="center" class="style12">
                                            District</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:DropDownList ID="ddldistrict1" runat="server" Height="16px" Width="216px">
                                            </asp:DropDownList>
                                             </td>
                                    </tr>  <tr>
                                        <td align="right" class="style18">
                                             </td>
                                        <td align="right" class="style12">
                                            Phone</td>
                                        <td style="text-align: left" class="style13">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                      <tr>
                                        <td align="right" class="style20">
                                            &nbsp;</td>
                                        <td align="right" class="style12">
                                            Equipment</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:DropDownList ID="DEqui1" runat="server" Height="16px" Width="216px">
                                            </asp:DropDownList>
                                          </td>
                                    </tr>
                                       <tr>
                                        <td align="right" class="style20">
                                            </td>
                                        <td align="right" class="style12">
                                            Passport</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:TextBox ID="Passport1" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                        <tr>
                                        <td align="right" class="style20">
                                            </td>
                                        <td align="right" class="style12">
                                            Name</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:TextBox ID="Name1" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style19" style="color: Red;">
                                            &nbsp;</td>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Button ID="btnUpdatePlans" runat="server" 
                        Text="Update" Width="87px" onclick="btnUpdatePlans_Click" />
                                            &nbsp;&nbsp;&nbsp;<asp:Button ID="Btndelete" runat="server" onclick="Btndelete_Click" 
                                                Text="Delete" />
&nbsp;
                                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                        onclick="btnCancel_Click" Text="Cancel" Width="87px" />
                                            
                                            <br />
                                            </td>
                                    </tr>
                                </table>
                                
                           
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
                                        <td align="right" class="style26">
                                            </td>
                                        <td align="right" class="style27">
                                            DialUp Connection</td>
                                        <td style="text-align: left" class="style28">
                                            <asp:DropDownList ID="ddldiakha" runat="server" AutoPostBack="True" Height="16px" 
                                                onselectedindexchanged="PlanID2_SelectedIndexChanged" Width="178px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style18">
                                            &nbsp;</td>
                                        <td align="right" class="style12">
                                            POrder Status</td>
                                        <td style="text-align: left" class="style13">
                                            <asp:DropDownList ID="ddlpokha" runat="server" Height="16px" Width="140px">
                                                <asp:ListItem>Inactive</asp:ListItem>
                                                <asp:ListItem>active</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="txtids" runat="server" Visible="False" Width="46px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style18">
                                            &nbsp;</td>
                                        <td class="style12">
                                            Order Date</td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtdatekha" runat="server"></asp:TextBox>
                                            <asp:ImageButton ID="ibtdate" runat="server" Height="24px" 
                                                ImageUrl="~/images/Calendar.png" onclick="ibtdate_Click" Width="19px" />
                                            <asp:Calendar ID="cldorder" runat="server" 
                                                onselectionchanged="cldorder_SelectionChanged" Visible="False"></asp:Calendar>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Security Deposit</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtsecukha" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                      <tr>
                                        <td align="right" class="style20">
                                            &nbsp;</td>
                                        <td align="right" class="style12">
                                            City</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:DropDownList ID="ddlcity" runat="server" Height="16px" Width="224px" 
                                                AutoPostBack="True" onselectedindexchanged="ddlcity_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>  <tr>
                                        <td align="right" class="style20">
                                            &nbsp;</td>
                                        <td align="right" class="style12">
                                            District</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:DropDownList ID="ddldistrict" runat="server" Width="218px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr> 
                                     <tr>
                                        <td align="right" class="style20">
                                            &nbsp;</td>
                                        <td align="right" class="style12">
                                            Phone</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:TextBox ID="txtphonekha" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                                
                                        </td>
                                    </tr>
                                        <tr>
                                        <td align="right" class="style20">
                                            &nbsp;</td>
                                        <td align="right" class="style12">
                                            Equipment</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:DropDownList ID="DEqui" runat="server" Height="16px" 
                                                Width="217px" >
                                                <asp:ListItem>Null</asp:ListItem>
                                            </asp:DropDownList>
                                            </td>
                                    </tr>
                                        <tr>
                                        <td align="right" class="style20">
                                            </td>
                                        <td align="right" class="style12">
                                            Passport</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:TextBox ID="Passport2" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                        <tr>
                                        <td align="right" class="style20">
                                            </td>
                                        <td align="right" class="style12">
                                            Name</td>
                                        <td style="text-align: left" class="style22">
                                            <asp:TextBox ID="Name2" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                         <tr>
                                             <td align="center" class="style19" style="color: Red;">
                                                 &nbsp;</td>
                                             <td align="center" colspan="2" style="color: Red;">
                                                 &nbsp;</td>
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
                                            
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                           
                           
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />

                    <table id="table8" runat=server  align="center">
                    <tr>
                    <td ID="td1">
                    <asp:Label ID="datetimeEX" runat="server" Text="Label"></asp:Label>
                       </td>            
                    </tr>
                    </table>


                    <table id="tableupdatefull" runat=server  align="center">
                    <tr>
                    <td ID="tdupdate"><asp:Label ID="lbtbupdate" runat="server"></asp:Label>
                    
                       </td>            
                    </tr>
                    </table>


                    <table id="tableaddnewfull" runat="server" align="center">
                    <tr>
                                     
                                         <td ID="tdaddnew"><asp:Label ID="lbtb" runat="server"></asp:Label>
                                             &nbsp;</td>
                                </tr>
                    </table>
                </asp:Panel>
    </asp:Content>

