<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="ViewBill.aspx.cs" Inherits="ViewBill" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 80%;
        }
        .style2
        {
            height: 23px;
        }
        .style3
        {
            font-size: x-large;
            font-weight: bold;
            color: #0000FF;
        }
        .style4
        {
            font-size: x-large;
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
    <asp:Panel ID="pnlViewBill1" runat="server">
        <table class="style1">
            <tr>
                <td style="text-align: center" class="style3">
                    VIEW BILLS</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    Search Bills by Customer ID:
                    <asp:TextBox ID="txtSearhBills" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="SEARCH" 
                        onclick="btnSearch_Click" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <b>Month: </b>
                    <asp:DropDownList ID="ddlMonth" runat="server">
                    </asp:DropDownList>
                    &nbsp; <b>Year</b>:&nbsp;
                    <asp:DropDownList ID="ddlYear" runat="server">
                    </asp:DropDownList>
                    <asp:Button ID="btnSearchDate" runat="server" onclick="btnSearchDate_Click" 
                        Text="SEARCH" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView align="center" ID="grvViewBills" runat="server" 
            AllowPaging="True" AllowSorting="True" DataKeyNames="MonthBill" 
                        onselectedindexchanged="grvViewBills_SelectedIndexChanged" 
                        style="text-align: left" 
                        onpageindexchanging="grvViewBills_PageIndexChanging" 
                        onsorting="grvViewBills_Sorting" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="490px" 
                        onselectedindexchanging="grvViewBills_SelectedIndexChanging">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:CommandField SelectText="Details" 
                    ShowSelectButton="True" ButtonType="Button" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:DetailsView align="center" ID="DetailsView1" runat="server" Height="50px" 
                        Width="423px" style="text-align: left" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:Label ID="lblBillStatus" runat="server" Text="Bill paid"></asp:Label>
                    <asp:CheckBox ID="chkBillStatus" runat="server" />
                    <br />
                    <asp:LinkButton ID="lbtnUpdateBill" runat="server" 
                        onclick="lbtnUpdateBill_Click" style="font-size: large">Edit Bill</asp:LinkButton>
                    <br />
                    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="BACK" />
                    <asp:Button ID="btnOK" runat="server" onclick="btnOK_Click" Text="OK" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlViewBill2" runat="server" Visible="False">
        <table class="style1" align="center">
            <tr>
                <td align="center" class="style2">
                    <b><span class="style4">VIEW BILLS</span></b><br />
                    <asp:GridView align = "center" ID="grvCusView" runat="server" 
                        DataKeyNames="MonthBill" 
                        onselectedindexchanged="grvCusView_SelectedIndexChanged" 
                        onselectedindexchanging="grvCusView_SelectedIndexChanging" 
                        onsorted="grvCusView_Sorted" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="453px">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:CommandField SelectText="Details" ShowSelectButton="True" 
                                ButtonType="Button" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:DetailsView align ="center" ID="DetailsView2" runat="server" Height="50px" 
                        Width="424px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:Button ID="Button1" runat="server" Text="OK" onclick="Button1_Click" 
                        Width="87px" />
                    &nbsp;
                    <asp:Button ID="btnPay" runat="server" onclick="btnPay_Click" Text="PAY BILL" />
                    <br />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p>
        <br />
    
    </p>
    <p>
    </p>
</asp:Content>

