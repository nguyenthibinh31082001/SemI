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

public partial class ViewBill : System.Web.UI.Page
{

    Sorting objSort = new Sorting();
    Common objCommon = new Common();
    int year2;
    string customerID2="";
    static int month;
    static int year;
    static string customerID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        if (Session["role"].ToString().Equals("Technician"))
            Response.Redirect("NotAccess.aspx");
        if (Session["role"].ToString().Equals("Customer"))
        {
            pnlViewBill2.Visible = true;
            pnlViewBill1.Visible = false;
            grvCusView.DataSource = objCommon.LoadBillsCustomer(Session["userName"].ToString());//
            grvCusView.DataBind();
            btnPay.Visible = false;
        }
        if (!IsPostBack)
        {
            for (int i = 1; i < 13; i++)
        {
            ddlMonth.Items.Add(i.ToString());
        }
        for (int i = 2010; i < 2021; i++)
        {
            ddlYear.Items.Add(i.ToString());
        }

            grvViewBills.DataSource = objCommon.LoadBills();
            grvViewBills.DataBind();
        }
        DetailsView1.Visible = false;
        btnBack.Visible = false;
        Checked(false);
        btnOK.Visible = false;
        lbtnUpdateBill.Visible = false;
    }
    protected void grvViewBills_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.Visible = true;
        btnBack.Visible = true;
        DetailsView1.DataSource = objCommon.LoadBillDetailsCustomer(customerID2,int.Parse(grvViewBills.SelectedValue.ToString()), year2);
        DetailsView1.DataBind();
        if (Session["role"].ToString().Equals("Accountant"))
        {
            lbtnUpdateBill.Visible = true;
        }
        DataTable tableBillsDetails = objCommon.LoadBillDetailsCustomer(customerID2, int.Parse(grvViewBills.SelectedValue.ToString()), year2);
        string check = tableBillsDetails.Rows[0][3].ToString();
        month=int.Parse(tableBillsDetails.Rows[0][0].ToString());
        year = int.Parse(tableBillsDetails.Rows[0][1].ToString());
        customerID = tableBillsDetails.Rows[0][2].ToString();
        if (check=="True")
        {
            chkBillStatus.Checked = true;
            lbtnUpdateBill.Visible = false;
        }
        else
        {
            chkBillStatus.Checked = false;
            if (Session["role"].ToString().Equals("Accountant"))
            {
                lbtnUpdateBill.Visible = true;
            }
        }

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        DetailsView1.Visible = false;
        btnBack.Visible = false;
        grvViewBills.DataSource = objCommon.SearchBillCustomerID(txtSearhBills.Text);
        grvViewBills.DataBind();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        grvViewBills.DataSource = objCommon.LoadBills();
        grvViewBills.DataBind();
        btnBack.Visible = false;
    }
    protected void grvViewBills_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvViewBills.PageIndex = e.NewPageIndex;
        grvViewBills.DataSource = objCommon.LoadBills();
        grvViewBills.DataBind();
    }
    protected void grvViewBills_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objCommon.LoadBills());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        grvViewBills.DataSource = dataView;
        grvViewBills.DataBind();
    }
    public void Checked(bool check)
    {
        lblBillStatus.Visible = check;
        chkBillStatus.Visible = check;
    }
    protected void btnSearchDate_Click(object sender, EventArgs e)
    {
        DetailsView1.Visible = false;
        btnBack.Visible = false;
        grvViewBills.DataSource = objCommon.SearchBillDate(int.Parse(ddlMonth.Text), int.Parse(ddlYear.Text));
        grvViewBills.DataBind();
    }
    protected void lbtnUpdateBill_Click(object sender, EventArgs e)
    {
        
        Checked(true);
        DetailsView1.Visible = true;
        btnBack.Visible = true;
        btnOK.Visible = true;
        
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
       string pay ="";
        if (chkBillStatus.Checked)
	    {
    		 pay="True";
	    }
        else
        {
            pay = "False";
        }
        objCommon.UpdateBillStatus(pay, month, year, customerID);
        grvViewBills.DataSource = objCommon.LoadBills();
        grvViewBills.DataBind();
    }
    protected void grvCusView_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnPay.Visible = true;
        DataTable tableViewBillsCus = objCommon.LoadBillDetails(Session["userName"].ToString());
        DetailsView2.DataSource = objCommon.LoadBillDetailsCustomer(Session["userName"].ToString(), int.Parse(grvCusView.SelectedValue.ToString()), year2);
        DetailsView2.DataBind();
    }
    protected void grvCusView_Sorted(object sender, EventArgs e)
    {

    }
    protected void grvCusView_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
         year2 =int.Parse(grvCusView.Rows[e.NewSelectedIndex].Cells[2].Text);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DetailsView2.Visible = false;
        btnPay.Visible = false;
        grvCusView.DataSource = objCommon.LoadBillsCustomer(Session["userName"].ToString());//
        grvCusView.DataBind();
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        Response.Redirect("PayBill.aspx");
    }
    protected void grvViewBills_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        year2 = int.Parse(grvViewBills.Rows[e.NewSelectedIndex].Cells[2].Text);
        customerID2 = grvViewBills.Rows[e.NewSelectedIndex].Cells[3].Text;
    }
}
