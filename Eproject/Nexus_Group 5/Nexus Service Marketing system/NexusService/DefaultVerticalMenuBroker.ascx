<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultVerticalMenuBroker.ascx.cs" Inherits="VMenu" %>

<div class="art-vmenublock">
    <div class="art-vmenublock-body">
<div class="art-vmenublockheader">
    <div class="l"></div>
    <div class="r"></div>
     <div class="t"><b>
         <asp:Label ID="lblHello" runat="server"></asp:Label>
&nbsp;&nbsp;
         <asp:LinkButton ID="lbtnLogout" runat="server" onclick="lbtnLogout_Click" 
             CausesValidation="False">Login</asp:LinkButton>
                </b>
                </div>
</div>
<div class="art-vmenublockcontent">
    <div class="art-vmenublockcontent-body">
<!-- block-content -->

<!-- /block-content -->

		<div class="cleared">
<ul class="art-vmenu">
	<span class="t"><li>
		<a href="MainPage.aspx"><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
	</li>
	<li>
		<a href="PlaceOrder.aspx"><span class="l"></span><span class="r"></span><span class="t">Place Order</span></a>
				<!--ul>
			<li><a href="#">Top 10</a></li>
		</ul-->
	</li>
    <li>
		<a href="NewOrdersDaiup.aspx"><span class="l"></span><span class="r"></span><span class="t">
        View Order Daiup Connection</span></a>
	
	</li>
    <li>
		<a href="NewOrdersDaiup.aspx"><span class="l"></span><span class="r"></span><span class="t">
        View Order LandLine Connection</span></a>
	
	</li>
    <li>
		<a href="NewOrdersDaiup.aspx"><span class="l"></span><span class="r"></span><span class="t">
        View Order BroadBand Connection</span></a>
	
	</li>
	<li>
		<a href="ViewOrders.aspx"><span class="l"></span><span class="r"></span><span class="t">New Orde DaiUp Connection</span></a>r
	
	</li>
	<li>
		<a href="KeepTrackConnection.aspx"><span class="l"></span><span class="r"></span><span class="t">Keep track Connection</span></a>
	</li>
	<li>
		<a href="ChangeProfile.aspx"><span class="l"></span><span class="r"></span><span class="t">Change Profile</span></a>
	</li></li>
	
</ul>

        </div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>