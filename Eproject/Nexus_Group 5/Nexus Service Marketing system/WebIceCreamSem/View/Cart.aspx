<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="View_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>

    <asp:GridView ID="grCart" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" onrowcancelingedit="grCart_RowCancelingEdit" 
        onrowdeleting="grCart_RowDeleting" onrowediting="grCart_RowEditing" 
        onrowupdating="grCart_RowUpdating">
        <Columns>
            <asp:BoundField DataField="BId" HeaderText="Id" ReadOnly="True" />
            <asp:BoundField DataField="BName" HeaderText="Book Name" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" />
            <asp:CommandField />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
</div>
 <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>

</asp:Content>

