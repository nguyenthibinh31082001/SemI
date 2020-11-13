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
public partial class AddNewEmployee : System.Web.UI.Page
{
    static int count;
    Employee_BL objEmp = new Employee_BL();
    Common objCommon = new Common();
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
            count = objCommon.CountID("Employee");

            ddlCity.DataSource = objCommon.ddlCity();
            ddlCity.DataBind();
            ddlRetailsShop.DataSource = objCommon.ddlRetailsShop();
            ddlRetailsShop.DataBind();

        }
    }
    protected void ddlRole_Load(object sender, EventArgs e)
    {
        string role = ddlRole.SelectedValue;
        for (int i = 0; i < 4 - (count + 1).ToString().Length; i++)
        {
            role += "0";
        }
        txtUserName.Text = role + (count + 1).ToString();
    }
    protected void ddlCity_Load(object sender, EventArgs e)
    {
        try
        {
            ddlDistrict.DataSource = objCommon.ddlDistrict(ddlCity.SelectedValue);
            ddlDistrict.DataBind();
        }
        catch (Exception)
        {
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            int result = objEmp.InsertEmployee(txtUserName.Text, txtName.Text,txtIden.Text, txtDate.Text, ddlSex.SelectedValue, txtAddress.Text, ddlDistrict.SelectedItem.ToString(),
            ddlCity.SelectedItem.ToString(), txtEmail.Text, txtPhone.Text, ddlRole.SelectedItem.ToString(), ddlRetailsShop.SelectedValue, DateTime.Now.ToShortDateString());
        if (result > 0)
        {
            objCommon.InsertMember(txtUserName.Text,txtUserName.Text, ddlRole.SelectedItem.ToString());
            objCommon.updateID(count + 1, "Employee");

            string body = "Dear : " + txtName.Text + " !<Br/>Thank you for use service of NEXUS !<Br/>Your account at Nexus Service was created successfully.<Br/>Please login system and change your password <br/>" +
               "UserName: " + txtUserName.Text + "<Br/>" +
               "Password: " + txtUserName.Text + "<Br/> Thank you !";
            string subject = "[NEXUS] Thank you  for use our service !";
            SendMail objSendMail = new SendMail();
            objSendMail.SendMailToCustomer("nexusgruop1@gmail.com", txtEmail.Text, subject, body);
            Response.Write("<script>alert('Add New Employee successfully!')</script>");
        }
        else
        {
            Response.Write("<script>alert('Add New Employee failed !')</script>");
        }
        Response.Redirect("EmployeeManagement.aspx", false);
        }
        catch (Exception)
        {
        }
        
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if ((DateTime.Now.Year - ((DateTime)txtDate.Value).Year) < 18)
            args.IsValid = false;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeManagement.aspx");
    }
}
