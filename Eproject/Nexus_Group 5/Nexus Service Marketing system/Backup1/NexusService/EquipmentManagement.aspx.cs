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

public partial class EquipmentManagement : System.Web.UI.Page
{
    Equipment_BL objEquip = new Equipment_BL();
    Sorting objSort = new Sorting();
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
            gvEquipment.DataSource = objEquip.DisplayEquip();
            gvEquipment.DataBind();
        }
    }


    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewEquipment.aspx");
    }


    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        gvEquipment.SelectedIndex = -1;
        MultiView2.ActiveViewIndex = -1;
        if (ddlSearch.SelectedValue.ToString().Equals("Name"))
        {
            gvEquipment.DataSource = objEquip.SearchByName(txtSearch.Text);
        }
        else
        {
            gvEquipment.DataSource = objEquip.SearchByVendorName(txtSearch.Text);
        }
        gvEquipment.DataBind();
    }

    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        if (objEquip.DeleteEquip(Session["index"].ToString()) > 0)
        {
            Response.Write("<script>alert('Delete " + Session["index"].ToString() + " successfully !')</script>");
            Server.Transfer("EquipmentManagement.aspx", false);
        }
    }
    protected void lbtnEdit_Click(object sender, EventArgs e)
    {
        MultiView3.ActiveViewIndex = 0;
        DataTable dt = objEquip.DisplayEquipEdit(Session["index"].ToString());
        lblID.Text = dt.Rows[0][0].ToString();
        txtName.Text = dt.Rows[0][1].ToString();
        ddlVendor.Text = dt.Rows[0][2].ToString();
        txtPrice.Text = dt.Rows[0][3].ToString();
        txtWarranty.Text = dt.Rows[0][4].ToString();
        ddlEquipType.Text = dt.Rows[0][5].ToString();
        ddlEquipType.DataSource = objCommon.ddlEquipType();
        ddlEquipType.DataBind();
        ddlVendor.DataSource = objCommon.ddlVendor();
        ddlVendor.DataBind();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (objEquip.UpdateEquip(lblID.Text, txtName.Text, ddlVendor.Text, float.Parse(txtPrice.Text), float.Parse(txtWarranty.Text), int.Parse(ddlEquipType.Text)) > 0)
            Response.Redirect("EquipmentManagement.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView3.ActiveViewIndex = -1;
    }
    protected void gvEquipment_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEquipment.PageIndex = e.NewPageIndex;
        gvEquipment.DataSource = objEquip.DisplayEquip();
        gvEquipment.DataBind();
    }
    protected void gvEquipment_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["index"] = gvEquipment.SelectedValue;
        dtEquipment.DataSource = objEquip.DisplayEquipFull(Session["index"].ToString());
        dtEquipment.DataBind();
        MultiView2.ActiveViewIndex = 0;
    }
    protected void gvEquipment_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objEquip.DisplayEquip());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvEquipment.DataSource = dataView;
        gvEquipment.DataBind();
    }
}
