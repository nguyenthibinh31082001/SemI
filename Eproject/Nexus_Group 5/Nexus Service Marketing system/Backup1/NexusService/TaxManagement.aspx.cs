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

public partial class TaxManagement : System.Web.UI.Page
{
    Tax_BL objTax = new Tax_BL();
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
            gvTax.DataSource = objTax.DisplayTaxFull();
            gvTax.DataBind();
        }
    }


    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewTax.aspx");
    }

    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        if (objTax.DeleteTax(Session["index"].ToString()) > 0)
        {
            Response.Write("<script>alert('Delete " + Session["index"].ToString() + " successfully !')</script>");
            Server.Transfer("TaxManagement.aspx", false);
        }
    }
    protected void lbtnEdit_Click(object sender, EventArgs e)
    {
        MultiView3.ActiveViewIndex = 0;
        DataTable dt = objTax.DisplayTaxEdit(int.Parse(Session["index"].ToString()));
        lblID.Text = dt.Rows[0][0].ToString();
        txtName.Text = dt.Rows[0][1].ToString();
        txtValue.Text = dt.Rows[0][2].ToString();
        txtDescription.Text = dt.Rows[0][3].ToString();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (objTax.UpdateTax(int.Parse(Session["index"].ToString()),txtName.Text,float.Parse(txtValue.Text),txtDescription.Text)>0)
            Response.Redirect("TaxManagement.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView3.ActiveViewIndex = -1;
    }

    protected void gvTax_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTax.PageIndex = e.NewPageIndex;
        gvTax.DataSource = objTax.DisplayTaxFull();
        gvTax.DataBind();
    }
    protected void gvTax_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["index"] = gvTax.SelectedValue;
        dtTax.DataSource = objTax.DisplayTaxEdit(int.Parse(Session["index"].ToString()));
        dtTax.DataBind();
        MultiView2.ActiveViewIndex = 0;
    }
    protected void gvTax_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objTax.DisplayTaxFull());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvTax.DataSource = dataView;
        gvTax.DataBind();
    }
}
