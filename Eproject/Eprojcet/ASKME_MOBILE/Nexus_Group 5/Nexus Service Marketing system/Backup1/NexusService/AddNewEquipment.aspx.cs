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
public partial class AddNewEquipment : System.Web.UI.Page
{
    Common objCommon = new Common();
    Equipment_BL objEquip = new Equipment_BL();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
        //if (!(Session["role"].ToString().Equals("Admin")))
        //    Response.Redirect("NotAccess.aspx");
        if (!IsPostBack)
        {
            ddlEquipType.DataSource = objCommon.ddlEquipType();
            ddlEquipType.DataBind();
            ddlVendor.DataSource = objCommon.ddlVendor();
            ddlVendor.DataBind();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EquipmentManagement.aspx");
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        if(objEquip.InsertEqiup(txtID.Text,txtName.Text, ddlVendor.Text, float.Parse(txtPrice.Text), float.Parse(txtWarranty.Text), int.Parse(ddlEquipType.Text))>0)
            Response.Redirect("EquipmentManagement.aspx");
    }
}
