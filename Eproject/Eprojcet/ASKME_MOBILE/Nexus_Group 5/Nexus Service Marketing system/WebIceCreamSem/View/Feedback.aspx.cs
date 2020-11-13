using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class View_Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadFeedback();
        }
    }
    //
    private void LoadFeedback()
    {
        SqlDataAdapter da = new SqlDataAdapter("select top 15 * from FEEDBACK order by FEEDBACK.FBId DESC", DataAccess.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);

        dtlistFeedback.DataSource = ds.Tables[0];
        dtlistFeedback.DataBind();
    }
    //
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string name = txtname.Text;
        string address = txtaddress.Text;
        string phone = txtphone.Text;
        string email = txtemail.Text;
        string title = txttitle.Text;
        string content = txtcontent.Text;
        string date = DateTime.Now.ToString();

        try
        {
            if(name==""){
                lbfeedback.Text = "Enter your name";
            } 
            else if(address==""){
                lbfeedback.Text = "Enter your address";
            }
            else if (phone == "")
            {
                lbfeedback.Text = "Enter your phone";
            }
            else if (email == "")
            {
                lbfeedback.Text = "Enter your email";
            }
            else if (title == "")
            {
                lbfeedback.Text = "Enter feedback title";
            }
            else if (content == "")
            {
                lbfeedback.Text = "Enter content ";
            }
            else{
            SqlCommand cmd = DataAccess.Connection.CreateCommand();
            cmd.CommandText = "Insert into FEEDBACK values(@name, @address, @phone, @email, @title, @content,@date, @status)";
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@content", content);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@status", 0);

            cmd.ExecuteNonQuery();
            lbfeedback.Text = "Thanks for comment";
            Reset();
            LoadFeedback();
            //   loadflavor();
            //  LoadBook();
          //  Response.Redirect("Home.aspx");
            }
        }
        catch (Exception ex)
        {
            lbfeedback.Text = "Fail" + ex.Message;
        }
    }
         // reset
    public void Reset() {
        txtname.Text = "";
        txtaddress.Text = "";
        txtphone.Text = "";
        txtemail.Text = "";
        txttitle.Text = "";
        txtcontent.Text = "";
        lbfeedback.Text = "";
    }

    //
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Reset();
    }
}