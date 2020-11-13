<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultSidebarACC.ascx.cs" Inherits="Sidebar1" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultVerticalMenu" Src="DefaultVerticalMenu.ascx" %>

<%@ Register src="DefaultVerticalMenuACC.ascx" tagname="DefaultVerticalMenuACC" tagprefix="uc1" %>
<uc1:DefaultVerticalMenuACC ID="DefaultVerticalMenuACC1" runat="server" />
                  <artisteer:Block ID="ContactInformationBlock" Caption="Contact Info" runat="server"><ContentTemplate><div><asp:ImageMap 
        ID="ImageMap1" runat="server" Height="162px" ImageUrl="~/images/contact.png" 
        Width="177px">
    </asp:ImageMap>
    <br /><b>Group 1 FAT1 - FPT-APTECH</b><br />7 Nam Quoc Cang,<br />Ward Pham Ngu Lao,<br />District 1, HCM city, Viet Nam<br />Email: <a 
        href="mailto:aptech1004@gmail.com">aptech1004@gmail.com</a><br /><br />Phone: (84) 983.932273<br />
                      Fax:&nbsp;&nbsp;&nbsp;&nbsp; (84) 938.200489<br />
                      <br />
                      </div></ContentTemplate></artisteer:Block>
