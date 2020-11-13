<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeProfile.aspx.cs" Inherits="ChangeProfile" Title="Untitled Page" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 97%;
        }
        .style6
        {
            text-align: left;
        }
        .style9
        {
            font-size: medium;
            height: 25px;
            text-align: left;
            width: 312px;
        }
        .style10
        {
            font-size: medium;
            text-align: left;
            width: 312px;
        }
        .style12
        {
            font-size: medium;
            text-align: left;
            height: 11px;
            width: 312px;
        }
        .style14
        {
            width: 162px;
        }
        .style15
        {
            font-size: 12pt;
            width: 164px;
        }
        .style17
        {
            text-align: center;
        }
        .style20
        {
            width: 342px;
            text-align: left;
            height: 25px;
            font-size: 12pt;
        }
        .style23
        {
            font-size: 14pt;
            text-align: center;
            color: #FFFFFF;
        }
        .style24
        {
            width: 43%;
        }
        .style25
        {
            width: 19%;
        }
        .style28
        {
            font-size: 12pt;
            text-align: left;
            width: 342px;
        }
        .style29
        {
            width: 342px;
            text-align: left;
            height: 11px;
            font-size: 12pt;
        }
        .style42
        {
            color: #FFFFFF;
            font-size: large;
        }
        .style43
        {
            font-size: 12pt;
            font-weight: bold;
            width: 29px;
        }
        .style44
        {
            height: 25px;
            font-size: 12pt;
            font-weight: bold;
            width: 29px;
        }
        .style52
        {
            width: 29px;
        }
        .style53
        {
            font-size: medium;
        }
        .style54
        {
            font-size: 14pt;
            color: #FFFFFF;
        }
        .style55
        {
            font-size: 12pt;
            width: 13px;
        }
        .style56
        {
            width: 13px;
        }
        .style57
        {
            text-align: center;
            width: 13px;
        }
        .style58
        {
            font-size: 12pt;
            text-align: left;
            width: 98px;
        }
        .style59
        {
            width: 98px;
            text-align: left;
            height: 25px;
            font-size: 12pt;
        }
        .style60
        {
            width: 98px;
            text-align: left;
            height: 11px;
            font-size: 12pt;
        }
        .style61
        {
            text-align: left;
            width: 98px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <p>
        &nbsp;</p>
    <uc3:CommonSidebar ID="CommonSidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p>
        <br />
    </p>
    <table cellpadding="0" border="0" align="center" bgcolor="#CEFFFF">
			<tr>
				<td align="center" colspan="3" bgcolor="Blue" class="style54">Change Your Password</td>
			</tr><tr>
				<td align="right" class="style55" style="text-align: left">&nbsp;</td>
				<td align="right" class="style15" style="text-align: left">Password</td>
                <td class="style14"><asp:TextBox runat="server" TextMode="Password" ID="txtOldPass" 
                        Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtOldPass" ErrorMessage="*" 
                        ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
</td>
			</tr><tr>
				<td align="right" class="style55" style="text-align: left">&nbsp;</td>
				<td align="right" class="style15" style="text-align: left">New Password</td>
                <td class="style14">
                    <asp:TextBox runat="server" TextMode="Password" 
                        ID="txtNewPassword" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtNewPassword" ErrorMessage="*" 
                        ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
</td>
			</tr><tr>
				<td align="right" class="style55" style="text-align: left">&nbsp;</td>
				<td align="right" class="style15" style="text-align: left">Confirm New Password</td>
                <td class="style14">
                    <asp:TextBox runat="server" TextMode="Password" 
                        ID="txtConfirmNewPassword" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtConfirmNewPassword" Display="Dynamic" ErrorMessage="*" 
                        ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
</td>
			</tr><tr>
				<td align="center" class="style56">
                    &nbsp;</td>
				<td align="center" colspan="2">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmNewPassword" 
                        ErrorMessage="The Confirm New Password must match the New Password entry." 
                        Display="Dynamic" ValidationGroup="ChangePass"></asp:CompareValidator>
            <asp:Label ID="lblLoginFail" runat="server" style="color: #FF0000" 
                Text="Change failed ! Please try again" Visible="False"></asp:Label>
</td>
			</tr><tr>
				<td align="right" class="style57">&nbsp;</td>
				<td align="right" class="style17" colspan="2">
                    <asp:Button runat="server" CommandName="ChangePassword" 
                        Text="Change" ValidationGroup="ChangePass" ID="btnChange" 
                        onclick="btnChange_Click" Width="90px"></asp:Button>
                    &nbsp;&nbsp; <asp:Button runat="server" CausesValidation="False" CommandName="Cancel" 
                        Text="Cancel" ID="btnCancelChange" Width="90px"></asp:Button>
</td>
			</tr>
		    <tr>
				<td align="right" class="style57">&nbsp;</td>
				<td align="right" class="style17" colspan="2">
            <asp:Label ID="lblLoginFail0" runat="server" style="color: #FF0000" 
                Text="Change Password successfully !" Visible="False"></asp:Label>
                </td>
			</tr>
		</table>
    <br />
    <br />
    <table align="center" class="style25">
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" GroupingText=" " Visible="False">
                    <table align="center" bgcolor="#CEFFFF" style="width: 450px; font-size: medium">
                        <tr>
                            <td align="center" bgcolor="Blue" class="style42" colspan="5">
                                PROFILE</td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Employee ID</td>
                            <td>
                                <asp:Label ID="lblEmpID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Employee Name</td>
                            <td>
                                <asp:Label ID="lblEmpName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Identification</td>
                            <td>
                                <asp:Label ID="lblEmpIden" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Birthday</td>
                            <td style="text-align: left">
                                <asp:Label ID="lblEmpBirthday" runat="server"></asp:Label>
                                <dxe:ASPxDateEdit ID="txtDate" runat="server" Visible="False" Width="190px">
                                </dxe:ASPxDateEdit>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtDate" Display="Dynamic" 
                                    ErrorMessage="Please choose birthday" ValidationGroup="profile"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                    ControlToValidate="txtDate" Display="Dynamic" 
                                    ErrorMessage="Must be greater 18 ages" 
                                    onservervalidate="CustomValidator1_ServerValidate1" ValidationGroup="profile"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style44">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Sex</td>
                            <td style="text-align: left">
                                <asp:Label ID="lblEmpSex" runat="server"></asp:Label>
                                <asp:DropDownList ID="ddlSex" runat="server" Visible="False" Width="191px">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Address</td>
                            <td style="text-align: left">
                                <asp:Label ID="lblEmpAddress" runat="server"></asp:Label>
                                <asp:TextBox ID="txtAdd" runat="server" Height="74px" TextMode="MultiLine" 
                                    Visible="False" Width="190px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtAdd" ErrorMessage="Address is required" 
                                    ValidationGroup="profile"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                City</td>
                            <td>
                                <asp:Label ID="lblEmpCity" runat="server"></asp:Label>
                                <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                                    DataTextField="CityName" DataValueField="CityID" onload="ddlCity_Load" 
                                    Visible="False" Width="191px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                District</td>
                            <td>
                                <asp:Label ID="lblEmpDistrict" runat="server"></asp:Label>
                                <asp:DropDownList ID="ddlDistrict" runat="server" DataTextField="DistrictName" 
                                    DataValueField="DistrictID" Visible="False" Width="191px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Email</td>
                            <td>
                                <asp:Label ID="lblEmpEmail" runat="server"></asp:Label>
                                <asp:TextBox ID="txtMail" runat="server" Visible="False" Width="190px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Phone</td>
                            <td>
                                <asp:Label ID="lblEmpPhone" runat="server"></asp:Label>
                                <asp:TextBox ID="txtPhone" runat="server" Visible="False" Width="190px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <font size="3"><span class="style53">
                                <asp:Label ID="lblRole" runat="server" style="font-size: 12pt" Text="Role" 
                                    Visible="False"></asp:Label>
                                </span><b><span class="style53">
                                <asp:Label ID="lblOrderID" runat="server" Font-Bold="False" 
                                    style="font-size: 12pt" Text="OrderID" Visible="False"></asp:Label>
                                </span></b></font>
                            </td>
                            <td>
                                <asp:Label ID="lblEmpRole" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblDetailOrderID" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style43">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <font size="3"><span class="style53">
                                <asp:Label ID="lblDateJoin" runat="server" style="font-size: 12pt" 
                                    Text="Date Join" Visible="False"></asp:Label>
                                </span><b><span class="style53">
                                <asp:Label ID="lblQuantity" runat="server" Font-Bold="False" 
                                    style="font-size: 12pt" Text="Quantity" Visible="False"></asp:Label>
                                </span></b></font>
                            </td>
                            <td>
                                <asp:Label ID="lblEmpDateJoin" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblDetailQuantity" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style52">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td colspan="2">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnEdit" runat="server" CausesValidation="False" 
                                    onclick="btnEdit_Click" Text="Edit" Width="84px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                                    Text="Update" ValidationGroup="profile" Visible="False" Width="81px" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                    onclick="btnCancel_Click" Text="Cancel" Visible="False" Width="75px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style52">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
    <table align="center" class="style24">
        <tr>
            <td>
    <asp:Panel ID="Panel2" runat="server" style="text-align: center" Width="439px" 
        Visible="False" GroupingText="  ">
        <table align="center" cellpadding="2" class="style1" bgcolor="#CEFFFF">
            <tr>
                <td class="style23" colspan="3" bgcolor="Blue">
                    PROFILE</td>
            </tr>
            <tr>
                <td class="style58">
                    &nbsp;</td>
                <td class="style28">
                    Retail Shop ID</td>
                <td class="style10">
                    <asp:Label ID="lblReID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style59">
                    &nbsp;</td>
                <td class="style20">
                    Employee Name</td>
                <td class="style9">
                    <asp:Label ID="lblReName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style58">
                    &nbsp;</td>
                <td class="style28">
                    Address</td>
                <td class="style10">
                    <asp:Label ID="lblReAddress" runat="server"></asp:Label>
                    <asp:TextBox ID="txtReAdd" runat="server" Visible="False" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style58">
                    &nbsp;</td>
                <td class="style28">
                    City</td>
                <td class="style10">
                    <asp:Label ID="lblReCity" runat="server"></asp:Label>
                    <asp:DropDownList ID="ddlReCity" runat="server" DataTextField="CityName" 
                        DataValueField="CityID" Visible="False" AutoPostBack="True" 
                        onload="ddlReCity_Load" Width="191px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style58">
                    &nbsp;</td>
                <td class="style28">
                    District</td>
                <td class="style10">
                    <asp:Label ID="lblReDistrict" runat="server"></asp:Label>
                    <asp:DropDownList ID="ddlReDistrict" runat="server" 
                        DataTextField="DistrictName" DataValueField="DistrictID" Visible="False" 
                        Width="191px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style58">
                    &nbsp;</td>
                <td class="style28">
                    Email</td>
                <td class="style10">
                    <asp:Label ID="lblReEmail" runat="server"></asp:Label>
                    <asp:TextBox ID="txtReMail" runat="server" Visible="False" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style60">
                    &nbsp;</td>
                <td class="style29">
                    Phone</td>
                <td class="style12">
                    <asp:Label ID="lblRePhone" runat="server"></asp:Label>
                    <asp:TextBox ID="txtRePhone" runat="server" Visible="False" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style61">
                    &nbsp;</td>
                <td class="style6" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnReEdit" runat="server" 
                        onclick="btnReEdit_Click" Text="Edit" Width="84px" />
                    &nbsp;<asp:Button ID="btnReUpdate" runat="server" onclick="btnReUpdate_Click" 
                        Text="Update" Visible="False" Width="81px" />
                    &nbsp;
                    <asp:Button ID="btnReCancel" runat="server" onclick="btnReCancel_Click" 
                        Text="Cancel" Visible="False" Width="75px" />
                </td>
            </tr>
            <tr>
                <td class="style61">
                    &nbsp;</td>
                <td class="style6" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
    <br />
    </asp:Content>

