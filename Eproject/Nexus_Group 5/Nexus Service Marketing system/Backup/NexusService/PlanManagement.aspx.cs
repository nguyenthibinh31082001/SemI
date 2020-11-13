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

public partial class PlanManagement : System.Web.UI.Page
{
    Plan_BL objPlan = new Plan_BL();
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
            gvPlan.DataSource = objPlan.Plan();
            gvPlan.DataBind();
            gvBB.DataSource = objPlan.BB();
            gvBB.DataBind();
            gvLL.DataSource = objPlan.LL();
            gvLL.DataBind();
            gvLLCC.DataSource = objPlan.LLCC();
            gvLLCC.DataBind();
            gvDialup.DataSource = objPlan.DialUp();
            gvDialup.DataBind();
        }
    }

    protected void gvPlan_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
