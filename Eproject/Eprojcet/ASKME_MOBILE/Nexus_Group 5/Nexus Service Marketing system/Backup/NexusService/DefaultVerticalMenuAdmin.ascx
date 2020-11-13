<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultVerticalMenuAdmin.ascx.cs" Inherits="VMenu" %>

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
		<a href="MainPage.aspx"><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
	</li>
                        <li>
		<a href="KeepTrackConnection.aspx"><span class="l"></span><span class="r"></span><span class="t">Keep track Connetion</span></a>
                        </li>
	<li>
		<a href="EmployeeManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Employee Management</span></a>
		
	</li>
	<li>
		<a href="RetailShopManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Retails Management</span></a>

	</li>
	<li>
		<a href="VendorManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Vendor Management</span></a>
	</li>
	<li>
		<a href="EquipmentManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Equipment Management</span></a>
		
			</li>
	<li>
		<a href="TaxManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Tax Management</span></a>
		
	</li>
		<li>
		<a href="PlanManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Plan Management</span></a>
		
	</li>
	<li>
		<a href="FeedbackManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Feedback Management</span></a>
		
	</li>
    <li>
		<a href="OtherManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Other Management</span></a></li>
	<li>
		<a href="ViewBill.aspx"><span class="l"></span><span class="r"></span><span class="t">View Bill</span></a>
		
	</li>
	<li>
		<a href="ViewOrders.aspx"><span class="l"></span><span class="r"></span><span class="t">View Order</span></a>
		
	</li>
	<li>
		<a href="ViewCustomer.aspx"><span class="l"></span><span class="r"></span><span class="t">View Customer</span></a>
        		
	</li>
    <li><a href="ChangeProfile.aspx"><span class="l"></span><span class="r"></span>
        <span class="t">Change Profile</span></a> </li>
	
	
</ul>

        <p>
            &nbsp;</p>

<!-- /block-content -->

		<div class="cleared"></div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
