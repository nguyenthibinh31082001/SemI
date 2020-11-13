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

public partial class login : System.Web.UI.Page
{
   
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable("Employee");
    LoginWeb objLogin = new LoginWeb();
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList();
        if ((bool)Session["isLogin"]==true)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
        else
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
    }

    private void DropDownList()
    {
        //SqlDataAdapter adt = new SqlDataAdapter("select ID from CountID", DataAccess.ConnectionString);
        //DataSet dts = new DataSet();
        //adt.Fill(dts);
        //drplan1.DataSource = dts;
        //drplan1.DataValueField = "ID";
        ////drplan1.DataTextField = "CountMember";
        //drplan1.DataBind();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        //DataTable dt = objLogin.CheckLogin(txtUserName.Text.Trim(), txtPassword.Text.Trim());
        //string user = txtUserName.Text;
        //string pass = txtPassword.Text;
       // string role = drplan1.Text;
        SqlCommand cmd = DataAccess.Connection.CreateCommand();
        cmd.CommandText = "select * from Employee where EmployeeName=@userName and Identification=@password ";//and EmployeeRole=@role
        cmd.Parameters.AddWithValue("@userName", txtUserName.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        //cmd.Parameters.AddWithValue("@role", drplan1.Text);
        //cmd.Parameters.AddWithValue("@role", role);
        da.SelectCommand=cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            Session["isLogin"] = true;
            Session["role"] = dt.Rows[0][10].ToString();
            Session["password"] = dt.Rows[0][2].ToString();
            Session["idlogin"]=dt.Rows[0][0].ToString();
            Session["userName"] = dt.Rows[0][1].ToString();
            if (Session["url"] != null)
                Response.Redirect(Session["url"].ToString());
            else
                Response.Redirect("MainPage.aspx");
           
        }
        else
        {
            Session["isLogin"] = false;
            lblLoginFail.Visible = true;
        }
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {
        if (Session["userName"].ToString() != "")
        {
            Session["userName"] = "";
            Session["isLogin"] = false;
            Session["role"] = "";
            Session["url"] = null;
            Response.Redirect("MainPage.aspx");
        }
    }
}
