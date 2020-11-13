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
using System.Data;
using System.Data.SqlClient;
using BussinessLayer;


public partial class aaaaaaaaaaaaaaaaa : System.Web.UI.Page
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

           
            DropDownList();
            gvDialup.DataSource = objPlan.DialUp();
            gvDialup.DataBind();
        }
    }

    private void DropDownList()
    {
        SqlDataAdapter adt = new SqlDataAdapter("select PlanID, PlanName from Plans", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        drplan2.DataSource = dts;
        drplan2.DataValueField = "PlanID";
        drplan2.DataTextField = "PlanName";
        drplan2.DataBind();
    }
   
        SqlDataAdapter adt = new SqlDataAdapter("select * from DialUpConnection", DataAccess.ConnectionString);
        DataSet dts = new System.Data.DataSet();
     
    
         protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            //ínert
 
        
            if (txtids.Text.Equals("insert"))
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
            else 
            {
                //update
                
                int a = int.Parse(txtids.Text);


                SqlConnection con = DataAccess.Connection;
                cmd = con.CreateCommand();

                cmd.CommandText = "update  DialUpConnection values (@DialUpID,@pid,@Package,@Duration,@Price,@Validity)";
                cmd.Parameters.AddWithValue("@DialUpID", txtDialUpID1.Text.ToString());
                cmd.Parameters.AddWithValue("@Package", txtPackage1.Text.ToString());
        
                Response.Write(a);
                cmd.Parameters.AddWithValue("@pid", int.Parse(drplan2.SelectedItem.Value.ToString()));
                cmd.Parameters.AddWithValue("@Duration", txtDuration1.Text.ToString());
                cmd.Parameters.AddWithValue("@Price", float.Parse(txtPrice1.Text));

                cmd.Parameters.AddWithValue("@Validity", txtValidity1.Text.ToString());
                //     int a =int.Parse( drplan1.Se.ToString());

                
                cmd.ExecuteNonQuery();

                lbtb.Text = "Them thanh cong";
            }
            
            loadbook();
        
        }
        catch (Exception ex)
            {
                lbtb.Text = "Loi..." + ex.Message;
            
            
        }
        
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        pnthemmoi.Visible = false;
        pnshow.Visible = true;
        loadbook();
    }
    protected void chkitem_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkall = (CheckBox)sender;
        foreach (GridViewRow r in gvDialup.Rows)
        {
            CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitem");
            ch.Checked = chkall.Checked;
        }
    }
    protected void loadbook() {

        SqlDataAdapter adt = new SqlDataAdapter("select * from Bookrecipe",DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        gvDialup.DataSource = dts;
        gvDialup.DataBind();
        }
    protected void ibtsua_Click(object sender, ImageClickEventArgs e)
    {
        //delete
       ImageButton imt = (ImageButton)sender;
        int a = int.Parse(imt.CommandArgument);
        SqlCommand cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "delete from Bookrecipe where BId=@id";
        cmd.Parameters.AddWithValue("@id", a);
        cmd.ExecuteNonQuery();
            loadbook();
        }
    protected void  ibtupdate_Click(object sender, ImageClickEventArgs e)
        {
       
            //fill du lieu ra tẽboxday co the thoi  bay h cai nay ma ket noi da biet la cho day 
        ImageButton imt = (ImageButton)sender;
        int a = int.Parse(imt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select * from Bookrecipe where BId='" + a + "'",DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        for (int i = 0; i < dtb.Rows.Count; i++)
        {
            //ca ten texbox nua
            //lam di nhe tao di nau an co j chiu` xg trg tiep :)) u mco j lam not um
            txtDialUpID1.Text = dtb.Rows[0][1].ToString();
            txtPackage1.Text = dtb.Rows[0][0].ToString();
            txtDuration1.Text = dtb.Rows[0][3].ToString();
            txtPrice1.Text = dtb.Rows[0][4].ToString();
            txtValidity1.Text = dtb.Rows[0][2].ToString();
        }
            lbtb.Text = "";
        pnshow.Visible = false;
        pnthemmoi.Visible = true;
        }
    protected void grvflavor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDialup.PageIndex = e.NewPageIndex;
        loadbook();
    }
    //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    //{

    //}
    protected void grvflavor_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void ibtthem_Click(object sender, ImageClickEventArgs e)
    {
        {
            pnshow.Visible = false;
            pnthemmoi.Visible = true;
            txtids.Text = "insert";
            lbtb.Text = "";
        }
    }
    protected void PlanID2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
}