<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultVerticalMenu.ascx.cs" Inherits="VMenu" %>

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
<ul class="art-vmenu">
	<li>
		<a href="MainPage.aspx"><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
	</li>
	<%--<li>
		<a href="#"><span class="l"></span><span class="r"></span><span class="t">Place Order</span></a>
				<!--ul>
			<li><a href="#">Top 10</a></li>
		</ul-->
	</li>--%>
		
	
</ul>

    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
