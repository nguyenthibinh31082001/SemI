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

public partial class Feedback : System.Web.UI.Page
{
    FeedBack_BL objFB = new FeedBack_BL();
    Sorting objSort = new Sorting();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("Customer")))
            Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            gvFeedback.DataSource = objFB.DisplayFeedBackStatusCus("True");
            gvFeedback.DataBind();
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (objFB.InsertFeedBack(Session["userName"].ToString(), DateTime.Now.ToShortDateString(), txtTitle.Text, txtContent.Text, "False") > 0)
        {
            Response.Write("<script>alert('Feedback was sent to Nexus company ! Please wait to answer.')</script>");
            Server.Transfer("Feedback.aspx");
        }
    }
    protected void gvFeedback_SelectedIndexChanged(object sender, EventArgs e)
    {
        dtViewFB.Visible = true;
        dtViewFB.DataSource = objFB.DisplayFeedBackFullCus(gvFeedback.SelectedValue.ToString());
        dtViewFB.DataBind();
        Panel1.Visible = false;
    }
    protected void gvFeedback_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvFeedback.PageIndex = e.NewPageIndex;
        gvFeedback.DataSource = objFB.DisplayFeedBackStatusCus("True");
        gvFeedback.DataBind();
       
    }
    protected void gvFeedback_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objFB.DisplayFeedBackStatusCus("True"));
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvFeedback.DataSource = dataView;
        gvFeedback.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void btnFB_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        dtViewFB.Visible = false;
    }
}
