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

public partial class Admin_EmployeeManagement : System.Web.UI.Page
{
    Employee_BL objEmp = new Employee_BL();
    RetailsShop_BL objRetail = new RetailsShop_BL();
    Common objcommon = new Common();
    Sorting objSort = new Sorting();
    LoginWeb objLogin = new LoginWeb();
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
            gvEmployee.DataSource = objEmp.DisplayEmployee();
            gvEmployee.DataBind(); 
        }
        
    }
    

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        MultiView2.ActiveViewIndex = 0;
        Session["index"] = gvEmployee.SelectedValue;
        DetailsView1.DataSource = objEmp.DisplayEmployeeFull(Session["index"].ToString());
        DetailsView1.DataBind();
        Session["index"] = gvEmployee.SelectedValue;
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewEmployee.aspx");
    }

    protected void gvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEmployee.PageIndex = e.NewPageIndex;
        gvEmployee.DataSource = objEmp.DisplayEmployee();
        gvEmployee.DataBind();
    }
    protected void gvEmployee_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView dataView = new DataView(objEmp.DisplayEmployee());
        dataView.Sort = e.SortExpression + " " + objSort.ConvertSortDirectionToSql(e.SortDirection);
        gvEmployee.DataSource = dataView;
        gvEmployee.DataBind();
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        MultiView2.ActiveViewIndex = -1;
        MultiView1.ActiveViewIndex = -1;
        gvEmployee.SelectedIndex = -1;
        if (ddlSearch.SelectedValue.ToString().Equals("Name"))
        {
            gvEmployee.DataSource = objEmp.SearchByName(txtSearch.Text);
        }
        else
        {
            gvEmployee.DataSource = objEmp.SearchByID(txtSearch.Text);
        }
        gvEmployee.DataBind();
    }

    protected void btnEditRole_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        ddlEditRole.Text = objEmp.DisplayEmployeeFull(gvEmployee.SelectedValue.ToString()).Rows[0][10].ToString();
    }
    protected void lbtnUpdate_Click(object sender, EventArgs e)
    {
        int result = objEmp.UpdateEmployee(ddlEditRole.SelectedItem.ToString(),Session["index"].ToString());
        if (result > 0)
        {
            objLogin.UpdateRole(Session["index"].ToString(), ddlEditRole.SelectedItem.ToString());
            Response.Write("<script>alert('Update " + Session["index"].ToString() + " successful !')</script>");
            Response.Redirect("EmployeeManagement.aspx",true);
        }
        else
        {
            Response.Write("<script>alert('Update " + Session["index"].ToString() + " failed !')</script>");
        }
    }
    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = -1;
    }
    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        if (objEmp.DeleteEmployee(Session["index"].ToString()) > 0)
        {
            objcommon.DeleteMember(Session["index"].ToString());
            Response.Write("<script>alert('Delete " + Session["index"].ToString() + " successfully !')</script>");
            Server.Transfer("EmployeeManagement.aspx", false);
        }
    }
 
}
