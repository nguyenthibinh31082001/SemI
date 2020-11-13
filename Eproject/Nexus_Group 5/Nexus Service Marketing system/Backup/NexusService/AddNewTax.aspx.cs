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

public partial class AddNewTax : System.Web.UI.Page
{
    Tax_BL objTax = new Tax_BL();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("Admin")))
            Response.Redirect("NotAccess.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("TaxManagement.aspx");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if(objTax.InsertTax(txtName.Text,float.Parse(txtValue.Text),txtDescription.Text)>0)
            Response.Redirect("TaxManagement.aspx");
    }
}
