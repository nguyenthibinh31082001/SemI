<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultVerticalMenuCU.ascx.cs" Inherits="VMenu" %>

<div class="art-vmenublock">
    <div class="art-vmenublock-body">
<div class="art-vmenublockheader">
    <div class="l"></div>
    <div class="r"></div>
     <div class="t">&nbsp;<b><asp:Label ID="lblHello" runat="server"></asp:Label>
&nbsp;&nbsp;
         <asp:LinkButton ID="lbtnLogout" runat="server" onclick="lbtnLogout_Click" 
             CausesValidation="False">Login</asp:LinkButton>
                </b>
                </div>
</div>
<div class="art-vmenublockcontent">
    <div class="art-vmenublockcontent-body">
<!-- block-content -->
<ul class="art-vmenu">
	<span class="t"><li>
		<a href="MainPage.aspx"><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
	</li>
    <li>
		<a href="VewOrdersDaiup.aspx"><span class="l"></span><span class="r"></span><span class="t">
        View Order Daiup Connection</span></a>
	
	</li>
    <li>
		<a href="VewOrdersLandLine.aspx"><span class="l"></span><span class="r"></span><span class="t">
        View Order LandLine Connection</span></a>
	
	</li>
    <li>
		<a href="VewOrdesBroadBand.aspx"><span class="l"></span><span class="r"></span><span class="t">
        View Order BroadBand Connection</span></a>
	
	</li>
    <li>
		<a href="VewFeedBack.aspx"><span class="l"></span><span class="r"></span><span class="t">FeedBack</span></a>
	
	</li>
	
</ul>

<!-- /block-content -->

		<div class="cleared"></div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
