<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultVerticalMenuCU.ascx" tagname="DefaultVerticalMenuCU" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 63%;
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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:DefaultVerticalMenuCU ID="DefaultVerticalMenuCU1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p class="style3" style="text-align: center">
        FEEDBACK </p>
    <table align="center" class="style2">
        <tr>
            <td align="center">
                <asp:GridView ID="gvFeedback" runat="server" AllowPaging="True" 
                    AllowSorting="True" CellPadding="4" DataKeyNames="FeedbackID" 
                    ForeColor="#333333" GridLines="None" 
                    onpageindexchanging="gvFeedback_PageIndexChanging" 
                    onselectedindexchanged="gvFeedback_SelectedIndexChanged" 
                    onsorting="gvFeedback_Sorting" Width="448px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField SelectText="View" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <br />
                <asp:Button ID="btnFB" runat="server" CausesValidation="False" 
                    onclick="btnFB_Click" Text="Send Feedback to Nexus " Width="169px" />
                <br />
                <asp:DetailsView ID="dtViewFB" runat="server" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Height="50px" Visible="False" 
                    Width="373px">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
            </td>
        </tr>
    </table>
    <br />
    <table align="center" class="style2">
        <tr>
            <td align="center">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <table align="center" class="style1">
                        <tr>
                            <td>
                                <b>Title</b></td>
                            <td>
                                <asp:TextBox ID="txtTitle" runat="server" Width="500px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" 
                ErrorMessage="Title is required."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Content</b></td>
                            <td>
                                <asp:TextBox ID="txtContent" runat="server" 
                Height="150px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContent" 
                ErrorMessage="Content is required."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td style="text-align: center">
                                &nbsp;<asp:Button ID="btnSend" runat="server" onclick="btnSend_Click" 
                Text="Send" Width="103px" />
                                &nbsp;
                                <asp:Button ID="btnCancel" runat="server" 
                CausesValidation="False" onclick="btnCancel_Click" Text="Cancel" 
                Width="109px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <p>
        <br />
    </p>
</asp:Content>

