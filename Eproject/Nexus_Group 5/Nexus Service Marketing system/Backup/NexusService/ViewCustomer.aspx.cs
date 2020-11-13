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
public partial class ViewCustomer : System.Web.UI.Page
{
    Sorting objSort = new Sorting();
    Broker_BL objBroker = new Broker_BL();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("Admin") || Session["role"].ToString().Equals("RetailShop")))
            Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            GridView1.DataSource = objBroker.LoadCustomers();
            GridView1.DataBind();
        }
        btnBack.Visible = false;
        DetailsView1.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        btnBack.Visible = false;
        DetailsView1.Visible = false;
        if (ddlSearch.SelectedValue.ToString() == "CustomerID")
        {
            GridView1.DataSource = objBroker.SearchCustomerID(txtSearch.Text);
            GridView1.DataBind();
        }
        else if (ddlSearch.SelectedValue.ToString() == "CustomerName")
        {
            GridView1.DataSource = objBroker.SearchCustomerName(txtSearch.Text);
            GridView1.DataBind();
        }
        else if (ddlSearch.SelectedValue.ToString() == "OrderID")
        {
            GridView1.DataSource = objBroker.SearchOrderID(txtSearch.Text);
            GridView1.DataBind();
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnBack.Visible = true;
        DetailsView1.Visible = true;
        DetailsView1.DataSource = objBroker.LoadCustomerDetails(GridView1.SelectedValue.ToString());
        DetailsView1.DataBind();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objBroker.LoadCustomers());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        GridView1.DataSource = dataView;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = objBroker.LoadCustomers();
        GridView1.DataBind();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        btnBack.Visible = false;
    }
}
