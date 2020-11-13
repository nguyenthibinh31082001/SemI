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

public partial class CreateConnection : System.Web.UI.Page
{
    Common objCommon = new Common();
    SendMail objSend = new SendMail();
    Technical_BL objTechnical = new Technical_BL();
    //static int count;
    static string orderID;
    string customerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("Technician")))
            Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            ddlCity.DataSource = objCommon.ddlCity();
            ddlCity.DataBind();
            ddlDistrict.DataSource = objCommon.ddlDistrict(ddlCity.SelectedValue);
            ddlDistrict.DataBind();
        }
        // MultiView1.ActiveViewIndex = 0;
        orderID = Session["orderID"].ToString();
        txtOrderID.Text = orderID;
    }
    protected void CreateCusID()
    {
        string subID = orderID.Substring(1, 10);
        string str = "";
        for (int i = 0; i < 12 - subID.Length; i++)
        {
            str += "0";
        }
        if (orderID.Substring(0, 1) == "D")
        {
            customerID = "D" + ddlDistrict.SelectedValue.ToString() + str + subID;
        }
        if (orderID.Substring(0, 1) == "B")
        {
            customerID = "B" + ddlDistrict.SelectedValue.ToString() + str + subID;
        }
        if (orderID.Substring(0, 1) == "T")
        {
            customerID = "T" + ddlDistrict.SelectedValue.ToString() + str + subID;
        }
        txtCusID.Text = customerID;
    }
    protected void ddlDistrict_Load(object sender, EventArgs e)
    {
        try
        {
            CreateCusID();
        }
        catch (Exception)
        {
        }
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        //objTechnical.UpdateCountCustomer(count + 1);
        objTechnical.InsertCustomer(txtCusID.Text, txtCusName.Text, txtIdentification.Text, deBirthday.Date,
            ddlSex.SelectedValue.ToString(), txtAddress.Text, ddlDistrict.Text,
            ddlCity.Text, txtEmail.Text, txtPhone.Text, txtOrderID.Text);
        objCommon.InsertMember(txtCusID.Text, txtCusID.Text, "Customer");

        string body = "Dear : " + txtCusName.Text + " !<Br/>Thank you for use service of NEXUS !<Br/>Your account at Nexus Service was created successfully.<Br/>Please login system and change your password <br/>" +
               "UserName: " + txtCusID.Text + "<Br/>" +
               "Password: " + txtCusID.Text  + "<Br/> Thank you !";
            string subject = "[NEXUS] Thank you  for use our service !";

            objSend.SendMailToCustomer("nexusgruop1@gmail.com", txtEmail.Text, subject, body);

        int countIdentification = objTechnical.CountIdentification(txtIdentification.Text);
        objTechnical.UpdateQuantity(countIdentification, txtIdentification.Text);
       // objTechnical.InsertMember(txtCusID.Text, txtIdentification.Text);
        objTechnical.UpdateOrders(orderID, txtCusID.Text);
        objTechnical.InsertConnection(orderID, ddlConnectionStatus.SelectedValue.ToString());
        Response.Redirect("ViewOrders.aspx");
    }


 
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        Response.Redirect("ViewOrders.aspx");
    }
    protected void ddlCity_Load(object sender, EventArgs e)
    {
            
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
            ddlDistrict.DataSource = objCommon.ddlDistrict(ddlCity.SelectedValue);
            ddlDistrict.DataBind();
            CreateCusID();
    }
}
