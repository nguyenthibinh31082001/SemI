<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultMenu.ascx" tagname="DefaultMenu" tagprefix="uc2" %>
<%@ Register src="CommonSidebar.ascx" tagname="CommonSidebar" tagprefix="uc3" %>

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
        .style2
        {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc3:CommonSidebar ID="CommonSidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p style="text-align: center; height: 20px;" class="style1">
        Welcome to NEXUS MAKETING SYSTEM
    </p>
    <p style="text-align: center; height: 20px;">
        <br />
        &nbsp;</p>
    <asp:Panel ID="Panel1" runat="server" Direction="LeftToRight" 
        GroupingText="INTRODUCE" Height="953px" style="text-align: left" 
        Width="650px">
        <br />
        <b>Nexus Communication System is an Organization system that provides two 
        services like the tele-communications and Internet Services. </b>
        <br />
        <br />
        You can find our Retail Shop at your area and Place Orders for interested 
        services. Our services include:
        <br />
        <br />
        <table border="1" style="width:100%;">
            <tr>
                <td align="center" class="style17" colspan="4">
                    DIAL - UP Connection Plan</td>
            </tr>
            <tr>
                <td align="center" class="style15">
                    &nbsp;Plan Type</td>
                <td align="center" class="style13">
                    Duration</td>
                <td align="center" class="style13">
                    Price</td>
                <td align="center" class="style13">
                    Validity</td>
            </tr>
            <tr>
                <td align="center" class="style8" rowspan="3">
                    HOURLY BASIS</td>
                <td align="center" class="style9">
                    10 Hrs</td>
                <td align="center" class="style10">
                    50$</td>
                <td align="center" class="style10">
                    1 Month</td>
            </tr>
            <tr>
                <td align="center" class="style9">
                    30 Hrs</td>
                <td align="center" class="style10">
                    130$</td>
                <td align="center" class="style10">
                    3 Months</td>
            </tr>
            <tr>
                <td align="center" class="style9">
                    60 Hrs</td>
                <td align="center" class="style10">
                    260$</td>
                <td align="center" class="style10">
                    6 Months</td>
            </tr>
            <tr>
                <td align="center" class="style8" rowspan="2">
                    UNLIMITED 28 Kbps</td>
                <td align="center" class="style9">
                    Monthly</td>
                <td align="center" class="style10">
                    75$</td>
                <td align="center" class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style9">
                    Quarterly</td>
                <td align="center" class="style10">
                    150$</td>
                <td align="center" class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style8" rowspan="2">
                    UNLIMITED 56 Kbps</td>
                <td align="center" class="style9">
                    Monthly</td>
                <td align="center" class="style10">
                    100$</td>
                <td align="center" class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style9">
                    Quarterly</td>
                <td align="center" class="style10">
                    180$</td>
                <td align="center" class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style8">
                    Security Deposit</td>
                <td align="center" class="style9" colspan="3">
                    325$</td>
            </tr>
        </table>
        <br />
        <table border="1" style="width:100%;">
            <tr>
                <td align="center" class="style17" colspan="4">
                    BROADBAND Connection Plan</td>
            </tr>
            <tr>
                <td align="center" class="style15">
                    Plan Type</td>
                <td align="center" class="style13">
                    Duration</td>
                <td align="center" class="style13">
                    Price</td>
                <td align="center" class="style13">
                    Validity</td>
            </tr>
            <tr>
                <td align="center" class="style8" rowspan="2">
                    HOURLY BASIS</td>
                <td align="center" class="style9">
                    30 Hrs</td>
                <td align="center" class="style10">
                    175$</td>
                <td align="center" class="style10">
                    1 Month</td>
            </tr>
            <tr>
                <td align="center" class="style9">
                    60 Hrs</td>
                <td align="center" class="style10">
                    315$</td>
                <td align="center" class="style10">
                    6 Months</td>
            </tr>
            <tr>
                <td align="center" class="style8" rowspan="2">
                    UNLIMITED 64 Kbps</td>
                <td align="center" class="style9">
                    Monthly</td>
                <td align="center" class="style10">
                    225$</td>
                <td align="center" class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style9">
                    Quarterly</td>
                <td align="center" class="style10">
                    400$</td>
                <td align="center" class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style8" rowspan="2">
                    UNLIMITED 128 Kbps</td>
                <td align="center" class="style9">
                    Monthly</td>
                <td align="center" class="style10">
                    350$</td>
                <td align="center" class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style9">
                    Quarterly</td>
                <td align="center" class="style10">
                    445$</td>
                <td align="center" class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style8">
                    Security Deposit</td>
                <td align="center" class="style9" colspan="3">
                    500$</td>
            </tr>
        </table>
        <br />
        <table border="1" style="width:100%;">
            <tr>
                <td align="center" class="style17" colspan="5">
                    LANDLINE Connection Plan</td>
            </tr>
            <tr>
                <td align="center" class="style15">
                    Plan Type</td>
                <td align="center" class="style13">
                    Type</td>
                <td align="center" class="style13">
                    Price</td>
                <td align="center" class="style14">
                    Charges</td>
                <td align="center" class="style13">
                    Validity</td>
            </tr>
            <tr>
                <td align="center" class="style8" rowspan="2">
                    LOCAL PLAN</td>
                <td align="center" class="style9">
                    Unlimited</td>
                <td align="center" class="style10">
                    75$</td>
                <td align="center" class="style12">
                    55 cents/minute</td>
                <td align="center" class="style10">
                    1 Year</td>
            </tr>
            <tr>
                <td align="center" class="style9">
                    Monthly Plan</td>
                <td align="center" class="style10">
                    35$</td>
                <td align="center" class="style12">
                    75 cents/minute</td>
                <td align="center" class="style10">
                    1 Month</td>
            </tr>
            <tr>
                <td align="center" class="style8" rowspan="10">
                    STD PLAN(*)</td>
                <td align="center" class="style9" rowspan="4">
                    Monthly</td>
                <td align="center" class="style13">
                    Price</td>
                <td align="center" class="style14">
                    Charges</td>
                <td align="center" class="style13">
                    Services Type</td>
            </tr>
            <tr>
                <td align="center" class="style10" rowspan="3">
                    125$</td>
                <td align="center" class="style12">
                    Local</td>
                <td align="center" class="style10">
                    70 cents/minute</td>
            </tr>
            <tr>
                <td align="center" class="style12">
                    STD</td>
                <td align="center" class="style10">
                    2.25$/minute</td>
            </tr>
            <tr>
                <td align="center" class="style12">
                    Message For Mobiles</td>
                <td align="center" class="style10">
                    1.00$/minute</td>
            </tr>
            <tr>
                <td align="center" class="style9" rowspan="3">
                    Half Yearly</td>
                <td align="center" class="style10" rowspan="3">
                    420$</td>
                <td align="center" class="style12">
                    Local</td>
                <td align="center" class="style10">
                    60 cents/minute</td>
            </tr>
            <tr>
                <td align="center" class="style12">
                    STD</td>
                <td align="center" class="style10">
                    2.00$/minute</td>
            </tr>
            <tr>
                <td align="center" class="style12">
                    Message For Mobiles</td>
                <td align="center" class="style10">
                    1.15$/minute</td>
            </tr>
            <tr>
                <td align="center" class="style9" rowspan="3">
                    Yearly</td>
                <td align="center" class="style10" rowspan="3">
                    840$</td>
                <td align="center" class="style12">
                    Local</td>
                <td align="center" class="style10">
                    60 cents/minute</td>
            </tr>
            <tr>
                <td align="center" class="style12">
                    STD</td>
                <td align="center" class="style10">
                    1.75$/minute</td>
            </tr>
            <tr>
                <td align="center" class="style12">
                    Message For Mobiles</td>
                <td align="center" class="style10">
                    1.25$/minute</td>
            </tr>
            <tr>
                <td align="center" class="style8">
                    Security Deposit</td>
                <td align="center" class="style9" colspan="4">
                    250$</td>
            </tr>
            <tr>
                <td align="center" class="style8" colspan="5">
                    (*) Valid for a month and this is the rental</td>
            </tr>
        </table>
        <b>
        <br class="style2" />
        <span class="style2">Please contact to Retail Shop to get place order and get 
        connection !</span></b>
    </asp:Panel>
</asp:Content>

