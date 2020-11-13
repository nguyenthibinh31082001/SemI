using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Quantri_QLAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            loadUser();
        }
    }
    protected void loadUser() {

        SqlDataAdapter adt = new SqlDataAdapter("select * from Customer where IsAdmin=0", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        grvadmin.DataSource = dts;
        grvadmin.DataBind();
    }
    protected void grvadmin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvadmin.PageIndex = e.NewPageIndex;    
        loadUser();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        try
        {
            if (txtids.Text.Equals("insert"))
                {
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "insert into Customer values (@name,@username, @pass, @email,@address,@Phone,@AccountNumber,@TotalAmount,@TypeFees,@DateRegis,@DateExpired,@IsAdmin)";
                    cmd.Parameters.AddWithValue("@name", txtname.Text);
                    cmd.Parameters.AddWithValue("@username", txtusername.Text);
                    cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                    cmd.Parameters.AddWithValue("@email",txtmail.Text);
                    cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                    cmd.Parameters.AddWithValue("@phone",int.Parse( txtphone.Text));
                    cmd.Parameters.AddWithValue("@AccountNumber",float.Parse( txtaccount.Text));
                    cmd.Parameters.AddWithValue("@TotalAmount",float.Parse(txttoalamount.Text));
                  
                    if (ddlmont.SelectedValue=="Month")
                    {
                        cmd.Parameters.AddWithValue("@TypeFees","Month");
                    } else
                    {
                        cmd.Parameters.AddWithValue("@TypeFees", "Year");
                    }
                    cmd.Parameters.AddWithValue("@DateRegis", txtdateregist.Text);
                    cmd.Parameters.AddWithValue("@DateExpired",txtdateepi.Text);
                    if(chkisadmin.Checked){
                        cmd.Parameters.AddWithValue("@IsAdmin",1);
                    }else{
                    cmd.Parameters.AddWithValue("@IsAdmin",0);
                    }

                    cmd.ExecuteNonQuery();

                    lbtb.Text = "Them thanh cong";
                    txtpass.Text = "";
                    txtusername.Text = "";
                    txtname.Text = "";
                    txtmail.Text = "";
                    txtids.Text = "";
                    txtaddress.Text = "";
                    txtphone.Text="";
                    txtaccount.Text="";
                    txttoalamount.Text="";
                    
                    
                    txtdateregist.Text="";
                    txtdateepi.Text="";
                }
                else
                {

                    int a = int.Parse(txtids.Text);
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "update Customer set Name=@name,UserName=@username,PassWord= @pass,Email= @email,Address=@address,Phone=@Phone,AccountNumber=@AccountNumber,TotalAmount=@TotalAmount,TypeFees=@TypeFees,DateRegis=@DateRegis,DateExpired=@DateExpired,IsAdmin=@IsAdmin where CId=@ids";
                    cmd.Parameters.AddWithValue("@name", txtname.Text);
                    cmd.Parameters.AddWithValue("@username", txtusername.Text);
                    cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                    cmd.Parameters.AddWithValue("@email", txtmail.Text);
                    cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                    cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                    cmd.Parameters.AddWithValue("@AccountNumber",float.Parse(txtaccount.Text));
                    cmd.Parameters.AddWithValue("@TotalAmount",float.Parse( txttoalamount.Text));
                    cmd.Parameters.AddWithValue("@ids", int.Parse(txtids.Text));
                    if (ddlmont.SelectedValue=="Month")
                    {
                        cmd.Parameters.AddWithValue("@TypeFees", "Month");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@TypeFees", "Year");
                    }
                    if (chkisadmin.Checked)
                    {
                        cmd.Parameters.AddWithValue("@IsAdmin", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@IsAdmin", 0);
                    }
                    cmd.Parameters.AddWithValue("@DateRegis", txtdateregist.Text);
                    cmd.Parameters.AddWithValue("@DateExpired", txtdateepi.Text);
                    
                    cmd.ExecuteNonQuery();
                    txtpass.Text = "";
                    txtusername.Text = "";
                    txtname.Text = "";
                    txtmail.Text = "";
                    txtids.Text = "";
                    txtaddress.Text = "";
                    txtphone.Text = "";
                    txtaccount.Text = "";
                    txttoalamount.Text = "";
                    
                    txtdateregist.Text = "";
                    txtdateepi.Text = "";
                    lbtb.Text = "Sua Thanh Cong...";

                }
            
        }
        catch (Exception ex)
        {

            lbtb.Text = "Loi..." + ex.Message;
        }
        loadUser();
        loadAdmin();

    }
    protected void ibtupdate_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imt = (ImageButton)sender;
        int a = int.Parse(imt.CommandArgument);
        if (a == 0)
        {
            SqlCommand cmd = DataAccess.Connection.CreateCommand();
            cmd.CommandText = "delete from Customer where CId=@id";
            cmd.Parameters.AddWithValue("@id", a);
            cmd.ExecuteNonQuery();
            loadUser();
        }
        else {
            string cleanMessage = "Account  information  not exist! ";
            string script = "<script type=\"text/javascript\">alert('" + cleanMessage + "');</script>";

            // Gets the executing web page 
            System.Web.UI.Page page = HttpContext.Current.CurrentHandler as System.Web.UI.Page;

            // Checks if the handler is a Page and that the script isn't allready on the Page 
            if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
            {
                page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
            }
        }
    }
    protected void ibtxoaitem_Click(object sender, ImageClickEventArgs e)
    {
    }

    protected void btnthem_Click(object sender, ImageClickEventArgs e)
    {
        pnupdate.Visible = true;
        pnshow.Visible = false;
        txtids.Text = "insert";

    }
    protected void chkitem_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
        foreach (GridViewRow r in grvadmin.Rows)
        {
            CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitem");
            ch.Checked = chk.Checked;
        }
    }
    protected void ibtxoa_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CheckBox chk = (CheckBox)sender;
            TextBox tx = (TextBox)sender;
                foreach (GridViewRow r in grvadmin.Rows)
                {
                    TextBox t = (TextBox)r.Cells[1].FindControl("txtma");
                    CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitem");
                    if (ch.Checked)
                    {
                        int ma = Int32.Parse(t.Text);
                        SqlCommand cmd = DataAccess.Connection.CreateCommand();
                        cmd.CommandText = "delete from Customer where CId=@id";
                        cmd.Parameters.AddWithValue("@id", ma);
                        cmd.ExecuteNonQuery();
                    }
                }
            
            loadUser();
        }
        catch (Exception ex)
        {

            lbtb.Text = "Loi" + ex.Message;
        }
    }
   
    protected void ibtupdate_Click2(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = (ImageButton)sender;
        int a = int.Parse(ibt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select * from Customer where CId='" + a + "'", DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        for (int i = 0; i < dtb.Rows.Count; i++)
        {
            txtname.Text = dtb.Rows[0][3].ToString();
            txtids.Text = dtb.Rows[0][0].ToString();
            txtaddress.Text = dtb.Rows[0][6].ToString();
            txtmail.Text = dtb.Rows[0][5].ToString();
            txtusername.Text = dtb.Rows[0][1].ToString();
            txtpass.Text = dtb.Rows[0][2].ToString();
            txtaccount.Text = dtb.Rows[0][7].ToString();
            txtdateepi.Text =dtb.Rows[0][11].ToString();
            txtdateregist.Text =dtb.Rows[0][10].ToString();
            txtphone.Text =dtb.Rows[0][4].ToString();
            txttoalamount.Text =dtb.Rows[0][8].ToString();
            ddlmont.SelectedValue=dtb.Rows[0][9].ToString();
            string isadmin = dtb.Rows[0][12].ToString();
            if (isadmin.Equals("1"))
            {
                chkisadmin.Checked = true;
            }
            else {
                chkisadmin.Checked = false;
            }
        }
        
        pnupdate.Visible = true;
        pnshow.Visible = false;
        pnAdmin.Visible = false;
    }
    protected void ibtxoaitem_Click2(object sender, ImageClickEventArgs e)
    {
       
        ImageButton imt = (ImageButton)sender;
        int a = int.Parse(imt.CommandArgument);
            SqlCommand cmd = DataAccess.Connection.CreateCommand();
            cmd.CommandText = "delete from Customer where CId=@ids";
            cmd.Parameters.AddWithValue("@ids", a);
            cmd.ExecuteNonQuery();
     
            lbtb.Text="Khong the xoa";
      
        loadUser();
    }
    protected void ibtback_Click(object sender, ImageClickEventArgs e)
    {
        pnshow.Visible = true;
        pnupdate.Visible = false;
        txtids.Text = "";
        lbtb.Text = "";
        loadUser();
    }
    protected void loadAdmin() {
        SqlDataAdapter adt = new SqlDataAdapter("select * from Customer where IsAdmin=1",DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        grvamin.DataSource = dts;
        grvamin.DataBind();
    }
    protected void lbtadmin_Click(object sender, EventArgs e)
    {
        pnAdmin.Visible = true;
        pnshow.Visible = false;
        pnupdate.Visible = false;
        loadAdmin();
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        pnupdate.Visible = false;
        pnshow.Visible = true;
        pnAdmin.Visible = false;
    }
}