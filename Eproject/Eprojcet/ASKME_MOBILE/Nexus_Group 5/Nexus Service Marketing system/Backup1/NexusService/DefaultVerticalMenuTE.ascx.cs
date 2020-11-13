using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class VMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"].ToString() != "")
        {
            lblHello.Text = "Welcome: " + Session["userName"].ToString();
            lbtnLogout.Text = "Logout";
        }
        else
        {
            lblHello.Text = "";
            lbtnLogout.Text = "Login";
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
            Response.Redirect("MainPage.aspx", false);
        }
        else
            Server.Transfer("Login.aspx");
    }
}
