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
		<a href="MainPage.aspx"><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
	</li>
	<li>
		<a href="BillManagement.aspx"><span class="l"></span><span class="r"></span><span class="t">Bill Management</span></a>
				<!--ul>
			<li><a href="#">Top 10</a></li>
		</ul-->
	</li>
		<li>
		<a href="ViewBill.aspx"><span class="l"></span><span class="r"></span><span class="t">View Bill</span></a>
				<!--ul>
			<li><a href="#">Top 10</a></li>
		</ul-->
	</li>
	<li>
		<a href="ChangeProfile.aspx"><span class="l"></span><span class="r"></span><span class="t">Change Profile</span></a>
		<!--ul class="active">
			<li><a href="#">Photos</a>
				<ul>
					<li><a href="#">2008</a></li>
					<li><a href="#">2007</a></li>
					<li><a href="#">2006</a></li>
				</ul>
			</li>
			<li><a href="#">Gadgets</a></li>
			<li><a href="#" class="active">News</a></li>
			<li><a href="#">Posts</a></li>
		</ul-->
	</li>
	
	
</ul>

<!-- /block-content -->

		<div class="cleared"></div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
