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
using System.Data.SqlClient;

public partial class PlanManagement : System.Web.UI.Page
{
    string str = "server=32-PC;database=Nexus1;uid=sa;pwd=1234";
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
            table1.Visible = false;
            table2.Visible = false;
            table3.Visible = false;
            table4.Visible = false;
            table5.Visible = false;
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
    protected void ddlCity1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewPlans.aspx");
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        table2.Visible = true;
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        table3.Visible = true;
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        table4.Visible = true;

    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        table5.Visible = true;
    }
    //----update
    protected void gvPlan_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        table1.Visible = true;
        gvPlan.DataSource = objPlan.Plan();
        gvPlan.DataBind();
        DataTable dt = new DataTable();
        dt = objPlan.Plan();
        for (int i=0; i< dt.Rows.Count; i++)
        {
            txtPlanID.Text = dt.Rows[0][0].ToString();
            txtPlanName.Text = dt.Rows[0][1].ToString();
            txtSecurityDeposit.Text = dt.Rows[0][2].ToString();
            txtDescription.Text = dt.Rows[0][3].ToString();
        }
    }
    //protected void gvPlan_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "update")
    //    {
    //        table1.Visible = true;
    //        gvPlan.DataSource = objPlan.Plan();
    //        gvPlan.DataBind();
    //        DataTable dt = new DataTable();
    //        dt = objPlan.Plan();
    //        for (int i = 0; i < dt.Rows.Count; i++)
    //        {
    //            txtPlanID.Text = dt.Rows[0][0].ToString();
    //            txtPlanName.Text = dt.Rows[0][1].ToString();
    //            txtSecurityDeposit.Text = dt.Rows[0][2].ToString();
    //            txtDescription.Text = dt.Rows[0][3].ToString();
    //        }
    //    }
    //}
    protected void txtPlanName_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("PlanManagement.aspx");
    }
    protected void btnUpdatePlans_Click(object sender, EventArgs e)
    {

    }
    protected void ibtupdate_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ibt = (ImageButton)sender;
        int ma = int.Parse(ibt.CommandArgument);
           

        SqlDataAdapter adt = new SqlDataAdapter("select * from Plans where PlanID='"+ma+"'", str);
        DataTable dt = new DataTable();
        adt.Fill(dt);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            txtPlanID.Text = dt.Rows[0][0].ToString();
            txtPlanName.Text = dt.Rows[0][1].ToString();
            txtSecurityDeposit.Text = dt.Rows[0][2].ToString();
            txtDescription.Text = dt.Rows[0][3].ToString();
        }
        pnchitiet.Visible = true;
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {

    }
}
