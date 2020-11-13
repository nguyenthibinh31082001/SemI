<%@ Page Title="" Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewPlans.aspx.cs" Inherits="AddNewOder" %>
<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebar1.ascx" tagname="DefaultSidebar1" tagprefix="uc2" %>
<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style2
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc3:CommonSidebar ID="CommonSidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        <br />
    </p>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Plans Connection" 
                    HorizontalAlign="Center" style="text-align: center">
                    <table align="center" class="style2">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gvDialup" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" Width="480px" Height="111px">
                                        <Columns>
                                    <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibtupdate0" runat="server" ImageUrl=""
                                            Width="61px" Height="16px" onclick="ibtupdate0_Click" CommandArgument='<%#Eval("PlanID") %>' />
                                           
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
                               <tr>
                               
                               </td></tr>
                                
                                     
                                
                                     <table align="update" border="0" style="font-size: 100%; width: 568px;" 
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
                                        <td  class="style12" >
                                            Plan ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlansUD" runat="server" ReadOnly="True" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td  class="style12">
                                            Plan Name</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlanNameUP" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style18">
                                            &nbsp;</td>
                                        <td class="style12">
                                            Security Deposit</td>
                                        <td class="style13" style="text-align: left">
                                            <asp:TextBox ID="txtSecurityDepositUD" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Description</td>
                                        <td style="text-align: left">
                                            <asp:ListBox ID="txtDescriptionUD" runat="server" Height="51px" Width="220px">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="style17">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            &nbsp;</td>
                                    </tr>
                                     <tr>
                                        <td align="right" class="style20">
                                            </td>
                                        <td align="right" class="style12">
                                            &nbsp;</td>
                                        <td style="text-align: left" class="style22">
                                            &nbsp;</td>
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
                                        <td  class="style12" >
                                            Plan ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlansNew" runat="server" ReadOnly="True" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style17">
                                            &nbsp;</td>
                                        <td  class="style12">
                                            Plan Name</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPlaneNameNew" runat="server" Width="220px" 
                                                Height="22px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style18">
                                            &nbsp;</td>
                                        <td class="style12">
                                            Security Deposit</td>
                                        <td class="txtSecurityDepositNew" style="text-align: left">
                                            <asp:TextBox ID="txtSecurityDepositNew" runat="server" Height="22px" Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            &nbsp;</td>
                                        <td class="style8">
                                            Description</td>
                                        <td style="text-align: left">
                                            <asp:ListBox ID="txtdescriptionNew" runat="server" Height="51px" Width="220px">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style19" style="color: Red;">
                                            &nbsp;</td>
                                        <td align="center" colspan="2" style="color: Red;">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <br />
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

