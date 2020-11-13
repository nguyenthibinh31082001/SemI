<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="login" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebar1.ascx" tagname="DefaultSidebar1" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">

        .style1
        {
            font-size: large;
        }
        .style3
        {
            text-align: left;
        }
        .style4
        {
            text-align: center;
        }
        .style5
        {
            font-size: large;
            width: 42px;
        }
        .style6
        {
            text-align: left;
            height: 29px;
            font-size: 18pt;
        }
        .style7
        {
            height: 29px;
            width: 268435584px;
        }
        .style9
        {
            width: 268435584px;
        }
        .style12
        {
            font-size: large;
            width: 268435584px;
        }
        .style13
        {
            text-align: center;
            width: 268435584px;
        }
        .style14
        {
            width: 55%;
        }
        .style15
        {
            width: 15px;
        }
        .style16
        {
            font-size: xx-large;
        }
        .style17
        {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:DefaultSidebar1 ID="DefaultSidebar11" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <table align="center" class="style14">
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server" Font-Bold="True" GroupingText="LOGIN" 
                        HorizontalAlign="Center" Width="435px">
                        <table align="center" bgcolor="#E4EFFE" border="0" 
            cellpadding="0" style="width: 410px; height: 164px">
                            <tr>
                                <td align="center" bgcolor="#E4EFFE" class="style5" 
                    rowspan="6">
                                    <asp:Image ID="Image1" runat="server" Height="154px" 
                        ImageUrl="~/images/key.png" Width="114px" />
                                </td>
                                <td align="center" bgcolor="#E4EFFE" class="style1" 
                    colspan="2">
                                    &nbsp;</td>
                                <td align="center" bgcolor="#E4EFFE" class="style12">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-size: 14px">
                                    UserName&nbsp;
                                </td>
                                <td style="text-align: left" class="style15">
                                    <asp:TextBox ID="txtUserName" runat="server" Height="20px" 
                        style="margin-left: 0px" Width="200px"></asp:TextBox>
                                </td>
                                <td style="text-align: left" class="style9">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6" style="font-size: 14px">
                                    Password&nbsp;
                                </td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="txtPassword" runat="server" Height="20px" TextMode="Password" 
                        Width="200px"></asp:TextBox>
                                    <br />
                                    <span class="style17">(Password is case-sensitive)</span></td>
                                <td style="text-align: left" class="style7">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style3" style="font-size: 14px">
                                    &nbsp;
                                </td>
                                <td style="text-align: left" class="style15">
                                    &nbsp;</td>
                                
                            <tr>
                                <td colspan="2" class="style4">
                                    <asp:Label ID="lblLoginFail" runat="server" style="color: #FF0000" 
                Text="Login failed ! Please try again" Visible="False"></asp:Label>
                                </td>
                                <td class="style13">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2" style="text-align: center">
                                    <asp:Button ID="btnLogin" runat="server" CommandName="Login" Height="26px" 
                        onclick="btnLogin_Click" style="text-align: center" Text="Log In" 
                        Width="95px" />
                                </td>
                                <td align="right" style="text-align: center" 
                    class="style9">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2" style="text-align: center">
                                    &nbsp;</td>
                                <td align="right" style="text-align: center" 
                    class="style9">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </td>
            </tr>
        </table>
    </p>
    <p>
                    <asp:Panel ID="Panel2" runat="server" style="text-align: center" 
                        Visible="False" Width="656px">
                        <b><span class="style16">You Logged In !</span><br class="style16" />
                        <span class="style16">If you want to Logout, click
                        <asp:LinkButton ID="lbtnLogout" runat="server" onclick="lbtnLogout_Click">here</asp:LinkButton>
                        </span></b>
                    </asp:Panel>
        <br />
    </p>
</asp:Content>

