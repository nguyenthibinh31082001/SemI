<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultVerticalMenuACC.ascx.cs" Inherits="VMenu" %>

<div class="art-vmenublock">
    <div class="art-vmenublock-body">
<div class="art-vmenublockheader">
    <div class="l"></div>
    <div class="r"></div>
     <div class="t">&nbsp;<b>
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
<ul class="art-vmenu">
	<li>
		<a href="MainPage.aspx"><span class="l"></span><span class="r"></span><span class="t"></span><span class="r"></span><span class="t">Home</span></a>
	</li>

	<li>
		<a href="AddNewOrdersEquypment.aspx"><span class="l"></span><span class="r"></span><span class="t">
        New Order  Equipment</span></a>
				<!--ul>
			<li><a href="#">Top 10</a></li>
		</ul-->
	</li>
    <li>
		<a href="AddNewOrdersDaiup.aspx"><span class="l"></span><span class="r"></span><span class="t">
        New Order Daiup Connection</span></a>
	
	</li>
    <li>
		<a href="AddNewOrdersLandLine.aspx"><span class="l"></span><span class="r"></span><span class="t">
        New Order LandLine Connection</span></a>
	
	</li>
    <li>
		<a href="AddNewOrdesBroadBand.aspx"><span class="l"></span><span class="r"></span><span class="t">
        New Order BroadBand Connection</span></a>
	
	</li>
	<li>
		<a href="ChangeProfile.aspx"><span class="l"></span><span class="r"></span><span class="t">Change Profile</span></a>
	</li>
	
</ul>

<!-- /block-content -->

		<div class="cleared"></div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
