using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class funtionleft : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbtQLnguoidung_Click(object sender, EventArgs e)
    {
        
        LinkButton lbt = (LinkButton)sender;
        string strname = lbt.ID.Substring(3, lbt.ID.Length - 3);
        Response.Redirect(strname + ".aspx");
    }
}