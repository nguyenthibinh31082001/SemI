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
	<li>
		<a href="MainPage.aspx"><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
	</li>
	<li><a href="ViewOrders.aspx"><span class="l"></span><span class="r"></span>
        <span class="t">View Order</span></a> </li>
    <li><a href="ViewBill.aspx"><span class="l"></span><span class="r"></span>
        <span class="t">View Bill</span></a> </li>
        <li><a href="PayBill.aspx"><span class="l"></span><span class="r"></span>
        <span class="t">Pay Bill</span></a> </li>
    <li><a href="KeepTrackConnection.aspx"><span class="l"></span><span class="r">
        </span><span class="t">Keep track Connection</span></a> </li>
    <li><a href="Feedback.aspx"><span class="l"></span><span class="r"></span>
        <span class="t">Feedback</span></a> </li>
    <li><a href="ChangeProfile.aspx"><span class="l"></span><span class="r"></span>
        <span class="t">Change Profile</span></a> </li>
	
</ul>

<!-- /block-content -->

		<div class="cleared"></div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
