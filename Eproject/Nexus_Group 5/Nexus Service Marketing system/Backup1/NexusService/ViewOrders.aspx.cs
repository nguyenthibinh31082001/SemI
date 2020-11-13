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

public partial class ViewOrders : System.Web.UI.Page
{
        Broker_BL objBroker = new Broker_BL();
         Sorting objSort = new Sorting();
 
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (Session["role"].ToString().Equals("Customer"))
        {
            Panel1.Visible=false;
            DetailsView2.Visible=true;
             DetailsView2.DataSource = objBroker.LoadOrderDetails(objBroker.getOrderID(Session["userName"].ToString()));
            DetailsView2.DataBind();
        }
        else if (!(Session["role"].ToString().Equals("Admin") || Session["role"].ToString().Equals("RetailShop") || Session["role"].ToString().Equals("Technician")))
            Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            GridView1.DataSource = objBroker.LoadOrderList();
            GridView1.DataBind();
        }
        DetailsView1.Visible = false;
        btnBack.Visible = false;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.DataSource = objBroker.LoadOrderDetails(GridView1.SelectedValue.ToString());
        DetailsView1.DataBind();
        DetailsView1.Visible = true;
        btnBack.Visible = true;
        if (Session["role"].ToString().Equals("Technician"))
        Button1.Visible = true;
        Session["orderID"] = GridView1.SelectedValue.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (objBroker.LoadOrderStatus(GridView1.SelectedValue.ToString()).Equals("No"))
        {
              Response.Redirect("CreateConnection.aspx");
        }
        else
        {
            Response.Write("<script>alert('Order: " + GridView1.SelectedValue.ToString() + " already exist connect!')</script>");
            Server.Transfer("PlaceOrder.aspx");

        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = objBroker.LoadOrderList();
        GridView1.DataBind();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objBroker.LoadOrderList());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        GridView1.DataSource = dataView;
        GridView1.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DetailsView1.Visible = false;
        btnBack.Visible = false;
        if (ddlSearchOrders.SelectedValue.ToString() == "OrderID")
        {
           GridView1.DataSource =objBroker.SearchOrdersOrderID(txtSearchOrders.Text);
           GridView1.DataBind();

        }
        if (ddlSearchOrders.SelectedValue.ToString() == "CustomerID")
        {
            GridView1.DataSource = objBroker.SearchOrdersCustomerID(txtSearchOrders.Text);
            GridView1.DataBind();
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        GridView1.DataSource = objBroker.LoadOrderList();
        GridView1.DataBind();
        btnBack.Visible = false;
    }
    
}
