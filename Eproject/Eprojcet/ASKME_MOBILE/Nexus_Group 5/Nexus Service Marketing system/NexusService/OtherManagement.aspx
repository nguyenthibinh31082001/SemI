<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="OtherManagement.aspx.cs" Inherits="OtherManagement" Title="Untitled Page" %>

<%@ Register src="DefaultHeader.ascx" tagname="DefaultHeader" tagprefix="uc1" %>
<%@ Register src="DefaultSidebarAdmin.ascx" tagname="DefaultSidebarAdmin" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }

        .style13
        {
            width: 43%;
        }
        .style14
        {
            font-size: large;
            font-weight: bold;
            color: #FFFFFF;
        }
        .style15
        {
            width: 56%;
        }
        .style16
        {
            font-size: 16pt;
            color: white;
        }
        .style17
        {
            width: 139px;
            font-weight: bold;
        }
        .style18
        {
            width: 270px;
        }
        .style19
        {
            width: 199px;
            font-weight: bold;
        }
        .style20
        {
            width: 211px;
            font-weight: bold;
        }
        .style21
        {
            font-size: x-large;
            font-weight: bold;
            color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <uc1:DefaultHeader ID="DefaultHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar1ContentPlaceHolder" Runat="Server">
    <uc2:DefaultSidebarAdmin ID="DefaultSidebarAdmin1" runat="server" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <p style="text-align: center">
        <span class="style21">OTHER MANAGEMENT</span><br />
        <table align="center" class="style1">
            <tr>
                <td align="center">
                    <br />
                    <asp:Panel ID="Panel1" runat="server" GroupingText="City Management">
                        <p>
                            <asp:Button ID="btnAddNewCity" runat="server" CausesValidation="False" 
                                onclick="btnAddNewCity_Click" Text="Add New City" Width="178px" />
                        </p>
                        <p align="center">
                            <asp:GridView ID="gvCity" runat="server" AllowPaging="True" AllowSorting="True" 
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="CityID" 
                                onpageindexchanging="gvCity_PageIndexChanging" 
                                onselectedindexchanged="gvCity_SelectedIndexChanged" onsorting="gvCity_Sorting" 
                                Width="509px">
                                <RowStyle BackColor="White" ForeColor="#003399" />
                                <Columns>
                                    <asp:CommandField SelectText="Detail" ShowSelectButton="True" />
                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" 
                                    HorizontalAlign="Center" />
                                <EditRowStyle HorizontalAlign="Center" />
                            </asp:GridView>
                            <asp:MultiView ID="MultiView2" runat="server">
                                <asp:View ID="View2" runat="server">
                                    <table align="center" class="style13">
                                        <tr>
                                            <td class="style14" style="text-align: center; background-color: #0000FF">
                                                CITY DETAIL</td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="text-align: center">
                                                <asp:DetailsView ID="dtCity" runat="server" CellPadding="4" ForeColor="#333333" 
                                                    GridLines="None" Height="50px" style="text-align: center" Width="490px">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <Fields>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                &nbsp;&nbsp;<asp:LinkButton ID="lbtnEditCity" runat="server" onclick="lbtnEditCity_Click">Edit</asp:LinkButton>
                                                                &nbsp;&nbsp;
                                                                <asp:LinkButton ID="lbtnCityDelete" runat="server" 
                                                                    onclick="lbtnCityDelete_Click" 
                                                                    onclientclick="return confirm(&quot;Are you sure Delete?&quot;);">Delete</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Fields>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:DetailsView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View4" runat="server">
                                    <table align="center" class="style15">
                                        <tr>
                                            <td align="center" bgcolor="Blue" class="style16" colspan="2">
                                                <b>Add New City</b></td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                City ID</td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtAddCityID" runat="server" Width="200px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="txtAddCityID" ErrorMessage="ID is required."></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                City Name</td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtAddCityName" runat="server" Width="200px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="txtAddCityName" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="btnCityAdd" runat="server" onclick="btnCityAdd_Click" 
                                                    Text="Create" Width="114px" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnCityCancelAdd" runat="server" CausesValidation="False" 
                                                    onclick="btnCityCancelAdd_Click" Text="Cancel" Width="129px" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                            </asp:MultiView>
                            <asp:MultiView ID="MultiView3" runat="server">
                                <asp:View ID="View3" runat="server">
                                    <table align="center" class="style15">
                                        <tr>
                                            <td align="center" bgcolor="Blue" class="style16" colspan="2">
                                                <b>EDIT CITY</b></td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                City ID</td>
                                            <td>
                                                <asp:Label ID="lblCityID" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                City Name</td>
                                            <td>
                                                <asp:TextBox ID="txtEditCityName" runat="server" Width="200px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="txtEditCityName" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="btnCityUpdate" runat="server" onclick="btnCityUpdate_Click" 
                                                    Text="Update" Width="114px" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnEditCancel" runat="server" CausesValidation="False" 
                                                    onclick="btnEditCancel_Click" Text="Cancel" Width="129px" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <br />
                            </asp:MultiView>
                        </p>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="Panel2" runat="server" GroupingText="District Management">
                        <p>
                            <asp:Button ID="btnAddNewDistrict" runat="server" CausesValidation="False" 
                                onclick="btnAddNewDistrict_Click" Text="Add New District" Width="178px" />
                        </p>
                        <p align="center">
                            <asp:GridView ID="gvDistrict" runat="server" AllowPaging="True" AllowSorting="True" 
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="DistrictID" 
                                onpageindexchanging="gvDistrict_PageIndexChanging" 
                                onselectedindexchanged="gvDistrict_SelectedIndexChanged" onsorting="gvDistrict_Sorting" 
                                Width="509px">
                                <RowStyle BackColor="White" ForeColor="#003399" />
                                <Columns>
                                    <asp:CommandField SelectText="Detail" ShowSelectButton="True" />
                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" 
                                    HorizontalAlign="Center" />
                                <EditRowStyle HorizontalAlign="Center" />
                            </asp:GridView>
                            <asp:MultiView ID="MultiView4" runat="server">
                                <asp:View ID="View5" runat="server">
                                    <table align="center" class="style13">
                                        <tr>
                                            <td class="style14" style="text-align: center; background-color: #0000FF">
                                                DISTRICT DETAIL</td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="text-align: center">
                                                <asp:DetailsView ID="dtDistrict" runat="server" CellPadding="4" 
                                                    ForeColor="#333333" GridLines="None" Height="50px" style="text-align: center" 
                                                    Width="490px">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <Fields>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                &nbsp;&nbsp;<asp:LinkButton ID="lbtnEditDistrict" runat="server" 
                                                                    onclick="lbtnEditDistrict_Click">Edit</asp:LinkButton>
                                                                &nbsp;&nbsp;
                                                                <asp:LinkButton ID="lbtnDistrictDelete" runat="server" 
                                                                    onclick="lbtnDistrictDelete_Click" 
                                                                    onclientclick="return confirm(&quot;Are you sure Delete?&quot;);">Delete</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Fields>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:DetailsView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View6" runat="server">
                                    <table align="center" class="style15">
                                        <tr>
                                            <td align="center" bgcolor="Blue" class="style16" colspan="2">
                                                <b>Add New District</b></td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                District ID</td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtAddDistrictID" runat="server" Width="200px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="txtAddDistrictID" ErrorMessage="ID is required." 
                                                    ValidationGroup="District" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="txtAddDistrictID" Display="Dynamic" 
                                                    ErrorMessage="Only 3 Characters" ValidationExpression="\w{3}" 
                                                    ValidationGroup="District"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                District Name</td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtAddDistrictName" runat="server" ValidationGroup="District" 
                                                    Width="200px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="txtAddDistrictName" ErrorMessage="Name is required." 
                                                    ValidationGroup="District"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                City Name</td>
                                            <td style="text-align: left">
                                                <asp:DropDownList ID="ddlAddCityID" runat="server" DataTextField="CityName" 
                                                    DataValueField="CityID" Width="202px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="btnDistrictAdd" runat="server" onclick="btnDistrictAdd_Click" 
                                                    Text="Create" ValidationGroup="District" Width="114px" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnDistrictCancelAdd" runat="server" CausesValidation="False" 
                                                    onclick="btnDistrictCancelAdd_Click" Text="Cancel" Width="129px" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                            </asp:MultiView>
                            <asp:MultiView ID="MultiView5" runat="server">
                                <asp:View ID="View7" runat="server">
                                    <table align="center" class="style15">
                                        <tr>
                                            <td align="center" bgcolor="Blue" class="style16" colspan="2">
                                                <b>EDIT DISTRICT</b></td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                District ID</td>
                                            <td>
                                                <asp:Label ID="lblDistrictID" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                District Name</td>
                                            <td>
                                                <asp:TextBox ID="txtEditDistrictName" runat="server" Width="200px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                    ControlToValidate="txtEditDistrictName" ErrorMessage="Name is required." 
                                                    ValidationGroup="DistrictEdit"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                City Name</td>
                                            <td>
                                                <asp:DropDownList ID="ddlCityID" runat="server" DataTextField="CityName" 
                                                    DataValueField="CityID" Width="202px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="btnDistrictUpdate" runat="server" 
                                                    onclick="btnDistrictUpdate_Click" Text="Update" ValidationGroup="DistrictEdit" 
                                                    Width="114px" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnEditDistrictCancel" runat="server" CausesValidation="False" 
                                                    onclick="btnEditDistrictCancel_Click" Text="Cancel" Width="129px" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                            </asp:MultiView>
                        </p>
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Panel ID="Panel3" runat="server" GroupingText="Equipment Type">
                        <p>
                            <asp:Button ID="btnAddNewET" runat="server" CausesValidation="False" 
                                onclick="btnAddNewET_Click" Text="Add New Equipment Type" Width="178px" />
                        </p>
                        <p align="center">
                            <asp:GridView ID="gvET" runat="server" AllowPaging="True" AllowSorting="True" 
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="EquipmentTypeID" 
                                onpageindexchanging="gvET_PageIndexChanging" 
                                onselectedindexchanged="gvET_SelectedIndexChanged" onsorting="gvET_Sorting" 
                                Width="509px">
                                <RowStyle BackColor="White" ForeColor="#003399" />
                                <Columns>
                                    <asp:CommandField SelectText="Detail" ShowSelectButton="True" />
                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" 
                                    HorizontalAlign="Center" />
                                <EditRowStyle HorizontalAlign="Center" />
                            </asp:GridView>
                            <asp:MultiView ID="MultiView6" runat="server">
                                <asp:View ID="View8" runat="server">
                                    <table align="center" class="style13">
                                        <tr>
                                            <td class="style14" style="text-align: center; background-color: #0000FF">
                                                EQUIPMENT TYPE DETAIL</td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="text-align: center">
                                                <asp:DetailsView ID="dtET" runat="server" CellPadding="4" ForeColor="#333333" 
                                                    GridLines="None" Height="50px" style="text-align: center" Width="490px">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <Fields>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                &nbsp;&nbsp;<asp:LinkButton ID="lbtnEditET" runat="server" onclick="lbtnEditET_Click">Edit</asp:LinkButton>
                                                                &nbsp;&nbsp;
                                                                <asp:LinkButton ID="lbtnETDelete" runat="server" onclick="lbtnETDelete_Click" 
                                                                    onclientclick="return confirm(&quot;Are you sure Delete?&quot;);">Delete</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Fields>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:DetailsView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View9" runat="server">
                                    <table align="center" class="style15">
                                        <tr>
                                            <td align="center" bgcolor="Blue" class="style16" colspan="2">
                                                <b>Add New Equipment Type</b></td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                Equipment Type Name</td>
                                            <td class="style18" style="text-align: left">
                                                <asp:TextBox ID="txtAddETName" runat="server" Width="200px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                    ControlToValidate="txtAddETName" ErrorMessage="Name is required." 
                                                    ValidationGroup="ET"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                Description</td>
                                            <td class="style18" style="text-align: left">
                                                <asp:TextBox ID="txtDes" runat="server" Height="78px" TextMode="MultiLine" 
                                                    Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="btnETAdd" runat="server" onclick="btnETAdd_Click" Text="Create" 
                                                    ValidationGroup="District" Width="114px" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnETCancelAdd" runat="server" CausesValidation="False" 
                                                    onclick="btnETCancelAdd_Click" Text="Cancel" Width="129px" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                            </asp:MultiView>
                        </p>
                        <p>
                            <asp:MultiView ID="MultiView7" runat="server">
                                <asp:View ID="View10" runat="server">
                                    <table align="center" class="style15">
                                        <tr>
                                            <td align="center" bgcolor="Blue" class="style16" colspan="2">
                                                <b>EDIT EQUIPMENT TYPE</b></td>
                                        </tr>
                                        <tr>
                                            <td class="style20">
                                                Equipment Type&nbsp; ID</td>
                                            <td>
                                                <asp:Label ID="lblETID" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style20">
                                                Equipment Type Name</td>
                                            <td>
                                                <asp:TextBox ID="txtEditETName" runat="server" Width="200px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                    ControlToValidate="txtEditETName" ErrorMessage="Name is required." 
                                                    ValidationGroup="ETEdit"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style20">
                                                Description</td>
                                            <td>
                                                <asp:TextBox ID="txtDes0" runat="server" Height="78px" TextMode="MultiLine" 
                                                    Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="btnETUpdate" runat="server" 
                                                    Text="Update" Width="114px" ValidationGroup="ETEdit" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnEditETCancel" runat="server" CausesValidation="False" 
                                                    onclick="btnEditETCancel_Click" Text="Cancel" Width="129px" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <br />
                            </asp:MultiView>
                        </p>
                    </asp:Panel>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
    </p>
</asp:Content>

