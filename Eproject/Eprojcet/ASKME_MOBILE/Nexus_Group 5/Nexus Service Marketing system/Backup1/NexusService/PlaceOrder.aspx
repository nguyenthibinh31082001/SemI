<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarBroker.ascx" tagname="DefaultSidebarBroker" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
            font-weight: bold;
            color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:DefaultSidebarBroker ID="DefaultSidebarBroker1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p style="text-align: center">
        <br />
        <span class="style1">PLACE ORDER</span></p>
    <asp:Panel ID="pnlPlaceOrder" runat="server" GroupingText="Place Order" 
        Height="446px" Width="660px">
        <asp:MultiView ID="mtvPlaceOrder" runat="server">
            <asp:View ID="vwPlace1" runat="server">
                <asp:Panel ID="pnlChoosePlan" runat="server" GroupingText="Choose Plan" 
                    HorizontalAlign="Center" Width="650px">
                    <asp:RadioButtonList ID="radPlans" runat="server" AutoPostBack="True" 
                        DataTextField="PlanName" DataValueField="PlanID" 
                        onselectedindexchanged="radPlans_SelectedIndexChanged" 
                        RepeatDirection="Horizontal" RepeatLayout="Flow" style="text-align: left">
                    </asp:RadioButtonList>
                </asp:Panel>
                <asp:Panel ID="pnlConTypes" runat="server" 
                    GroupingText="Choose Connection Types" HorizontalAlign="Center" Width="650px">
                    <asp:RadioButtonList ID="radDialUpType" runat="server" 
                        AppendDataBoundItems="True" AutoPostBack="True" DataTextField="Package" 
                        onselectedindexchanged="radDialUpType_SelectedIndexChanged" 
                        RepeatDirection="Horizontal" RepeatLayout="Flow" style="text-align: left">
                    </asp:RadioButtonList>
                    <br />
                    Security Deposit:&nbsp;
                    <asp:Label ID="lbDeposit" runat="server"></asp:Label>
                    &nbsp;$</asp:Panel>
                <asp:Panel ID="pnlPackages" runat="server" GroupingText="Choose Packages" 
                    HorizontalAlign="Center" Width="650px">
                    <asp:RadioButtonList ID="radPackage" runat="server" DataTextField="Duration" 
                        onload="radDuration_Load" RepeatDirection="Horizontal" RepeatLayout="Flow" 
                        style="height: 28px; text-align: left;">
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvDuration" runat="server" 
                        ControlToValidate="radPackage" Display="Dynamic" ErrorMessage="Choose Package">*</asp:RequiredFieldValidator>
                    <table class="style3">
                        <tr>
                            <td class="style4">
                                Choose Equipment:</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <asp:DropDownList ID="ddlEquipment" runat="server" 
                                    DataTextField="EquipmentName" DataValueField="EquipmentID">
                                    <asp:ListItem Selected="True">Choose Equipment</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEquipment" runat="server" 
                                    ControlToValidate="ddlEquipment" Display="Dynamic" 
                                    ErrorMessage="Choose Equipment">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="style6">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td style="text-align: left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td style="text-align: left; margin-left: 40px">
                                <asp:Button ID="btnPlace" runat="server" onclick="btnPlace_Click" 
                                    Text="PLACE ORDER" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                    onclick="btnCancel_Click" Text="CANCEL" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td style="text-align: left; margin-left: 40px">
                                <asp:ValidationSummary ID="vsMessage" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:View>
            <asp:View ID="vwPlace2" runat="server">
                <table align="center" style="width:81%;">
                    <tr>
                        <td class="style7" colspan="2">
                            Thank you for Placing Order! Please review Your to finish Order</td>
                    </tr>
                    <tr>
                        <td class="style7">
                            OrderID:</td>
                        <td class="style7">
                            <asp:Label ID="lbOrderID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Plans:
                        </td>
                        <td>
                            <asp:Label ID="lbPlan" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Security Deposit:
                        </td>
                        <td>
                            <asp:Label ID="lbDeposit2" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Connection Type:</td>
                        <td>
                            <asp:Label ID="lbConType" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Package:</td>
                        <td>
                            <asp:Label ID="lbPackage" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Equipment:
                        </td>
                        <td>
                            <asp:Label ID="lbEquipment" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnPlaceOrder" runat="server" onclick="btnPlaceOrder_Click" 
                                Text="PLACE ORDER" />
                            <asp:Button ID="btnBack" runat="server" CausesValidation="False" 
                                onclick="btnBack_Click" Text="BACK" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </asp:Panel>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

