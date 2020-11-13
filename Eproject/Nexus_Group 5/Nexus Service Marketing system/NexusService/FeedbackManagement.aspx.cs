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

public partial class FeedbackManagement : System.Web.UI.Page
{
    FeedBack_BL objFB = new FeedBack_BL();
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
           // gvFeedback.DataSource = objFB.DisplayFeedBack();
           //gvFeedback.DataBind();
           // MultiView1.ActiveViewIndex = -1;
        }
    }

    
}
