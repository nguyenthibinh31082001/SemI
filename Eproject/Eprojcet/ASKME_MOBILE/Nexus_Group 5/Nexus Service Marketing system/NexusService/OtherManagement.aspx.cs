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
public partial class OtherManagement : System.Web.UI.Page
{
    Other_BL objOther = new Other_BL();
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
            gvCity.DataSource = objOther.LoadCity();
            gvCity.DataBind();

            gvDistrict.DataSource = objOther.LoadDistrict();
            gvDistrict.DataBind();

            gvET.DataSource = objOther.LoadEquipmentType();
            gvET.DataBind();
        }
    }

    protected void btnAddNewCity_Click(object sender, EventArgs e)
    {
        MultiView2.ActiveViewIndex = 1;
    }
    protected void gvCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["indexCity"] = gvCity.SelectedValue;
        dtCity.DataSource = objOther.LoadCityDetails(Session["indexCity"].ToString());
        dtCity.DataBind();
        MultiView2.ActiveViewIndex = 0;
    }
    protected void gvCity_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objOther.LoadCity());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvCity.DataSource = dataView;
        gvCity.DataBind();
    }
    protected void gvCity_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCity.PageIndex = e.NewPageIndex;
        gvCity.DataSource = objOther.LoadCity();
        gvCity.DataBind();
    }
    protected void btnEditCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("OtherManagement.aspx");
    }
    protected void btnCityUpdate_Click(object sender, EventArgs e)
    {
        if (objOther.UpdateCity(lblCityID.Text,txtEditCityName.Text) > 0)
            Response.Redirect("OtherManagement.aspx");
    }
    protected void lbtnEditCity_Click(object sender, EventArgs e)
    {
        MultiView3.ActiveViewIndex = 0;
        DataTable dt = objOther.LoadCityDetails(Session["indexCity"].ToString());
        lblCityID.Text = dt.Rows[0][0].ToString();
        txtEditCityName.Text = dt.Rows[0][1].ToString();
    }
    protected void lbtnCityDelete_Click(object sender, EventArgs e)
    {
        if (objOther.DeleteCity(Session["indexCity"].ToString()) > 0)
        {
            Response.Write("<script>alert('Delete " + Session["indexCity"].ToString() + " successfully !')</script>");
            Server.Transfer("OtherManagement.aspx", false);
        }
    }
    protected void btnCityAdd_Click(object sender, EventArgs e)
    {
        if(objOther.InsertCity(txtAddCityID.Text,txtAddCityName.Text)>0)
            Response.Redirect("OtherManagement.aspx");
    }
    protected void btnCityCancelAdd_Click(object sender, EventArgs e)
    {
        MultiView2.ActiveViewIndex = 0;
    }

    protected void lbtnEditDistrict_Click(object sender, EventArgs e)
    {
        MultiView5.ActiveViewIndex = 0;
        ddlCityID.DataSource = objOther.LoadCity();
        ddlCityID.DataBind();
        DataTable dt = objOther.LoadDistrictDetailsCity(Session["indexDistrict"].ToString());
        lblDistrictID.Text = dt.Rows[0][0].ToString();
        txtEditDistrictName.Text = dt.Rows[0][1].ToString();
        ddlCityID.Text=dt.Rows[0][2].ToString();
    }
    protected void lbtnDistrictDelete_Click(object sender, EventArgs e)
    {
        if (objOther.DeleteDistrict(Session["indexDistrict"].ToString()) > 0)
        {
            Response.Write("<script>alert('Delete " + Session["indexDistrict"].ToString() + " successfully !')</script>");
            Server.Transfer("OtherManagement.aspx", false);
        }
    }
    protected void btnDistrictAdd_Click(object sender, EventArgs e)
    {
         if(objOther.InsertDistrict(txtAddDistrictID.Text,txtAddDistrictName.Text,ddlAddCityID.SelectedValue)>0)
            Response.Redirect("OtherManagement.aspx");
    }
    protected void btnDistrictUpdate_Click(object sender, EventArgs e)
    {
        if (objOther.UpdateDistrict(lblDistrictID.Text,txtEditDistrictName.Text,ddlCityID.SelectedValue) > 0)
            Response.Redirect("OtherManagement.aspx");
    }
    protected void btnEditDistrictCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("OtherManagement.aspx");
    }
    protected void btnDistrictCancelAdd_Click(object sender, EventArgs e)
    {
        MultiView4.ActiveViewIndex = 0;
    }
    protected void gvDistrict_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDistrict.PageIndex = e.NewPageIndex;
        gvDistrict.DataSource = objOther.LoadDistrict();
        gvDistrict.DataBind();
    }
    protected void gvDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["indexDistrict"] = gvDistrict.SelectedValue;
        dtDistrict.DataSource = objOther.LoadDistrictDetails(Session["indexDistrict"].ToString());
        dtDistrict.DataBind();
        MultiView4.ActiveViewIndex = 0;
    }
    protected void gvDistrict_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objOther.LoadDistrict());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvDistrict.DataSource = dataView;
        gvDistrict.DataBind();
    }
    protected void btnAddNewDistrict_Click(object sender, EventArgs e)
    {
        MultiView4.ActiveViewIndex = 1;
        ddlAddCityID.DataSource = objOther.LoadCity();
        ddlAddCityID.DataBind();
    }


    protected void gvET_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvET.PageIndex = e.NewPageIndex;
        gvET.DataSource = objOther.LoadEquipmentType();
        gvET.DataBind();
    }
    protected void gvET_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["indexET"] = gvET.SelectedValue;
        dtET.DataSource = objOther.LoadEquipmentTypeDetails((int)Session["indexET"]);
        dtET.DataBind();
        MultiView6.ActiveViewIndex = 0;
    }
    protected void gvET_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objOther.LoadEquipmentType());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvET.DataSource = dataView;
        gvET.DataBind();
    }
    protected void lbtnEditET_Click(object sender, EventArgs e)
    {
        MultiView7.ActiveViewIndex = 0;
        DataTable dt = objOther.LoadEquipmentTypeDetails((int)Session["indexET"]);
        lblETID.Text = dt.Rows[0][0].ToString();
        txtEditETName.Text = dt.Rows[0][1].ToString();
        txtDes0.Text=dt.Rows[0][2].ToString();
    }
    protected void lbtnETDelete_Click(object sender, EventArgs e)
    {
        if (objOther.DeleteEquipmentType((int)Session["indexET"]) > 0)
        {
            Response.Write("<script>alert('Delete " + Session["indexET"].ToString() + " successfully !')</script>");
            Server.Transfer("OtherManagement.aspx", false);
        }
    }
    protected void btnETAdd_Click(object sender, EventArgs e)
    {
        if (objOther.InsertEquipmentType(txtAddETName.Text,txtDes.Text) > 0)
            Response.Redirect("OtherManagement.aspx");
    }
    protected void btnETCancelAdd_Click(object sender, EventArgs e)
    {
        MultiView6.ActiveViewIndex = 0;
    }
    protected void btnAddNewET_Click(object sender, EventArgs e)
    {
         MultiView6.ActiveViewIndex = 1;
    }
    protected void btnEditETCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("OtherManagement.aspx");
    }
    protected void btnETUpdate_Click(object sender, EventArgs e)
    {
        if (objOther.UpdateEquipmentType((int)Session["indexET"],txtEditETName.Text,txtDes0.Text) > 0)
            Response.Redirect("OtherManagement.aspx");
    }
}
