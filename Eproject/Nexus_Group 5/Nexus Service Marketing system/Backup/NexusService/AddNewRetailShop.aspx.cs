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
using System.Net.Mail;
using System.Net;

public partial class Admin_ADD : System.Web.UI.Page
{
    Common objCommon = new Common();
    RetailsShop_BL objRetail = new RetailsShop_BL();
    SendMail objSendMail = new SendMail();
    static int count;
    static string password;
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.MaintainScrollPositionOnPostBack = true;
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("Admin")))
            Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            count = objCommon.CountID("RetailShop");
            ddlCity.DataSource = objCommon.ddlCity();
            ddlCity.DataBind();
                string name = "RTS";
                for (int i = 0; i < 4 - (count + 1).ToString().Length; i++)
                {
                  name += "0";
                }
               txtUserName.Text = name + (count + 1).ToString();
        }

    }
    protected void ddlCity_Load(object sender, EventArgs e)
    {
        ddlDistrict.DataSource = objCommon.ddlDistrict(ddlCity.SelectedValue);
        ddlDistrict.DataBind();
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        
        int result = objRetail.InsertRetailsShop(txtUserName.Text, txtName.Text, txtAddress.Text, ddlDistrict.SelectedItem.ToString(), ddlCity.SelectedItem.ToString(), txtEmail.Text, txtPhone.Text);
        if (result > 0)
        {
            objCommon.updateID(count + 1, "RetailShop");
            objCommon.InsertMember(txtUserName.Text, txtUserName.Text, "RetailShop");
            string body = "Dear : " + txtName.Text + " !<Br/>Thank you for use service of NEXUS !<Br/>Your account at Nexus Service was created successfully.<Br/>Please login system and change your password <br/>" +
               "UserName: " + txtUserName.Text + "<Br/>" +
               "Password: " + txtUserName.Text + "<Br/> Thank you !";
            string subject = "[NEXUS] Thank you  for use our service !";
            Response.Write("<script>alert('Add New Retail Shop successfully!')</script>");
            objSendMail.SendMailToCustomer("nexusgruop1@gmail.com", txtEmail.Text, subject, body);
            Server.Transfer("RetailShopManagement.aspx");
        }
        else
        {
            Response.Write("<script>alert('Add New Retail Shop failed !')</script>");
        }
        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}
