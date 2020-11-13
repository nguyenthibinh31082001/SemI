using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Quantri_QLOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            loadorders();
            loaddacheck();
        }
    }
   
    protected void loadorders() {

        string sql = "select ORDERS.*, Bookrecipe.Bname from Bookrecipe inner join ORDERS on ORDERS.BIb=Bookrecipe.BId where ORDERS.Status=0";
        SqlDataAdapter adt = new SqlDataAdapter(sql, DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        grvorderchuacheck.DataSource = dts;
        grvorderchuacheck.DataBind();
    }


    protected void Pageindex_changing(object sender, GridViewPageEventArgs e)
    {
        grvorderchuacheck.PageIndex = e.NewPageIndex;
        loadorders();
    }
    protected void chkalldacheck_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
      
            foreach(GridViewRow r in grvdacheck.Rows)
            {
                CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitemdacheck");
                ch.Checked = chk.Checked;
            }
            
        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
       
          
            foreach (GridViewRow r in grvdacheck.Rows)
            {
                TextBox tx = (TextBox)r.Cells[1].FindControl("txtmadacheck");
                int ma = int.Parse(tx.Text);
                CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitemdacheck");
                if (ch.Checked)
                {
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "delete from Orders where OId=@id";
                    cmd.Parameters.AddWithValue("@id", ma);
                    cmd.ExecuteNonQuery();
                }
            }
            loadorders();
            loaddacheck();
    }
    protected void chkallchuacheck_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
     
            foreach (GridViewRow r in grvorderchuacheck.Rows)
            {
                CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitemchuacheck");
                ch.Checked = chk.Checked;
            }

        
    }
    protected void ibtcheck_Click(object sender, ImageClickEventArgs e)
    {
       
           
            foreach (GridViewRow r in grvorderchuacheck.Rows)
            {
                TextBox tx = (TextBox)r.Cells[1].FindControl("txtmachuacheck");
               
                CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitemchuacheck");
                if (ch.Checked)
                {
                    int ma = int.Parse(tx.Text);
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "update Orders set status=1 where OId =@ids";
                    cmd.Parameters.AddWithValue("@ids", ma);
                    cmd.ExecuteNonQuery();
                }
            }
            loaddacheck();
            loadorders();
        
    }
    protected void loaddacheck() {
        SqlDataAdapter adt = new SqlDataAdapter("select * from Orders where Status=1",DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        grvdacheck.DataSource = dts;
        grvdacheck.DataBind();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        pndacheck.Visible = true;
        pnshow.Visible = false;
        pnchitiet.Visible = false;
    }
    protected void ibtback_Click(object sender, ImageClickEventArgs e)
    {
        pnshow.Visible = true;
        pndacheck.Visible = false;
        pnchitiet.Visible = false;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        pndacheck.Visible = false; pnshow.Visible = true;
        pnchitiet.Visible = false;
    }
    protected void ibtchitiet_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = new ImageButton();
        int ma = int.Parse(ibt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select ORDERS.*, Bookrecipe.Bname from Bookrecipe inner join ORDERS on ORDERS.BIb=Bookrecipe.BId where ORDERS.Status=0", DataAccess.ConnectionString);
        DataTable dts = new DataTable();
        adt.Fill(dts);
        for (int i = 0; i < dts.Rows.Count; i++)
        { 
            txtaddress.Text=dts.Rows[0][6].ToString();
            txtcontact.Text=dts.Rows[0][7].ToString();
            txtcost.Text=dts.Rows[0][8].ToString();
            txtcuname.Text=dts.Rows[0][2].ToString();
            txtdatedeliver.Text=dts.Rows[0][10].ToString();
            txtdateorder.Text = dts.Rows[0][9].ToString();
            txtphone.Text = dts.Rows[0][3].ToString();
            txtids.Text = dts.Rows[0][0].ToString();
            txtpayoption.Text = dts.Rows[0][8].ToString();
            txtbookname.Text = dts.Rows[0][11].ToString();
        }
    }
    protected void ibtupdatea_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibt = new ImageButton();
        int ma = int.Parse(ibt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select ORDERS.*, Bookrecipe.Bname from Bookrecipe inner join ORDERS on ORDERS.BIb=Bookrecipe.BId where ORDERS.OId='"+ma+"'", DataAccess.ConnectionString);
        DataTable dts = new DataTable();
        adt.Fill(dts);
        for (int i = 0; i < dts.Rows.Count; i++)
        {
            txtaddress.Text = dts.Rows[0][6].ToString();
            txtcontact.Text = dts.Rows[0][7].ToString();
            txtcost.Text = dts.Rows[0][8].ToString();
            txtcuname.Text = dts.Rows[0][2].ToString();
            txtdatedeliver.Text = dts.Rows[0][10].ToString();
            txtdateorder.Text = dts.Rows[0][9].ToString();
            txtphone.Text = dts.Rows[0][3].ToString();
            txtids.Text = dts.Rows[0][0].ToString();
            txtpayoption.Text = dts.Rows[0][8].ToString();
            txtbookname.Text = dts.Rows[0][11].ToString();
        }
    }
}