using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Quantri_QLFEEDback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)    
        {
            loadchuacheck();
            loaddacheck();
        }
    }
    protected void chkallchuacheck_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
        foreach (GridViewRow r in grvchuacheck.Rows)
        {
            CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitemchuacheck");
            ch.Checked = chk.Checked;
        }
    }
    protected void loadchuacheck()
    {
        SqlDataAdapter adt = new SqlDataAdapter("select * from Feedback where Status=0", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        grvchuacheck.DataSource = dts;
        grvchuacheck.DataBind();
    }
    protected void grvchuacheck_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvchuacheck.PageIndex = e.NewPageIndex;
        loadchuacheck();
    }
    protected void loaddacheck()
    {
        SqlDataAdapter adt = new SqlDataAdapter("select * from Feedback where Status=1", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        grvdachech.DataSource = dts;
        grvdachech.DataBind();

    }

    public void chkalldacheck_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
        foreach (GridViewRow r in grvdachech.Rows)
        {
            CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitemdacheck");
            ch.Checked = chk.Checked;
        }
    }
    protected void grvdachech_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvdachech.PageIndex = e.NewPageIndex;
        loaddacheck();
    }
    protected void ibtchuacheck_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = (ImageButton)sender;
        int ma = int.Parse(ibt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select * from Feedback where FBId='" + ma + "'", DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        for (int i = 0; i < dtb.Rows.Count; i++)
        {
            txtcontent.Text = dtb.Rows[0][6].ToString();
            txtids.Text = dtb.Rows[0][0].ToString();
            txtsender.Text = dtb.Rows[0][1].ToString();
            txttitle.Text = dtb.Rows[0][5].ToString();
            txtaddress.Text = dtb.Rows[0][2].ToString();
            txtdate.Text=dtb.Rows[0][7].ToString();
            txtphone.Text = dtb.Rows[0][3].ToString();
            txtmail.Text = dtb.Rows[0][4].ToString();
        }
            if (dtb.Rows[0][8].ToString()== "true")
            {
                chkcheck.Checked = true;
            }
            else {
                chkcheck.Checked = false;
            }
        
        pnchitiet.Visible = true;
        pnupdate.Visible = false;
        pnshow.Visible = false;
    }
    protected void ibtxoadacheck_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = (ImageButton)sender;
        int ma = int.Parse(ibt.CommandArgument);
        SqlCommand cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "delete from Feedback where FBId=@id";
        cmd.Parameters.AddWithValue("@id", ma);
        cmd.ExecuteNonQuery();
        loadchuacheck();
    }
    protected void ibtchuacheck0_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = (ImageButton)sender;
        int ma = int.Parse(ibt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select * from Feedback where FBId='" + ma + "'", DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        for (int i = 0; i < dtb.Rows.Count; i++)
        {
            txtcontent.Text = dtb.Rows[0][6].ToString();
            txtids.Text = dtb.Rows[0][0].ToString();
            txtsender.Text = dtb.Rows[0][1].ToString();
            txttitle.Text = dtb.Rows[0][5].ToString();
            txtaddress.Text = dtb.Rows[0][2].ToString();
            txtdate.Text = dtb.Rows[0][7].ToString();
            txtphone.Text = dtb.Rows[0][3].ToString();
            txtmail.Text = dtb.Rows[0][4].ToString();
        }
        if (dtb.Rows[0][8].ToString() == "true")
        {
            chkcheck.Checked = true;
        }
        else
        {
            chkcheck.Checked = false;
        }
        pnchitiet.Visible = true;
        pnupdate.Visible = false;
        pnshow.Visible = false;
    }
    protected void ibtxoadacheck0_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = (ImageButton)sender;
        int ma = int.Parse(ibt.CommandArgument);
        SqlCommand cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "delete from Feedback where FBId=@id";
        cmd.Parameters.AddWithValue("@id", ma);
        cmd.ExecuteNonQuery();
        loadchuacheck();
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        int ma=int.Parse(txtids.Text);
    
            SqlCommand cmd = DataAccess.Connection.CreateCommand();
            cmd.CommandText = "update Feedback set Sender=@Bname,Address=@username,Phone= @pass,Email= @email,Title=@address,Content= @content,Date= @date,Status= @status where FBId=@id";
            cmd.Parameters.AddWithValue("@Bname", txtsender.Text);
            cmd.Parameters.AddWithValue("@username", txtaddress.Text);
            cmd.Parameters.AddWithValue("@pass", txtphone.Text);
            cmd.Parameters.AddWithValue("@email", txtmail.Text);
            cmd.Parameters.AddWithValue("@address", txttitle.Text);
            cmd.Parameters.AddWithValue("@content", txtcontent.Text);
            cmd.Parameters.AddWithValue("@date", txtdate.Text);
            if (chkcheck.Checked)
            {
                cmd.Parameters.AddWithValue("@status", true);
            }
            else {
                cmd.Parameters.AddWithValue("@status", false);
            }
           
            cmd.Parameters.AddWithValue("@id",ma);

            cmd.ExecuteNonQuery();
            loaddacheck();
            loadchuacheck();
            txtcontent.Text = "";
            txtids.Text = "";
            txtsender.Text = "";
            txttitle.Text = "";
            txtchuyenhuong.Text = "";
            txtphone.Text = "";
            txtmail.Text = "";
            txtdate.Text = "";
            txtaddress.Text = "";
         
        
    }


    protected void ibtdacheck0_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = (ImageButton)sender;
        int ma = int.Parse(ibt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select * from Feedback where FBId='" + ma + "'", DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        for (int i = 0; i < dtb.Rows.Count; i++)
        {
            txtcontent.Text = dtb.Rows[0][6].ToString();
            txtids.Text = dtb.Rows[0][0].ToString();
            txtsender.Text = dtb.Rows[0][1].ToString();
            txttitle.Text = dtb.Rows[0][5].ToString();
            txtaddress.Text = dtb.Rows[0][2].ToString();
            txtdate.Text = dtb.Rows[0][7].ToString();
            txtphone.Text = dtb.Rows[0][3].ToString();
            txtmail.Text = dtb.Rows[0][4].ToString();
        }
        if (dtb.Rows[0][8].ToString() == "true")
        {
            chkcheck.Checked = true;
        }
        else
        {
            chkcheck.Checked = false;
        }
        pnchitiet.Visible = true;
        pnupdate.Visible = false;
        pnshow.Visible = false;

    }
    protected void ibtxoadacheck0_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = (ImageButton)sender;
        int ma = int.Parse(ibt.CommandArgument);
        SqlCommand cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "delete from Feedback where FBId=@id";
        cmd.Parameters.AddWithValue("@id", ma);
        cmd.ExecuteNonQuery();
        loaddacheck();
    }
    protected void ibtxoachuacheck_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = (ImageButton)sender;
        int ma = int.Parse(ibt.CommandArgument);
        SqlCommand cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "delete from Feedback where FBId=@id";
        cmd.Parameters.AddWithValue("@id", ma);
        cmd.ExecuteNonQuery();
        loadchuacheck();
    }
    protected void lbtdacheck_Click(object sender, EventArgs e)
    {
        txtchuyenhuong.Text = "";
        pnupdate.Visible = true;
        pnshow.Visible = false;
        pnchitiet.Visible = false;
        loaddacheck();
    }
    protected void ibtback_Click(object sender, ImageClickEventArgs e)
    {
        pnshow.Visible = true;
        pnchitiet.Visible = false;
        pnupdate.Visible = false;
    }

    protected void ibtquaylai_Click(object sender, ImageClickEventArgs e)
    {
        if (txtchuyenhuong.Text.Equals("chuacheck"))
        {
            pnshow.Visible = true;
            pnchitiet.Visible = false;
            pnupdate.Visible = false;
        }
        else {
            pnupdate.Visible = true;
            pnshow.Visible = false;
            pnchitiet.Visible = false;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

       
            foreach(GridViewRow r in grvchuacheck.Rows)
            {
                TextBox tx=(TextBox)r.Cells[1].FindControl("txtmachuacheck");
                CheckBox ch=(CheckBox)r.Cells[0].FindControl("chkitemchuacheck");
                int ma =int.Parse(tx.Text);
                if(ch.Checked)
                {
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "update Feedback set Status= @status where FBId=@id";
                    cmd.Parameters.AddWithValue("@status", 1);
                    cmd.Parameters.AddWithValue("@id", ma);
                    cmd.ExecuteNonQuery();
                }

            } 
        
        loadchuacheck();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
       
            foreach (GridViewRow r in grvdachech.Rows)
            {
                TextBox tx = (TextBox)r.Cells[1].FindControl("txtmadacheck");
                CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitemdacheck");
                int ma = int.Parse(tx.Text);
                if (ch.Checked)
                {
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "delete from Feedback where FBId=@id";
                    cmd.Parameters.AddWithValue("@id", ma);
                    cmd.ExecuteNonQuery();
                }

          
        }
        loaddacheck();
    }
}