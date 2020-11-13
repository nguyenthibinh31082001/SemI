using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using BussinessLayer;

public partial class Admin_RetailShopManagement : System.Web.UI.Page
{
    RetailsShop_BL objRetail = new RetailsShop_BL();
    Sorting objSort = new Sorting();
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("Admin")))
            Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            grvRetailShop.DataSource = objRetail.DisplayRTS();
            grvRetailShop.DataBind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["index"] = grvRetailShop.SelectedValue;
        DetailsView1.DataSource = objRetail.DisplayRTSFull(Session["index"].ToString());
        DetailsView1.DataBind();
        MultiView2.ActiveViewIndex = 0;
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewRetailShop.aspx");
    }
 
    protected void grvRetailShop_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvRetailShop.PageIndex = e.NewPageIndex;
        grvRetailShop.DataSource = objRetail.DisplayRTS();
        grvRetailShop.DataBind();
    }
    protected void grvRetailShop_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objRetail.DisplayRTS());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        grvRetailShop.DataSource=dataView;
        grvRetailShop.DataBind();
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        grvRetailShop.SelectedIndex = -1;
        MultiView2.ActiveViewIndex = -1;
        if (ddlSearch.SelectedValue.ToString().Equals("Name"))
        {
            grvRetailShop.DataSource = objRetail.SearchRTSByName(txtSearch.Text);
        }
        else
        {
            grvRetailShop.DataSource = objRetail.SearchRTSByID(txtSearch.Text);
        }
        grvRetailShop.DataBind();
    }

    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        if (objRetail.DeleteRetailShop(Session["index"].ToString()) > 0)
        {
            Response.Write("<script>alert('Delete " + Session["index"].ToString() + " successfully !')</script>");
            Server.Transfer("RetailShopManagement.aspx", false);
        }
    }
}
