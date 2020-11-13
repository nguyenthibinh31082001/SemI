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

public partial class VendorManagement : System.Web.UI.Page
{
    Vendor_BL objVendor = new Vendor_BL();
    Sorting objSort = new Sorting();
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
            gvVendor.DataSource = objVendor.DisplayVendor();
            gvVendor.DataBind();
        }
    }


    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewVendor.aspx");
    }


    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        gvVendor.SelectedIndex = -1;
        MultiView2.ActiveViewIndex = -1;
        if (ddlSearch.SelectedValue.ToString().Equals("Name"))
        {
            gvVendor.DataSource = objVendor.SearchByName(txtSearch.Text);
        }
        else
        {
            gvVendor.DataSource = objVendor.SearchByID(txtSearch.Text);
        }
        gvVendor.DataBind();
    }

    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        if (objVendor.DeleteVendor(Session["index"].ToString()) > 0)
        {
            Response.Write("<script>alert('Delete " + Session["index"].ToString() + " successfully !')</script>");
            Server.Transfer("VendorManagement.aspx", false);
        }
        else
            Response.Write("<script>alert('Delete " + Session["index"].ToString() + " failed, because it has some foreign keys !')</script>");
    }
    protected void lbtnEdit_Click(object sender, EventArgs e)
    {
        MultiView3.ActiveViewIndex = 0;
        DataTable dt = objVendor.DisplayVendorFull(Session["index"].ToString());
        lblID.Text = dt.Rows[0][0].ToString();
        txtName.Text = dt.Rows[0][1].ToString();
        txtAddress.Text = dt.Rows[0][2].ToString();
        txtPhone.Text = dt.Rows[0][3].ToString();
        txtFAX.Text = dt.Rows[0][4].ToString();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (objVendor.UpdateVendor(lblID.Text, txtName.Text,txtAddress.Text,txtPhone.Text,txtFAX.Text) > 0)
            Response.Redirect("VendorManagement.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView3.ActiveViewIndex = -1;
    }


    protected void gvVendor_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["index"] = gvVendor.SelectedValue;
        dtVendor.DataSource = objVendor.DisplayVendorFull(Session["index"].ToString());
        dtVendor.DataBind();
        MultiView2.ActiveViewIndex = 0;
    }
    protected void gvVendor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVendor.PageIndex = e.NewPageIndex;
        gvVendor.DataSource = objVendor.DisplayVendor();
        gvVendor.DataBind();
    }
    protected void gvVendor_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objVendor.DisplayVendor());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvVendor.DataSource = dataView;
        gvVendor.DataBind();
    }
}
