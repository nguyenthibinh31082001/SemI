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

public partial class NotAccess : System.Web.UI.Page
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
        gvDialup.DataSource = objPlan.DialUp();
        gvDialup.DataBind();
        
    }
    private void DropDownList1()
    {
        SqlDataAdapter adt = new SqlDataAdapter("select PlanID, PlanName from Plans", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        drplan3.DataSource = dts;
        drplan3.DataValueField = "PlanID";
        drplan3.DataTextField = "PlanName";
        drplan3.DataBind();
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

            cmd.CommandText = "insert into DialUpConnection values (@DialUpID,@pid,@Package,@Duration,@Price,@Validity)";
            cmd.Parameters.AddWithValue("@DialUpID", txtDialUpID1.Text.ToString());
            cmd.Parameters.AddWithValue("@Package", txtPackage1.Text.ToString());
            string a = drplan2.SelectedItem.Value.ToString();
            Response.Write(a);
            cmd.Parameters.AddWithValue("@pid", int.Parse(drplan2.SelectedItem.Value.ToString()));
            cmd.Parameters.AddWithValue("@Duration", txtDuration1.Text.ToString());
            cmd.Parameters.AddWithValue("@Price", float.Parse(txtPrice1.Text));
         
            cmd.Parameters.AddWithValue("@Validity", txtValidity1.Text.ToString());
            //     int a =int.Parse( drplan1.Se.ToString());


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
        Response.Redirect("AddNewDaiup.aspx");
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

        cmd.CommandText = "update  DialUpConnection set DialUpID=@DialUpID,PlanID=@pid,Package=@Package,Duration=@Duration,Price=@Price,Validity=@Validity where DialUpID=@ids";
        cmd.Parameters.AddWithValue("@DialUpID", txtDialUpID.Text.ToString());
        cmd.Parameters.AddWithValue("@Package", txtPackage.Text.ToString());
        cmd.Parameters.AddWithValue("@pid", int.Parse(drplan3.SelectedItem.Value.ToString()));
        cmd.Parameters.AddWithValue("@Duration", txtDuration.Text.ToString());
        cmd.Parameters.AddWithValue("@Price", float.Parse(txtPrice.Text));
        cmd.Parameters.AddWithValue("@ids", txtDialUpID.Text);
        cmd.Parameters.AddWithValue("@Validity", txtValidity.Text.ToString());       
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

        SqlDataAdapter adt = new SqlDataAdapter("select PlanID, PlanName from Plans", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        drplan2.DataSource = dts;
        drplan2.DataValueField = "PlanID";
        drplan2.DataTextField = "PlanName";
        drplan2.DataBind();

    }
    protected void ibtupdate0_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ibt = (ImageButton)sender;
        string ma = ibt.CommandArgument;
        SqlDataAdapter adt = new SqlDataAdapter("select * from DialUpConnection where DialUpID='" + ma + "'", DataAccess.ConnectionString);
        DataTable dts = new DataTable();
        adt.Fill(dts);

        for (int i = 0; i < dts.Rows.Count; i++)
        {

            txtDialUpID.Text = dts.Rows[0][0].ToString();
            drplan2.DataValueField = dts.Rows[0][1].ToString();
            //drplan2.DataValueField = dts.Rows[0][1].ToString();
            txtPackage.Text = dts.Rows[0][2].ToString();
            txtDuration.Text = dts.Rows[0][3].ToString();
            txtPrice.Text = dts.Rows[0][4].ToString();
            txtValidity.Text = dts.Rows[0][5].ToString();

        }
        table1.Visible = true;
        table6.Visible = false;

    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "delete from DialUpConnection where DialUpID=@id";
        cmd.Parameters.AddWithValue("@id", txtDialUpID.Text);
        cmd.ExecuteNonQuery();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('ok')", true);
        loadDia();
        table6.Visible = false;
        table1.Visible = false;
    }
}
