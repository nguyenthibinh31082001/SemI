﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultSidebar1.ascx.cs" Inherits="Sidebar1" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultVerticalMenu" Src="DefaultVerticalMenu.ascx" %>

<art:DefaultVerticalMenu ID="DefaultVMenuContent" runat="server" /></br>
                  <artisteer:Block ID="ContactInformationBlock" Caption="Contact Info" runat="server"><ContentTemplate ><div valign="bottom" ><asp:ImageMap 
        ID="ImageMap1" runat="server" Height="162px" ImageUrl="~/images/contact.png" 
        Width="177px">
    </asp:ImageMap>
    <br /><b>Group 5-c1207i<br /> Bách Khoa-APTECH</b><br />250 Hoàng Quốc Viêt<br /> Cầu Giấy - Hà 
                      Nội<br />Email: <a 
        href="mailto:aptech1004@gmail.com">ancv2014@gmail.com</a><br /><br /> Phone: 01687347859</div></ContentTemplate></artisteer:Block>