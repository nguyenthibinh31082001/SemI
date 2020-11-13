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
using EnCryptDecrypt;
using System.Data.SqlClient;


public partial class AddNewOder : System.Web.UI.Page
{
    //string str ="server=32-PC;database=Nexus1;uid=sa;pwd=1234";
    SqlConnection con;
    SqlCommand cmd;// bai cua tao dau

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
            table6.Visible = false;
            tableaddnewfull.Visible = false;
            tableupdatefull.Visible = false;
            DropDownList();
            DropDownList1();
            loadDia();
           
        }
    }
    protected void loadDia() {
        gvDialup.DataSource = objPlan.Plan();
        gvDialup.DataBind();
        
    }
    private void DropDownList1()
    {
        //SqlDataAdapter adt = new SqlDataAdapter("select PlanID, PlanName from Plans", DataAccess.ConnectionString);
        //DataSet dts = new DataSet();
        //adt.Fill(dts);
        //drplan3.DataSource = dts;
        //drplan3.DataValueField = "PlanID";
        //drplan3.DataTextField = "PlanName";
        //drplan3.DataBind();
    }
    protected void loadPlan() {

        SqlDataAdapter adt = new SqlDataAdapter("select * from DialUpConnection", DataAccess.ConnectionString);
        DataSet dts = new System.Data.DataSet();
        adt.Fill(dts);
   }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = DataAccess.Connection;
            cmd = con.CreateCommand();
            cmd.CommandText = "insert into Plans values (@PlanID,@PlanName,@SecurityDeposit,@Description)";
            cmd.Parameters.AddWithValue("@PlanID", txtPlansNew.Text);
            cmd.Parameters.AddWithValue("@PlanName", txtPlaneNameNew.Text);
            cmd.Parameters.AddWithValue("@SecurityDeposit", txtSecurityDepositNew.Text);
            cmd.Parameters.AddWithValue("@Description", txtdescriptionNew.Text);
            cmd.ExecuteNonQuery();

            lbtb.Text = "Them thanh cong";
        }
        catch (Exception ex)
        {

            lbtb.Text = "Them Loi~....." + ex.Message;
        }
        table6.Visible = false;
        table1.Visible = false;
        tableupdatefull.Visible = false;
        tableaddnewfull.Visible = true;

        loadDia();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewPlans.aspx");
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        table6.Visible = true;
        table1.Visible = false;
    }
    protected void btnUpdatePlans_Click(object sender, EventArgs e)
    {

        try
        {           

        SqlConnection con = DataAccess.Connection;
        cmd = con.CreateCommand();

        cmd.CommandText = "update  Plans set PlanID=@PlanID,PlanName=@PlanName,SecurityDeposit=@SecurityDeposit,Description=@Description where PlanID=@PlanID";
        cmd.Parameters.AddWithValue("@PlanID", txtPlansUD.Text.ToString());
        cmd.Parameters.AddWithValue("@PlanName", txtPlanNameUP.Text.ToString());       
        cmd.Parameters.AddWithValue("@SecurityDeposit", txtSecurityDepositUD.Text.ToString());
        cmd.Parameters.AddWithValue("@Description", txtDescriptionUD.Text.ToString());
        //cmd.Parameters.AddWithValue("@ids", txtDialUpID.Text);
            //cmd.Parameters.AddWithValue("@Package", txtPlansUD.ToString());
        //cmd.Parameters.AddWithValue("@Validity", txtValidity.Text.ToString());       
        cmd.ExecuteNonQuery();

        lbtbupdate.Text = "Sua thanh cong";
        }
        catch (Exception ex)
        {
            lbtbupdate.Text = "" + ex.Message;
        }
        table6.Visible = false;
        table1.Visible = false;
        tableupdatefull.Visible = true;
        tableaddnewfull.Visible = false;
        loadDia();
    }
    protected void PlanID2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void PlanID3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    public void DropDownList()
    {

        //SqlDataAdapter adt = new SqlDataAdapter("select PlanID, PlanName from Plans", DataAccess.ConnectionString);
        //DataSet dts = new DataSet();
        //adt.Fill(dts);
        //drplan2.DataSource = dts;
        //drplan2.DataValueField = "PlanID";
        //drplan2.DataTextField = "PlanName";
        //drplan2.DataBind();

    }
    protected void ibtupdate0_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ibt = (ImageButton)sender;
        string ma = ibt.CommandArgument;
        SqlDataAdapter adt = new SqlDataAdapter("select * from Plans where PlanID='" + ma + "'", DataAccess.ConnectionString);
        DataTable dts = new DataTable();
        adt.Fill(dts);

        for (int i = 0; i < dts.Rows.Count; i++)
        {

            txtPlansUD.Text = dts.Rows[0][0].ToString();
            txtPlanNameUP.Text = dts.Rows[0][1].ToString();
            txtSecurityDepositUD.Text = dts.Rows[0][2].ToString();
            txtDescriptionUD.Text = dts.Rows[0][3].ToString();

        }
        table1.Visible = true;
        table6.Visible = false;

    }
}
