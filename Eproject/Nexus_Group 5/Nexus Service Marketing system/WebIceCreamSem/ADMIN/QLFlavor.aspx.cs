using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;
public partial class Quantri_QLFlavor : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack) {

            loadflavor();
        }
    }
    public void loadflavor() {
        SqlDataAdapter adt = new SqlDataAdapter("select * from Flavor", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        adt.Fill(dts);
        grvflavor.DataSource = dts;
        grvflavor.DataBind();
    }

    protected void ibtthem_Click(object sender, ImageClickEventArgs e)
    {
        pnshow.Visible = false;
        pnthemmoi.Visible = true;
        txtids.Text = "insert";
        lbtb.Text = "";
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {

        try
        {
            string tenfile = "";



            if (txtids.Text.Equals("insert"))
            {

                if (fluimage.HasFile)
                {
                    tenfile = System.IO.Path.GetFileName(fluimage.PostedFile.FileName);

                }
                bool type = false;
                if (chktype.Checked)
                {

                    type = true;
                }
                else { type = false; }



                if (txtids.Text.Equals("insert"))
                {
                    fluimage.PostedFile.SaveAs(Server.MapPath("~/images/imageflavor/") + tenfile);
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "insert into Flavor values (@FProvider,@Address,@phone, @Email, @FName,@FImage,@Ingredient, @Recipe, @TypeFlavor)";
                    cmd.Parameters.AddWithValue("@FProvider", txtprovider.Text);
                    cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                    cmd.Parameters.AddWithValue("@Email", txtmail.Text);
                    cmd.Parameters.AddWithValue("@FName", txtname.Text);
                    cmd.Parameters.AddWithValue("@FImage", tenfile);
                    cmd.Parameters.AddWithValue("@Ingredient", txtingre.Text);
                    cmd.Parameters.AddWithValue("@Recipe", txtrecipe.Text);
                    cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                    cmd.Parameters.AddWithValue("@TypeFlavor", type);
                    lbtb.Text = "Them thanh cong";
                    lbtb.Text = "Them Thanh Cong....";
                    txtingre.Text = "";
                    txtname.Text = "";
                    txtrecipe.Text = "";
                    chktype.Checked = false;
                    tenfile = "";
                    txtphone.Text = "";
                    txtmail.Text = "";
                    txtprovider.Text = "";
                    txtaddress.Text = "";
                    txtids.Text = "";
                    return;

                }
                else
                {
                    fluimage.PostedFile.SaveAs(Server.MapPath("~/images/imageflavor/") + tenfile);
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "update Flavor set FProvider=@FProvider,Address=@Address,phone=@phone,Email= @Email,FName= @FName,FImage=@FImage,Ingredient=@Ingredient,Recipe= @Recipe,TypeFlavor= @TypeFlavor)";
                    cmd.Parameters.AddWithValue("@FProvider", txtprovider.Text);
                    cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                    cmd.Parameters.AddWithValue("@Email", txtmail.Text);
                    cmd.Parameters.AddWithValue("@FName", txtname.Text);
                    cmd.Parameters.AddWithValue("@FImage", tenfile);
                    cmd.Parameters.AddWithValue("@Ingredient", txtingre.Text);
                    cmd.Parameters.AddWithValue("@Recipe", txtrecipe.Text);
                    cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                    cmd.Parameters.AddWithValue("@TypeFlavor", type);
                    lbtb.Text = "Update thanh cong";

                    txtingre.Text = "";
                    txtname.Text = "";
                    txtrecipe.Text = "";
                    chktype.Checked = false;
                    tenfile = "";
                    txtphone.Text = "";
                    txtmail.Text = "";
                    txtprovider.Text = "";
                    txtaddress.Text = "";
                    txtids.Text = "";
                    return;

                }
                
            }
            loadflavor();
        }
        catch (Exception ex)
        {
            lbtb.Text = "Loi...." + ex.Message;
        }
    
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        pnshow.Visible = true;
        pnthemmoi.Visible = false;
        lbtb.Text = "";
    }
    protected void ImageButton4_Click1(object sender, ImageClickEventArgs e)
    {
        pnthemmoi.Visible = false;
        pnshow.Visible = true;
        loadflavor();
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        pnthemmoi.Visible = false;
        pnshow.Visible = true;
        lbtb.Text = "";

    }
    protected void grvflavor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvflavor.PageIndex = e.NewPageIndex;
        loadflavor();
    }
    protected void chkitem_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkall=(CheckBox)sender;
        foreach (GridViewRow r in grvflavor.Rows)
        {
            CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitem");
            ch.Checked=chkall.Checked;
        }

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ibtxoa_Click(object sender, ImageClickEventArgs e)
    {
       
            foreach (GridViewRow r in grvflavor.Rows)
            {
                TextBox t = (TextBox)r.Cells[1].FindControl("txtma");
                CheckBox ch = (CheckBox)r.Cells[0].FindControl("chkitem");
                if (ch.Checked)
                {
                    int ma = Int32.Parse(t.Text);
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "delete from Flavor where FId=@id";
                    cmd.Parameters.AddWithValue("@id", ma);
                    cmd.ExecuteNonQuery();
                }
            
        }
        loadflavor();
    }
   
   
    protected void ibtsua_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imt = (ImageButton)sender;
        int a = int.Parse(imt.CommandArgument);
        SqlCommand cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "delete from Flavor where FId=@id";
        cmd.Parameters.AddWithValue("@id", a);
        cmd.ExecuteNonQuery();
        loadflavor();
    }
    protected void ibtupdate_Click(object sender, ImageClickEventArgs e)
    {
      
      
        ImageButton imt = (ImageButton)sender;
        int a = int.Parse(imt.CommandArgument);
        SqlDataAdapter adt = new SqlDataAdapter("select * from Flavor where FId='" + a + "'", DataAccess.ConnectionString);
        DataTable dtb = new DataTable();
        adt.Fill(dtb);
        for (int i = 0; i < dtb.Rows.Count; i++)
        {
            txtname.Text = dtb.Rows[0][5].ToString();
            txtids.Text = dtb.Rows[0][0].ToString();
            txtprovider.Text = dtb.Rows[0][1].ToString();
            txtphone.Text = dtb.Rows[0][3].ToString();
            txtrecipe.Text = dtb.Rows[0][7].ToString();
            txtingre.Text = dtb.Rows[0][6].ToString();
            if (dtb.Rows[0][8].ToString() == "true")
            {
                chktype.Checked = true;
            }
            else {
                chktype.Checked = false;
            }
            txtmail.Text = dtb.Rows[0][4].ToString();
            txtaddress.Text = dtb.Rows[0][2].ToString();
           
        }
        
        pnshow.Visible = false;
        pnthemmoi.Visible = true;
        }

    protected void ibtthemm_Click(object sender, ImageClickEventArgs e)
   {
        try
        {
            string tenfile = "";



            if (txtids.Text.Equals("insert"))
            {

                if (fluimage.HasFile)
                {
                    tenfile = System.IO.Path.GetFileName(fluimage.PostedFile.FileName);

                }
                bool type = false;
                if (chktype.Checked)
                {

                    type = true;
                }
                else { type = false; }



                if (txtids.Text.Equals("insert"))
                {
                    fluimage.PostedFile.SaveAs(Server.MapPath("~/images/imageflavor/") + tenfile);
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "insert into Flavor values (@FProvider,@Address,@phone, @Email, @FName,@FImage,@Ingredient, @Recipe, @TypeFlavor)";
                    cmd.Parameters.AddWithValue("@FProvider", txtprovider.Text);
                    cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                    cmd.Parameters.AddWithValue("@Email", txtmail.Text);
                    cmd.Parameters.AddWithValue("@FName", txtname.Text);
                    cmd.Parameters.AddWithValue("@FImage", tenfile);
                    cmd.Parameters.AddWithValue("@Ingredient", txtingre.Text);
                    cmd.Parameters.AddWithValue("@Recipe", txtrecipe.Text);
                    cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                    cmd.Parameters.AddWithValue("@TypeFlavor", type);
                    cmd.ExecuteNonQuery();
                    lbtb.Text = "Them Thanh Cong....";
                    txtingre.Text = "";
                    txtname.Text = "";
                    txtrecipe.Text = "";
                    chktype.Checked = false;
                    tenfile = "";
                    txtphone.Text = "";
                    txtmail.Text = "";
                    txtprovider.Text = "";
                    txtaddress.Text = "";
                    txtids.Text = "";
                    return;

                }
                else
                {
                    fluimage.PostedFile.SaveAs(Server.MapPath("~/images/imageflavor/") + tenfile);
                    SqlCommand cmd = DataAccess.Connection.CreateCommand();
                    cmd.CommandText = "update Flavor set FProvider=@FProvider,Address=@Address,phone=@phone,Email= @Email,FName= @FName,FImage=@FImage,Ingredient=@Ingredient,Recipe= @Recipe,TypeFlavor= @TypeFlavor)";
                    cmd.Parameters.AddWithValue("@FProvider", txtprovider.Text);
                    cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                    cmd.Parameters.AddWithValue("@Email", txtmail.Text);
                    cmd.Parameters.AddWithValue("@FName", txtname.Text);
                    cmd.Parameters.AddWithValue("@FImage", tenfile);
                    cmd.Parameters.AddWithValue("@Ingredient", txtingre.Text);
                    cmd.Parameters.AddWithValue("@Recipe", txtrecipe.Text);
                    cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                    cmd.Parameters.AddWithValue("@TypeFlavor", type);
                    cmd.ExecuteNonQuery();
                    lbtb.Text = "Update thanh cong";

                    txtingre.Text = "";
                    txtname.Text = "";
                    txtrecipe.Text = "";
                    chktype.Checked = false;
                    tenfile = "";
                    txtphone.Text = "";
                    txtmail.Text = "";
                    txtprovider.Text = "";
                    txtaddress.Text = "";
                    txtids.Text = "";
                    return;

                }

            }
            loadflavor();
        }
        catch (Exception ex)
        {
            lbtb.Text = "Loi...." + ex.Message;
        }
    }
    protected void ibtback_Click(object sender, ImageClickEventArgs e)
    {
        pnshow.Visible = true;
        pnthemmoi.Visible = false;
        loadflavor();
    }
}