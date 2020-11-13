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

public partial class ManagementBills : System.Web.UI.Page
{
    Sorting objSort = new Sorting();
    Accountant_BL objAccount = new Accountant_BL();
    static int Month;
    static int Year;
    static int connectionID;
    static string orderID = "";
    float amount;
    float total;
    float tax;
    int minute;
    float callcharge;
    float messageCharge;
    float message;
    bool billStatus;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (!(Session["role"].ToString().Equals("Accountant")))
            Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            GridView1.DataSource = objAccount.LoadConnections();
            GridView1.DataBind();
            ddlTax.DataSource = objAccount.LoadTax();
            ddlTax.DataBind();
        }

        pnlBillDetails.Visible = false;
        pnlLandLine.Visible = false;
    }
    protected void btnCreateBill_Click(object sender, EventArgs e)
    {
        if (radUnpaid.Checked)
        {
            billStatus = false;
        }
        else if (radPaid.Checked)
        {
            billStatus = true;
        }
        try
        {
            objAccount.InsertBill(Month, Year, connectionID, lblCusID.Text, billStatus, float.Parse(lblAmount.Text), int.Parse(ddlTax.SelectedValue.ToString()), float.Parse(lblTotal.Text));
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Bill created in this month. Please choose another month')</script>");
        }
    }
    protected void deMonthYear_DateChanged(object sender, EventArgs e)
    {
        
    }

    protected void LocalPlan()
    {
        DataTable tableChargeType = objAccount.LoadLandLineCallCharge(orderID);
        lblMessage.Visible = false;
        lblMessageValue.Visible = false;
        lblMessages.Visible = false;
        txtMessage.Visible = false;
        lblCallChargeValue.Visible = true;
        lblChargeTypeValue.Text = tableChargeType.Rows[0][0].ToString();
        lblCallChargeValue.Text = tableChargeType.Rows[0][1].ToString();
        amount = float.Parse(lblAmount.Text);
        tax = float.Parse(ddlTax.SelectedItem.Text);
        minute = int.Parse(txtMinute.Text);
        callcharge = float.Parse(lblCallChargeValue.Text);
        total = ((((minute * callcharge) + amount) * tax) / 100) + (amount + (minute * callcharge));
    }
    protected void STDPlan()
    {
        lblMessage.Visible = true;
        lblMessageValue.Visible = true;
        lblMessages.Visible = true;
        txtMessage.Visible = true;
        DataTable tableChargeType = objAccount.LoadLandLineCallCharge(orderID);
        lblChargeTypeValue.Text = tableChargeType.Rows[0][0].ToString();
        lblCallChargeValue.Text = tableChargeType.Rows[0][1].ToString();
        lblMessageValue.Text = tableChargeType.Rows[0][2].ToString();
        amount = float.Parse(lblAmount.Text);
        tax = float.Parse(ddlTax.SelectedItem.Text);
        minute = int.Parse(txtMinute.Text);
        callcharge = float.Parse(lblCallChargeValue.Text);
        messageCharge = float.Parse(lblMessageValue.Text);
        message = int.Parse(txtMessage.Text);
        total = (amount + minute * callcharge + message * messageCharge) * tax / 100 + amount + minute * callcharge + message * messageCharge;

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (objAccount.LoadConnectionStatus(GridView1.SelectedValue.ToString()) == "Active")
        {
            orderID = GridView1.SelectedValue.ToString();
            pnlBillDetails.Visible = true;
            DataTable tablePlan = objAccount.LoadPlanDetails(GridView1.SelectedValue.ToString());
            DataTable tableBill = objAccount.LoadCustomerDetails(GridView1.SelectedValue.ToString());
            connectionID = int.Parse(tableBill.Rows[0][6].ToString());
            lblCusID.Text = tableBill.Rows[0][0].ToString();
            lblCusName.Text = tableBill.Rows[0][1].ToString();
            lblEmail.Text = tableBill.Rows[0][2].ToString();
            lblAddress.Text = tableBill.Rows[0][3].ToString();
            lblDistrict.Text = tableBill.Rows[0][4].ToString();
            lblCity.Text = tableBill.Rows[0][5].ToString();
            lblPlan.Text = tablePlan.Rows[0][0].ToString();
            lblPackage.Text = tablePlan.Rows[0][1].ToString();
            lblDuration.Text = tablePlan.Rows[0][2].ToString();
            lblAmount.Text = tablePlan.Rows[0][3].ToString();
            if (orderID.Substring(0, 1) == "T")
            {
                pnlLandLine.Visible = true;
                if (lblPackage.Text == "Local Plan" && lblDuration.Text == "Unlimited" || lblDuration.Text == "Monthly Plan")
                {
                    LocalPlan();
                }
                else if (lblPackage.Text == "STD Plan" && lblDuration.Text == "Monthly" || lblDuration.Text == "Half - Yearly" || lblDuration.Text == "Year")
                {
                    STDPlan();
                }
            }
            else
            {
                amount = float.Parse(tablePlan.Rows[0][3].ToString());
                tax = float.Parse(ddlTax.SelectedItem.Text);
                total = float.Parse(lblAmount.Text) + ((float.Parse(lblAmount.Text)) * (float.Parse(ddlTax.SelectedItem.Text))) / 100;
            }
            lblTotal.Text = total.ToString();
        }
        else
        {
            Response.Write("<script>alert('Connection Status must be Active')</script>");
        }

    }

    protected void ddlTax_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlBillDetails.Visible = true;
        if (orderID.Substring(0, 1) == "T")
        {
            pnlLandLine.Visible = true;
            if (lblPackage.Text == "Local Plan" && lblDuration.Text == "Unlimited" || lblDuration.Text == "Monthly Plan")
            {
                LocalPlan();
            }
            else if (lblPackage.Text == "STD Plan" && lblDuration.Text == "Monthly" || lblDuration.Text == "Half - Yearly" || lblDuration.Text == "Year")
            {
                STDPlan();
            }
        }
        else
        {
            total = float.Parse(lblAmount.Text) + ((float.Parse(lblAmount.Text)) * (float.Parse(ddlTax.SelectedItem.Text))) / 100;
        }
        lblTotal.Text = total.ToString();
    }

    protected void txtMinute_TextChanged(object sender, EventArgs e)
    {
        try
        {
             pnlBillDetails.Visible = true;
        if (orderID.Substring(0, 1) == "T")
        {
            pnlLandLine.Visible = true;
            if (lblPackage.Text == "Local Plan" && lblDuration.Text == "Unlimited" || lblDuration.Text == "Monthly Plan")
            {
                LocalPlan();
            }
            else if (lblPackage.Text == "STD Plan" && lblDuration.Text == "Monthly" || lblDuration.Text == "Half - Yearly" || lblDuration.Text == "Year")
            {
                STDPlan();
            }
        }
        else
        {
            total = float.Parse(lblAmount.Text) + ((float.Parse(lblAmount.Text)) * (float.Parse(ddlTax.SelectedItem.Text))) / 100;
        }
        lblTotal.Text = total.ToString();
        }
        catch (Exception)
        {
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = objAccount.LoadConnections();
        GridView1.DataBind();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objAccount.LoadConnections());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        GridView1.DataSource = dataView;
        GridView1.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pnlBillDetails.Visible = false;
        GridView1.DataSource = objAccount.LoadConnections();
        GridView1.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        pnlBillDetails.Visible = false;
        GridView1.DataSource = objAccount.SearchConnection(txtSearch.Text);
        GridView1.DataBind();
    }
    protected void deMonthYear_DateChanged1(object sender, EventArgs e)
    {
        Month = (int)deMonthYear.Date.Month;
        Year = (int)deMonthYear.Date.Year;
    }
}
