﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultSidebarBroker.ascx.cs" Inherits="Sidebar1" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultVerticalMenu" Src="DefaultVerticalMenu.ascx" %>

<%@ Register src="DefaultVerticalMenuBroker.ascx" tagname="DefaultVerticalMenuBroker" tagprefix="uc1" %>
<uc1:DefaultVerticalMenuBroker ID="DefaultVerticalMenuBroker1" runat="server" />
                  <artisteer:Block ID="ContactInformationBlock" Caption="Contact Info" runat="server"><ContentTemplate><div><asp:ImageMap 
        ID="ImageMap1" runat="server" Height="162px" ImageUrl="~/images/contact.png" 
        Width="177px">
    </asp:ImageMap>
    <br /><b>Group 5-c1207i<br /> Bách Khoa-APTECH</b><br />250 Hoàng Quốc Viêt<br /> Cầu Giấy - Hà 
                      Nội<br />Email: <a 
        href="mailto:aptech1004@gmail.com">ancv2014@gmail.com</a><br /> MR: Chu Văn An<br /> Phone: 
                      01687347859<br />
                      <br />
                      </div></ContentTemplate></artisteer:Block>