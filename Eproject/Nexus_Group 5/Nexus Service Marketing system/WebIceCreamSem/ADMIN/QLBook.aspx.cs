using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Quantri_QLBook : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {

            loadbook();
        }
    }
    protected void ibtthem_Click(object sender, ImageClickEventArgs e)
    {
        pnshow.Visible = false;
        pnthemmoi.Visible = true;
        txtids.Text = "insert";
        lbtb.Text = "";
    }
    protected void ibtxoa_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
           
                foreach (GridViewRow r in grvbook.Rows)
                {
                    TextBox t = (TextBox)r.Cells[1].FindControl("txtma");
                    CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitem");
                    if (ch.Checked)
                    {
                        int ma = Int32.Parse(t.Text);
                        SqlCommand cmd =DataAccess.Connection.CreateCommand();
                        cmd.CommandText="delete from Bookrecipe where BId=@id";
                        cmd.Parameters.AddWithValue("@id", ma);
                        cmd.ExecuteNonQuery();
                        
                    }
                    loadbook();
            }
          
        }
        catch (Exception ex)
        {

            lbtb.Text = "Loi" + ex.Message;
        }
      
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string tenfile=System.IO.Path.GetFileName(flu.PostedFile.FileName);
        
            if (txtids.Text.Equals("insert"))
            {
                flu.PostedFile.SaveAs(Server.MapPath("~/images/imagebook/")+tenfile);
                SqlCommand cmd = DataAccess.Connection.CreateCommand();
                cmd.CommandText = "insert into Bookrecipe values (@Bname,@price, @Description, @author,@image)";
                cmd.Parameters.AddWithValue("@Bname", txtname.Text);
                cmd.Parameters.AddWithValue("@price", float.Parse(txtprice.Text));
                cmd.Parameters.AddWithValue("@Description",txtdecreption.Text);
                cmd.Parameters.AddWithValue("@author", txtauthor.Text);
                cmd.Parameters.AddWithValue("@image", tenfile);
                
                cmd.ExecuteNonQuery();
                lbtb.Text = "Them thanh cong";
                txtdecreption.Text = "";
                txtname.Text = "";
                txtprice.Text = "";
                txtids.Text = ""; 
            }
            else 
            {
                
                int a = int.Parse(txtids.Text);
               
                flu.PostedFile.SaveAs(Server.MapPath("~/images/imagebook/")+tenfile);
                SqlCommand cmd = DataAccess.Connection.CreateCommand();
                cmd.CommandText = "update Bookrecipe set Bname=@Bname,price=@price,Description=@Description,Author=@author,Image=@image where BId=@ids";
                cmd.Parameters.AddWithValue("@Bname", txtname.Text);
                cmd.Parameters.AddWithValue("@price", float.Parse(txtprice.Text));
                cmd.Parameters.AddWithValue("@Description",txtdecreption.Text);
                cmd.Parameters.AddWithValue("@author", txtauthor.Text);
                cmd.Parameters.AddWithValue("@image", tenfile);
                cmd.Parameters.AddWithValue("@ids", a);
                cmd.ExecuteNonQuery();
                lbtb.Text = "Sua Thanh Cong....";
                txtdecreption.Text = "";
                txtname.Text = "";
                txtprice.Text = "";
                txtids.Text = "";
                txtauthor.Text = "";
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
        foreach (GridViewRow r in grvbook.Rows)
        {
            CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitem");
            ch.Checked = chkall.Checked;
        }
    }
    protected void loadbook() {

        SqlDataAdapter adt = new SqlDataAdapter("select * from Bookrecipe",DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        grvbook.DataSource = dts;
        grvbook.DataBind();
        }
    protected void ibtsua_Click(object sender, ImageClickEventArgs e)
    {
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
       
            
        ImageButton imt = (ImageButton)sender;
        int a = int.Parse(imt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select * from Bookrecipe where BId='" + a + "'",DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        for (int i = 0; i < dtb.Rows.Count; i++)
        {
            txtname.Text = dtb.Rows[0][1].ToString();
            txtids.Text = dtb.Rows[0][0].ToString();
            txtdecreption.Text = dtb.Rows[0][3].ToString();
            txtauthor.Text = dtb.Rows[0][4].ToString();
            txtprice.Text = dtb.Rows[0][2].ToString();
        }
            lbtb.Text = "";
        pnshow.Visible = false;
        pnthemmoi.Visible = true;
        }
    protected void grvflavor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvbook.PageIndex = e.NewPageIndex;
        loadbook();
    }
    //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    //{

    //}
    protected void grvflavor_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}


