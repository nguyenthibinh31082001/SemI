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

public partial class login : System.Web.UI.Page
{
    LoginWeb objLogin = new LoginWeb();
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataTable dt = objLogin.CheckLogin(txtUserName.Text.Trim(), txtPassword.Text.Trim());
        if (dt.Rows.Count > 0)
        {
            Session["isLogin"] = true;
            Session["Role"] = dt.Rows[0][2].ToString();
            Session["userName"] = dt.Rows[0][0].ToString();
            Session["password"] = dt.Rows[0][1].ToString();
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
