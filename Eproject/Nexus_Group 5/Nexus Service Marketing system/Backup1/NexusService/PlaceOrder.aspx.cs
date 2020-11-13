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

public partial class PlaceOrder : System.Web.UI.Page
{
    Broker_BL objBroker = new Broker_BL();
    string orderID = "";
    static int count;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("RetailShop")))
            Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            mtvPlaceOrder.ActiveViewIndex = 0;
            radPlans.DataSource = objBroker.LoadPlans();
            radPlans.DataBind();
            pnlConTypes.Visible = false;
            pnlPackages.Visible = false;
        }
    }
    protected void radPlans_SelectedIndexChanged(object sender, EventArgs e)
    {
        radDialUpType.Items.Clear();
        radDialUpType.DataSource = objBroker.LoadPlanTypes(radPlans.SelectedItem.ToString(), radPlans.SelectedValue);
        radDialUpType.DataBind();
        radPackage.Items.Clear();
        lbDeposit.Text = objBroker.LoadDeposit(radPlans.SelectedValue.ToString()).Rows[0][0].ToString();

        pnlConTypes.Visible = true;
        pnlPackages.Visible = false;
    }
    protected void radDialUpType_SelectedIndexChanged(object sender, EventArgs e)
    {
        radPackage.Items.Clear();
        radPackage.DataSource = objBroker.LoadConnectionTypes(radPlans.SelectedValue, radDialUpType.SelectedItem.ToString());
        radPackage.DataBind();
        ddlEquipment.DataSource = objBroker.LoadEquipment();
        ddlEquipment.DataBind();
        pnlPackages.Visible = true;

    }
    protected void radDuration_Load(object sender, EventArgs e)
    {
        if (radPlans.SelectedValue == "1")
        {
            radPackage.DataValueField = "BroadBandID";
        }
        else if (radPlans.SelectedValue == "2")
        {
            radPackage.DataValueField = "DialUpID";
        }
        else if (radPlans.SelectedValue == "3")
        {
            radPackage.DataValueField = "LandLineID";

        }
    }
    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        string connectionTypeID = objBroker.LoadConnectionTypeID(radPackage.SelectedValue).ToString();
        objBroker.UpdateCountID(count);
        string empID = Session["userName"].ToString();
        double deposit = (double)objBroker.LoadDeposit(radPlans.SelectedValue).Rows[0][0];
        objBroker.InsertOrder(lbOrderID.Text, empID, ddlEquipment.SelectedValue.ToString(), connectionTypeID, deposit);
        Response.Redirect("ViewOrders.aspx");

    }
    protected void btnPlace_Click(object sender, EventArgs e)
    {
        mtvPlaceOrder.ActiveViewIndex = 1;
        count = objBroker.LoadCountID();
        string str = "";
        for (int i = 0; i < 10 - (count + 1).ToString().Length; i++)
        {
            str += "0";
        }
        if (radPlans.SelectedItem.ToString().Equals("DialUp"))
        {
            orderID = "D" + str + (count + 1).ToString();
            lbOrderID.Text = orderID.ToString();
        }
        else if (radPlans.SelectedItem.ToString().Equals("BroadBand"))
        {
            orderID = "B" + str + (count + 1).ToString();
            lbOrderID.Text = orderID.ToString();
        }
        else if (radPlans.SelectedItem.ToString().Equals("LandLine"))
        {
            orderID = "T" + str + (count + 1).ToString();
            lbOrderID.Text = orderID.ToString();
        }
        lbPlan.Text = radPlans.SelectedItem.ToString();
        lbDeposit2.Text = objBroker.LoadDeposit(radPlans.SelectedValue.ToString()).Rows[0][0].ToString();
        lbConType.Text = radDialUpType.SelectedItem.ToString();
        lbPackage.Text = radPackage.SelectedItem.ToString();
        lbEquipment.Text = ddlEquipment.SelectedItem.ToString();

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        mtvPlaceOrder.ActiveViewIndex = 0;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
}
