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

public partial class KeepTrackConnection : System.Web.UI.Page
{
    Sorting objSort = new Sorting();
    Common objCommon = new Common();
    Connection_BL objCon = new Connection_BL();
    Customer_BL objCus = new Customer_BL();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (Session["role"].ToString().Equals("Accountant"))
            Response.Redirect("NotAccess.aspx");
        if (Session["role"].ToString().Equals("Customer"))
        {
            Panel2.Visible = true;
            Panel3.Visible = false;
            int conid=int.Parse(objCus.getConnectionID(Session["username"].ToString()).Rows[0][0].ToString());
            dtconnection0.DataSource = objCon.DetailConnection(objCon.GetOrderID(conid).Rows[0][0].ToString(), conid);
            dtconnection0.DataBind();
        }
        if (!IsPostBack)
        {
            gvKeeptrack.DataSource = objCon.LoadConnections();
            gvKeeptrack.DataBind();
        }
        pnlConSta.Visible = false;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objCon.UpdateConnections(ddlStatus.SelectedValue.ToString(), (int)gvKeeptrack.SelectedValue);
        gvKeeptrack.DataSource = objCon.LoadConnections();
        gvKeeptrack.DataBind();
        pnlConSta.Visible = false;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pnlConSta.Visible = false;
    }
    protected void gvKeeptrack_SelectedIndexChanged(object sender, EventArgs e)
    {
        dtconnection.DataSource = objCon.DetailConnection(objCon.GetOrderID((int)gvKeeptrack.SelectedValue).Rows[0][0].ToString(), (int)gvKeeptrack.SelectedValue);
        dtconnection.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        pnlConSta.Visible = false;
        gvKeeptrack.DataSource = objCommon.SearchOrderID(txtSearch.Text);
        gvKeeptrack.DataBind();
    }
    protected void gvKeeptrack_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvKeeptrack.PageIndex = e.NewPageIndex;
        gvKeeptrack.DataSource = objCon.LoadConnections();
        gvKeeptrack.DataBind();
    }
    protected void gvKeeptrack_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objCon.LoadConnections());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvKeeptrack.DataSource = dataView;
        gvKeeptrack.DataBind();
    }

    protected void lbtnEdit_Click(object sender, EventArgs e)
    {
        if (Session["role"].ToString().Equals("Technician"))
        {
            pnlConSta.Visible = true;
            ddlStatus.Text = objCon.GetOrderID((int)gvKeeptrack.SelectedValue).Rows[0][1].ToString();
        }
    }
}
