<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="FeedbackManagement.aspx.cs" Inherits="FeedbackManagement" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 69%;
        }
        .style2
        {
            width: 61%;
        }
        .style3
        {
            height: 40px;
        }
        .style4
        {
            height: 40px;
            font-weight: bold;
            width: 85px;
        }
        .style5
        {
            width: 85px;
        }
        .style6
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
    <p>
        &nbsp;</p>
    <uc2:DefaultSidebarAdmin ID="DefaultSidebarAdmin1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p style="text-align: center">
        <span class="style6">FEEDBACK MANAGEMENT</span><br />
    </p>
    <table align="center" class="style1">
        <tr>
            <td align="center">
                View Feedback status:
                <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" 
                    Height="22px" onload="ddlStatus_Load" Width="102px">
                    <asp:ListItem Value=" All">View All</asp:ListItem>
                    <asp:ListItem Value="True">Active</asp:ListItem>
                    <asp:ListItem Value="False">Not Active</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvFeedback" runat="server" CellPadding="4" 
                    DataKeyNames="FeedbackID" ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="gvFeedback_SelectedIndexChanged" Width="418px" 
                    AllowPaging="True" AllowSorting="True" 
                    onpageindexchanging="gvFeedback_PageIndexChanging" 
                    onsorting="gvFeedback_Sorting">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:CommandField SelectText="Detail" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <br />
    <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" Height="50px" style="text-align: center" 
        Width="265px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEditAns" runat="server" CausesValidation="false" 
                        CommandName="" onclick="lbtnEditAns_Click" style="font-size: 14pt" 
                        Text="Answer"></asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="lbtnDelete" runat="server" onclick="lbtnDelete_Click" 
                        style="font-size: 14pt">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
            </td>
        </tr>
    </table>
    <br />
    <p>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <br />
                <table align="center" class="style2">
                    <tr>
                        <td class="style5">
                            <b>Title</b></td>
                        <td>
                            <asp:TextBox ID="txtTitle" runat="server" Width="230px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtTitle" ErrorMessage="Title is required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <b>Content</b></td>
                        <td>
                            <asp:TextBox ID="txtContent" runat="server" Height="80px" TextMode="MultiLine" 
                                Width="230px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtContent" ErrorMessage="Content  is required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Answer</td>
                        <td class="style3">
                            <asp:TextBox ID="txtAnswer" runat="server" Height="80px" TextMode="MultiLine" 
                                Width="230px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtAnswer" ErrorMessage="Answer  is required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <b>Status</b></td>
                        <td>
                            <asp:CheckBox ID="chkStatus" runat="server" Checked="True" 
                                Text="  Display for Customers" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            <asp:LinkButton ID="lbtnAnswer" runat="server" onclick="lbtnAnswer_Click" 
                                style="font-weight: 700; font-size: large">Answer</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lbtnCancel" runat="server" onclick="lbtnCancel_Click" 
                                style="font-weight: 700; font-size: large">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
    <p>
    </p>
</asp:Content>

