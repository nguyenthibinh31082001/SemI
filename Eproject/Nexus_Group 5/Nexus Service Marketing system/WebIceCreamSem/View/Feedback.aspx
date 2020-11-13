<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="View_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                       <div class="title"><h3> Write comment here </h3></div>
                       <br />
                                <table style="width:100%;" frame="void">
                                    <tr>
                                        <td class="style4" colspan="2">   
                                          
                                            Please enter the full information on the form below
                                            <br />
                                           <span style="color:Red"> <asp:Label ID="lbfeedback" runat="server"></asp:Label></span>
                                            <br />
                                          
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            Name(*)<br />
                                            <br />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtname" runat="server" Width="470px" Height="30px"></asp:TextBox>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            Address(*)<br />
                                            <br />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtaddress" runat="server" Width="470px" Height="30px"></asp:TextBox>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            Phone(*)<br />
                                            <br />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtphone" runat="server" Width="470px" Height="30px"></asp:TextBox>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            Email(*)<br />
                                            <br />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtemail" runat="server" Width="470px" Height="30px"></asp:TextBox>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            Title(*)<br />
                                            <br />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txttitle" runat="server" Width="470px" Height="30px"></asp:TextBox>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            Contents(*)<br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtcontent" runat="server" Width="470px" Height="150px" 
                                                TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            &nbsp;</td>
                                        <td>
                                       
                                            <asp:Button ID="btnsubmit" runat="server" Text="Submit" Height="40px" 
                                                Width="70px" onclick="btnsubmit_Click" />
                                            <asp:Button ID="btnreset" runat="server" Text="Reset" Height="40px" 
                                                Width="70px" onclick="btnreset_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </p>


        <!-- end form feedback-->
    <div class="title"> <h3> Comment</h3></div>
       <div class="wrapfeedback">
    <asp:DataList ID="dtlistFeedback" runat="server">
     <ItemTemplate>
      
        <div class="nguyenlieu"><span class="titlefeedback">  <%#  "From: "+Eval("Sender") %> </span> 
     
     <br />
        <br />
       <%# " * " + Eval("Content")%><br /><br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
             
              <%# "Date: " + Eval("Date")%><br />
        </div>
         <hr  style="width:400px ; margin-left:15px;"/>
         
         </ItemTemplate>
    </asp:DataList>
   </div>
</asp:Content>

