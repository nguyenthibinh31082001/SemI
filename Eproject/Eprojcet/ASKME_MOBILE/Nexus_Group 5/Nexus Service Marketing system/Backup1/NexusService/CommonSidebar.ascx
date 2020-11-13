<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CommonSidebar.ascx.cs" Inherits="Tonghop" %>
<%@ Register src="DefaultSidebar1.ascx" tagname="DefaultSidebar1" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc3" %>
<%@ Register src="DefaultSidebarACC.ascx" tagname="DefaultSidebarACC" tagprefix="uc5" %>
<%@ Register src="DefaultSidebarTE.ascx" tagname="DefaultSidebarTE" tagprefix="uc6" %>
<%@ Register src="DefaultSidebarBroker.ascx" tagname="DefaultSidebarBroker" tagprefix="uc7" %>
<%@ Register src="DefaultSidebarCU.ascx" tagname="DefaultSidebarCU" tagprefix="uc8" %>
<uc5:DefaultSidebarACC ID="DefaultSidebarACC1" runat="server" Visible="False" />
<uc3:DefaultSidebarAdmin ID="DefaultSidebarAdmin1" runat="server" />
<uc7:DefaultSidebarBroker ID="DefaultSidebarBroker1" runat="server" 
    Visible="False" />
<uc8:DefaultSidebarCU ID="DefaultSidebarCU1" runat="server" Visible="False" />
<uc6:DefaultSidebarTE ID="DefaultSidebarTE1" runat="server" Visible="False" />

<uc1:DefaultSidebar1 ID="DefaultSidebar11" runat="server" />


