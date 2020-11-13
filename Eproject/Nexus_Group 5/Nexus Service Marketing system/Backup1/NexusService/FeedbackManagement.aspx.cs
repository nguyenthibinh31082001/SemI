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
            gvFeedback.DataSource = objFB.DisplayFeedBack();
           gvFeedback.DataBind();
            MultiView1.ActiveViewIndex = -1;
        }
    }

    protected void ddlStatus_Load(object sender, EventArgs e)
    {
        if (ddlStatus.Text.Equals("True"))
        {
            gvFeedback.DataSource = objFB.DisplayFeedBackStatus("True");
            gvFeedback.DataBind();
        }
        else if (ddlStatus.Text.Equals("False"))
        {
            gvFeedback.DataSource = objFB.DisplayFeedBackStatus("False");
            gvFeedback.DataBind();
        }
        else
        {
            gvFeedback.DataSource = objFB.DisplayFeedBack();
            gvFeedback.DataBind();
        }
    }
    protected void gvFeedback_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.DataSource = objFB.DisplayFeedBackFull(gvFeedback.SelectedValue.ToString());
        DetailsView1.DataBind();
        Session["index"] = gvFeedback.SelectedValue.ToString();
        MultiView1.ActiveViewIndex = -1;
    }

    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = -1;
    }

    protected void lbtnEditAns_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        txtTitle.Text = objFB.DisplayFeedBackFull(Session["index"].ToString()).Rows[0][4].ToString();
        txtContent.Text = objFB.DisplayFeedBackFull(Session["index"].ToString()).Rows[0][5].ToString();
        txtAnswer.Text = objFB.DisplayFeedBackFull(Session["index"].ToString()).Rows[0][6].ToString();
        if (objFB.DisplayFeedBackFull(Session["index"].ToString()).Rows[0][7].ToString().Equals("True"))
            chkStatus.Checked = true;
        else
            chkStatus.Checked = false;
    }

    protected void lbtnAnswer_Click(object sender, EventArgs e)
    {
        string stt;
        if (chkStatus.Checked)
            stt = "True";
        else
            stt = "False";
        objFB.AnswerFeedback(Session["index"].ToString(), txtTitle.Text, txtContent.Text, txtAnswer.Text, stt);
        MultiView1.ActiveViewIndex = -1;
    }
    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        objFB.DeleteFB(Session["index"].ToString());
        Response.Redirect("FeedbackManagement.aspx");
    }
    protected void gvFeedback_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt;
        if (ddlStatus.Text.Equals("True"))
        {
            dt = objFB.DisplayFeedBackStatus("True");
        }
        else if (ddlStatus.Text.Equals("False"))
        {
            dt =  objFB.DisplayFeedBackStatus("False");
        }
        else
        {
            dt =  objFB.DisplayFeedBack();
        }
        DataView dataView = new DataView(dt);
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvFeedback.DataSource = dataView;
        gvFeedback.DataBind();
    }
    protected void gvFeedback_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvFeedback.PageIndex = e.NewPageIndex;
        if (ddlStatus.Text.Equals("True"))
        {
            gvFeedback.DataSource = objFB.DisplayFeedBackStatus("True");
            gvFeedback.DataBind();
        }
        else if (ddlStatus.Text.Equals("False"))
        {
            gvFeedback.DataSource = objFB.DisplayFeedBackStatus("False");
            gvFeedback.DataBind();
        }
        else
        {
            gvFeedback.DataSource = objFB.DisplayFeedBack();
            gvFeedback.DataBind();
        }
    }
}
