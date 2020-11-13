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
using DataLayer;

public partial class ViewOrders : System.Web.UI.Page
{

    Data objData = new Data();
    string sql = "";
    SqlParameter sp;
    //string str ="server=32-PC;database=Nexus1;uid=sa;pwd=1234";
    SqlConnection con;
    SqlCommand cmd;// bai cua tao dau

    Plan_BL objPlan = new Plan_BL();
    public DataTable chan()
    {
        return objData.LoadData("select * from Orders ");

    }
    public DataTable chan1()
    {
        return objData.LoadData(" select OrderID,City,District,Phone,OrderDate ,LandLineID,SecurityDeposit,Name,Passport,EquipmentID from Orders where LandLineID!=''");
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //Page.MaintainScrollPositionOnPostBack = true;
        //Session["url"] = Server.HtmlEncode(Request.RawUrl);
        //if (!(bool)Session["isLogin"])
        //    Server.Transfer("Login.aspx");
        //if (!(Session["role"].ToString().Equals("Admin")))
        //    Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            table1.Visible = false;
            table6.Visible = false;
            tableaddnewfull.Visible = false;
            tableupdatefull.Visible = false;
           
            loadDia();
            //DropDownListBBID();
            DropDownListLLID();
            loadidorder();
            loaddistric();
            DropDownListEqui();
            //DropDownList();
            DropDownList1();
            
            //ko lo mak lam luc nao cung gai vs gu' lai yeu than chet som e ak : ))) @
        }
       
    }
    protected void loadDia()
    {
        //day la ham load du lieu cho gridview dia.. day ak um code cua no day
        gvDialup.DataSource = chan1();
        gvDialup.DataBind();

    }
    protected void loadidorder() {

        SqlDataAdapter adt = new SqlDataAdapter("select CityID,CityName from City", DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        ddlcity.DataValueField = "CityID";
        ddlcity.DataTextField = "CityName";
        ddlcity.DataSource = dtb;
        ddlcity.DataBind();
        ddlcity1.DataValueField = "CityID";
        ddlcity1.DataTextField = "CityName";
        ddlcity1.DataSource = dtb;
        ddlcity1.DataBind();
        // cai nay\ fic cung 0 co trong data lay t
    }
    private void DropDownList1()
    {
        SqlDataAdapter adt = new SqlDataAdapter("select DialUpID, Package from DialUpConnection", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        LLID1.DataSource = dts;
        LLID1.DataValueField = "DialUpID";
        LLID1.DataTextField = "Package";
        LLID1.DataBind();
    }
    protected void loadPlan()
    {

        SqlDataAdapter adt = new SqlDataAdapter("select * from BroadBandConnection", DataAccess.ConnectionString);
        DataSet dts = new System.Data.DataSet();
        adt.Fill(dts);
    }
    protected void loaddistric() {
        string str = "";
        if (Session["ID"] != null)
        {
            string ID = Session["ID"].ToString();
            str = "select * from District where CityID='" + ID + "'";
        }
        else
        {
            str = "select * from District";
        }
        SqlDataAdapter adt = new SqlDataAdapter(str, DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        ddldistrict.DataSource = dts;
        ddldistrict.DataValueField = "DistrictID";
        ddldistrict.DataTextField = "DistrictName";
        ddldistrict.DataBind();
        adt.Fill(dts);
        ddldistrict1.DataSource = dts;
        ddldistrict1.DataValueField = "DistrictID";
        ddldistrict1.DataTextField = "DistrictName";
        ddldistrict1.DataBind();
    }
    //protected void DropDownListBBID()
    //{

    //    SqlDataAdapter adt = new SqlDataAdapter("select BroadBandID,Package from BroadBandConnection", DataAccess.ConnectionString);
    //    DataTable dtb = new DataTable();
    //    adt.Fill(dtb);
    //    BBID.DataValueField = "BroadBandID";
    //    BBID.DataTextField = "Package";
    //    BBID.DataSource = dtb;
    //    BBID.DataBind();
    //}
    protected void DropDownListLLID()
    {

        SqlDataAdapter adt = new SqlDataAdapter("select LandLineID,Package from LandLineConnection", DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        LLID.DataValueField = "LandLineID";
        LLID.DataTextField = "Package";
        LLID.DataSource = dtb;
        LLID.DataBind();

        LLID1.DataValueField = "LandLineID";
        LLID1.DataTextField = "Package";
        LLID1.DataSource = dtb;
        LLID1.DataBind();
    }
    protected void DropDownListEqui()
    {

        SqlDataAdapter adt = new SqlDataAdapter("select EquipmentID,EquipmentName from Equipment", DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        
        DEqui.DataValueField = "EquipmentID";
        DEqui.DataTextField = "EquipmentName";
        DEqui.DataSource = dtb;
        DEqui.DataBind();
        
        DEqui1.DataValueField = "EquipmentID";
        DEqui1.DataTextField = "EquipmentName";
        DEqui1.DataSource = dtb;
        DEqui1.DataBind();
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = DataAccess.Connection;
            cmd = con.CreateCommand();
            DEqui1.Items.Add("Null");
            // cai SecurityDeposit laf kieu du lieu fload
            cmd.CommandText = "insert into Orders values (@OrderDate,@OrderStatus,@DialUpID,@BroadBandID,@SecurityDeposit,@LandLineID,@City,@District,@Phone,@name,@EquipmentID,@Passport)";
            cmd.Parameters.AddWithValue("@DialUpID","");
            cmd.Parameters.AddWithValue("@OrderStatus", ddlpokha.SelectedItem.ToString());

            DateTime date =DateTime.Parse(txtdatekha.Text);
            try
            {
                   if(date>DateTime.Now){

                datetimeEX.Text = ("start date is not greater than the current date");
            }
            else{
                cmd.Parameters.AddWithValue("@OrderDate", date);
            }
            }
            catch (Exception ex)
            {
                
                datetimeEX.Text = ("start date is not greater than the current date");
            }

            //=======================================
            try
            {
                if (date > DateTime.Now)
                {

                    datetimeEX.Text = ("thanh cong");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Phone", float.Parse(txtphonekha.Text.ToString()));
                }
            }
            catch (Exception ex)
            {

                datetimeEX.Text = ("Phone not Null");
            }
            //===========================================


            //cmd.Parameters.AddWithValue("@ids",int.Parse( txtorderid.Text.ToString()));
            cmd.Parameters.AddWithValue("@SecurityDeposit",float.Parse( txtsecukha.Text.ToString()));
            cmd.Parameters.AddWithValue("@City", ddlcity.SelectedValue.ToString());
            //cmd.Parameters.AddWithValue("@OrderID", txtorderid.Text);
            cmd.Parameters.AddWithValue("@District",ddldistrict.SelectedValue.ToString());
            
            //cmd.Parameters.AddWithValue("@Phone", float.Parse(txtphonekha.Text.ToString()));

            cmd.Parameters.AddWithValue("@EquipmentID", DEqui.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@BroadBandID", "");
            //cmd.Parameters.AddWithValue("@LandLineID", "");
            //cmd.Parameters.AddWithValue("@BroadBandID", BBID.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@LandLineID", LLID.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Passport", float.Parse(Passport2.Text.ToString()));
            cmd.Parameters.AddWithValue("@Name", Name2.Text.ToString());


           
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
        lbtb.Visible = true;
        lbtb.Visible = true;
        datetimeEX.Visible = true;
        lbtbupdate.Visible = false;
        //txtphonekha.Text = "";
        //txtsecukha.Text = "";
    
        

        loadDia();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewOrdersLandLine.aspx");
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        table6.Visible = true;
        table1.Visible = false;
        datetimeEX.Visible = false;
        lbtbupdate.Visible = false;
        lbtb.Visible = false;
        
        
    }
    protected void btnUpdatePlans_Click(object sender, EventArgs e)
    {

        try
        {

            SqlConnection con = DataAccess.Connection;
            cmd = con.CreateCommand();

            cmd.CommandText = "update  Orders set   OrderDate= @OrderDate,OrderStatus=@OrderStatus,DialUpID=@DialUpID,BroadBandID=@BroadBandID,SecurityDeposit=@SecurityDeposit,LandLineID=@LandLineID,City=@City,District=@District,Phone=@Phone,Name=@Name,EquipmentID=@EquipmentID,Passport=@Passport where OrderID=@OrderID";
            cmd.Parameters.AddWithValue("@OrderStatus", drplanStatus.Text.ToString());
            cmd.Parameters.AddWithValue("@DialUpID","");
            cmd.Parameters.AddWithValue("@SecurityDeposit", float.Parse(txtSecurityDepositUd.Text));
            cmd.Parameters.AddWithValue("@City", ddlcity1.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@District", ddldistrict1.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@Phone", float.Parse(TextBox1.Text));
            cmd.Parameters.AddWithValue("@EquipmentID", DEqui1.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@OrderID", Label1.Text.ToString());
            cmd.Parameters.AddWithValue("@Passport", float.Parse(Passport1.Text));
            cmd.Parameters.AddWithValue("@Name", Name1.Text.ToString());
            cmd.Parameters.AddWithValue("@OrderDate", "");
            cmd.Parameters.AddWithValue("@BroadBandID", "");
            cmd.Parameters.AddWithValue("@LandLineID", LLID.SelectedValue.ToString());
           
            



            cmd.ExecuteNonQuery();

            lbtbupdate.Text = "Sua thanh cong";
        }
        catch (Exception ex)
        {
            lbtbupdate.Text = "" + ex.Message;
        }
        //table6.Visible = false;
        //table1.Visible = false;
        //tableupdatefull.Visible = true;
        //tableaddnewfull.Visible = false;

        table6.Visible = false;
        table1.Visible = false;
        tableupdatefull.Visible = true;
        tableaddnewfull.Visible = false;
        lbtb.Visible = true;
        lbtbupdate.Visible = true;
        datetimeEX.Visible = false;


        loadDia();
    }
    protected void PlanID2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void PlanID3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    //public void DropDownList()
    //{

    //    SqlDataAdapter adt = new SqlDataAdapter("select DialUpID, Package from DialUpConnection", DataAccess.ConnectionString);
    //    DataSet dts = new DataSet();
    //    adt.Fill(dts);
    //    ddldiakha.DataSource = dts;
    //    ddldiakha.DataValueField = "DialUpID";
    //    ddldiakha.DataTextField = "Package";
    //    ddldiakha.DataBind();

    //}
 
    //protected void ibtupdate0_Click(object sender, ImageClickEventArgs e)
    //{

    //    ImageButton ibt = (ImageButton)sender;
    //    string ma = ibt.CommandArgument;
    //    SqlDataAdapter adt = new SqlDataAdapter("select * from Orders where OrderID='" + ma + "'", DataAccess.ConnectionString);
    //    DataTable dts = new DataTable();
    //    adt.Fill(dts);

    //    for (int i = 0; i < dts.Rows.Count; i++)
    //    {

    //        //txtDialUpID.Text = dts.Rows[0][0].ToString();
    //        //txtPackage.Text = dts.Rows[0][1].ToString();
    //        //drplan3.DataValueField = dts.Rows[0][2].ToString();
    //        ////txtPackage.Text = dts.Rows[0][2].ToString();
    //        //txtDuration.Text = dts.Rows[0][3].ToString();
    //        //txtPrice.Text = dts.Rows[0][4].ToString();
    //        //txtValidity.Text = dts.Rows[0][5].ToString();

    //    }
    //    table1.Visible = true;
    //    table6.Visible = false;

   // }
    protected void gvDialup_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void cldorder_SelectionChanged(object sender, EventArgs e)
    {
        //tu tu den day tao lai wen me no roi 
        txtdatekha.Text = cldorder.SelectedDate.ToShortDateString();
        cldorder.Visible = false;
    }
    protected void ibtupdate0_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ibt = (ImageButton)sender;
        string ma = ibt.CommandArgument;
       // string Null = "";
        DEqui1.Items.Add("Null");
        SqlDataAdapter adt = new SqlDataAdapter("select * from Orders where OrderID='" + ma + "'", DataAccess.ConnectionString);
        DataTable dts = new DataTable();
        adt.Fill(dts);

      

        for (int i = 0; i < dts.Rows.Count; i++)
        {

            //txtDialUpID.Text = dts.Rows[0][0].ToString();OrderStatus
            //txtPackage.Text = dts.Rows[0][1].ToString();Label1
            Label1.Text = dts.Rows[0][0].ToString();
            ddlpokha.DataValueField = dts.Rows[0][1].ToString();
            drplanStatus.DataValueField = dts.Rows[0][2].ToString();
            LLID1.DataValueField = dts.Rows[0][3].ToString();
            txtSecurityDepositUd.Text = dts.Rows[0][5].ToString();
            ddlcity1.DataValueField = dts.Rows[0][7].ToString();
            ddldistrict1.DataValueField = dts.Rows[0][8].ToString();
            TextBox1.Text = dts.Rows[0][9].ToString();
            DEqui1.DataValueField = dts.Rows[0][10].ToString();
            Passport1.Text = dts.Rows[0][12].ToString();
            Name1.Text = dts.Rows[0][10].ToString();
        

        }
        table1.Visible = true;
        table6.Visible = false;
    }
    protected void Btndelete_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "delete from Orders where OrderID=@id";
        cmd.Parameters.AddWithValue("@id", Label1.Text);
        cmd.ExecuteNonQuery();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('ok')", true);
        loadDia();
        table6.Visible = false;
        table1.Visible = false;
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
       float phonee=float.Parse(txttim.Text);
       string sql = "select * from Orders where Passport='" + phonee + "'";
       SqlDataAdapter adt = new SqlDataAdapter(sql,DataAccess.ConnectionString);
       DataTable dtb = new DataTable();
       adt.Fill(dtb);
       if (dtb.Rows.Count>0)
       {
           gvDialup.DataSource = dtb;
           gvDialup.DataBind();
       }
        else{
            lbtbtimkiem.Text = "Not Exist";
           //tu sua lay loi` thong bao cho dep nha :))
           //nham` hang` :))
        
        }
    }
    protected void gvDialup_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //xog roi` day
       
        gvDialup.PageIndex = e.NewPageIndex;
        loadDia();
    }
    protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session.Add("ID", ddlcity.SelectedValue.ToString());
        loaddistric();
    }
    protected void ibtdate_Click(object sender, ImageClickEventArgs e)
    {
        cldorder.Visible = true;        
    }
}
