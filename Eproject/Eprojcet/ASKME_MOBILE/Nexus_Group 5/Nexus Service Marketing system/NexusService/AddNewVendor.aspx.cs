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

public partial class AddNewVendor : System.Web.UI.Page
{
    Vendor_BL objVendor = new Vendor_BL();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("Admin")))
            Response.Redirect("NotAccess.aspx");
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        if (objVendor.InsertVendor(txtID.Text, txtName.Text, txtAddress.Text, txtPhone.Text, txtFAX.Text) > 0)
        {
            Response.Redirect("VendorManagement.aspx");
        }
        else
            Response.Write("<script>alert('You cannot add new because primary key is already!')</script>");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("VendorManagement.aspx");
    }
}
