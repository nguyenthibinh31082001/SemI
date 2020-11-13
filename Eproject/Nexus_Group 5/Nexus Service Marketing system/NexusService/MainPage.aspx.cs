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

public partial class MainPage : System.Web.UI.Page
{
    Plan_BL objPlan = new Plan_BL();
    protected void Page_Load(object sender, EventArgs e)
    {


        Page.MaintainScrollPositionOnPostBack = true;
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        //if (!(bool)Session["isLogin"])
        //    Server.Transfer("Login.aspx");
        //if (!(Session["role"].ToString().Equals("Admin")))
        //    Response.Redirect("NotAccess.aspx");
        //if (!(Session["role"].ToString().Equals("Technician")))
        //    Response.Redirect("NotAccess.aspx");
        //if (!(Session["role"].ToString().Equals("Accountant")))
        //    Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {

            gvBB3.DataSource = objPlan.BB();
            gvBB3.DataBind();
            gvLL3.DataSource = objPlan.LL();
            gvLL3.DataBind();

            gvDialup3.DataSource = objPlan.DialUp();
            gvDialup3.DataBind();
        }
    }

    protected void gvPlan_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}