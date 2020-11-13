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
using EnCryptDecrypt;

public partial class ChangeProfile : System.Web.UI.Page
{
    Employee_BL objEmp = new Employee_BL();
    Common objCommon = new Common();
    RetailsShop_BL objRTS = new RetailsShop_BL();
    Customer_BL objCus = new Customer_BL();
    LoginWeb objLog = new LoginWeb();
    static string role;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        Session["url"] = Server.HtmlEncode(Request.RawUrl);
        if (!(bool)Session["isLogin"])
            Server.Transfer("Login.aspx");
         role = Session["role"].ToString();    
        if (!IsPostBack)
        {
            DataTable dt;
            if (role.Equals("RetailShop"))
            {
                #region
                Panel2.Visible = true;
                  dt = objRTS.DisplayRTSFull(Session["userName"].ToString());
                lblReID.Text = dt.Rows[0][0].ToString();
                lblReName.Text = dt.Rows[0][1].ToString();
                lblReAddress.Text = dt.Rows[0][2].ToString();
                txtReAdd.Text = lblReAddress.Text;
                lblReDistrict.Text = dt.Rows[0][3].ToString();
                lblReCity.Text = dt.Rows[0][4].ToString();
                ddlReCity.DataSource = objCommon.ddlCity();
                ddlReCity.DataBind();
                ddlReCity.Text = objCommon.ddlCityByID(lblReCity.Text).Rows[0][0].ToString();
                ddlReDistrict.Text = objCommon.ddlDistrictByID(lblReDistrict.Text).Rows[0][0].ToString();
                lblReEmail.Text = dt.Rows[0][5].ToString();
                txtReMail.Text = lblReEmail.Text;
                lblRePhone.Text = dt.Rows[0][6].ToString();
                txtRePhone.Text = lblRePhone.Text;
            
                #endregion
            }
            else
            {
                #region
                Panel1.Visible = true;
                if(role.Equals("Customer"))
                    dt = objCus.DisplayCustomerFull(Session["userName"].ToString());
                 else
                    dt = objEmp.DisplayEmployeeFull(Session["userName"].ToString());
                lblEmpID.Text = dt.Rows[0][0].ToString();
                lblEmpName.Text = dt.Rows[0][1].ToString();
                lblEmpIden.Text = dt.Rows[0][2].ToString();
                lblEmpBirthday.Text = ((DateTime)dt.Rows[0][3]).ToShortDateString();
                txtDate.Value = lblEmpBirthday.Text;
                lblEmpSex.Text = dt.Rows[0][4].ToString();
                ddlSex.Text = lblEmpSex.Text;
                lblEmpAddress.Text = dt.Rows[0][5].ToString();
                txtAdd.Text = lblEmpAddress.Text;
                lblEmpDistrict.Text = dt.Rows[0][6].ToString();
                lblEmpCity.Text = dt.Rows[0][7].ToString();
                ddlCity.DataSource = objCommon.ddlCity();
                ddlCity.DataBind();
                ddlCity.Text = dt.Rows[0][7].ToString(); 
                ddlDistrict.Text = dt.Rows[0][6].ToString();
                lblEmpEmail.Text = dt.Rows[0][8].ToString();
                txtMail.Text = dt.Rows[0][8].ToString();
                lblEmpPhone.Text = dt.Rows[0][9].ToString();
                txtPhone.Text = dt.Rows[0][9].ToString();
                if (!role.Equals("Customer"))
                {
                    lblEmpRole.Text = dt.Rows[0][10].ToString();
                    lblEmpDateJoin.Text = ((DateTime)dt.Rows[0][12]).ToShortDateString();
                    lblDateJoin.Visible = true;
                    lblRole.Visible = true;
                    lblEmpRole.Visible = true;
                    lblEmpDateJoin.Visible = true;
                }
                else
                {
                    lblDetailOrderID.Visible = true;
                    lblDetailQuantity.Visible = true;
                    lblQuantity.Visible = true;
                    lblOrderID.Visible = true;
                    lblDetailOrderID.Text = dt.Rows[0][10].ToString();
                    lblDetailQuantity.Text = dt.Rows[0][11].ToString();
                }
                #endregion
            }
            
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        EnabledEmp(true);
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int result;
        if (role.Equals("Customer"))
        {
            result = objCus.ChangeProfileCustomer(lblEmpID.Text, txtDate.Text, ddlSex.SelectedItem.ToString(), txtAdd.Text,
            ddlDistrict.SelectedItem.ToString(), ddlCity.SelectedItem.ToString(), txtMail.Text, txtPhone.Text);
        }
        else
        {
            result=objEmp.ChangeProfileEmployee(lblEmpID.Text,txtDate.Text,ddlSex.SelectedItem.ToString(),txtAdd.Text,
            ddlDistrict.SelectedItem.ToString(),ddlCity.SelectedItem.ToString(),txtMail.Text,txtPhone.Text);
        }
        if(result>0)
        {
            Server.Transfer("ChangeProfile.aspx");
            EnabledEmp(false);
        }
        
        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EnabledEmp(false);
    }
    public void EnabledEmp(bool status)
    {
        txtDate.Visible = status;
        ddlSex.Visible = status;
        txtAdd.Visible = status;
        ddlCity.Visible = status;
        ddlDistrict.Visible = status;
        txtMail.Visible = status;
        txtPhone.Visible = status;

        lblEmpAddress.Visible=!status;
        lblEmpBirthday.Visible=!status;
        lblEmpSex.Visible=!status;
        lblEmpPhone.Visible = !status;
        lblEmpCity.Visible=!status;
        lblEmpDistrict.Visible=!status;
        lblEmpEmail.Visible = !status;


        btnCancel.Visible = status;
        btnEdit.Visible = !status;
        btnUpdate.Visible = status;

    }
    public void EnabledRe(bool status)
    {
        txtReAdd.Visible = status;
        ddlReCity.Visible = status;
        ddlReDistrict.Visible = status;
        txtReMail.Visible = status;
        txtRePhone.Visible = status;

        lblReAddress.Visible = !status;
        lblRePhone.Visible = !status;
        lblReCity.Visible = !status;
        lblReDistrict.Visible = !status;
        lblReEmail.Visible = !status;

        btnReCancel.Visible = status;
        btnReEdit.Visible = !status;
        btnReUpdate.Visible = status;
        
    }
    protected void ddlCity_Load(object sender, EventArgs e)
    {
        try
        {
             ddlDistrict.DataSource = objCommon.ddlDistrict(ddlCity.SelectedValue);
        ddlDistrict.DataBind();
        }
        catch (Exception)
        {
        }
    }
    protected void btnReUpdate_Click(object sender, EventArgs e)
    {
        if (objRTS.UpdateRetailShop(lblReID.Text, lblReName.Text, txtReAdd.Text, ddlReDistrict.SelectedItem.ToString(), ddlReCity.SelectedItem.ToString(), txtReMail.Text, txtRePhone.Text) > 0)
        {
            Server.Transfer("ChangeProfile.aspx");
            EnabledEmp(false);
        }
    }
    protected void btnReEdit_Click(object sender, EventArgs e)
    {
        EnabledRe(true);
    }
    protected void btnReCancel_Click(object sender, EventArgs e)
    {
        EnabledRe(false);
    }
    protected void ddlReCity_Load(object sender, EventArgs e)
    {
        try
        {
             ddlReDistrict.DataSource = objCommon.ddlDistrict(ddlReCity.SelectedValue);
        ddlReDistrict.DataBind();
        }
        catch (Exception)
        {
           
        }
    }
    protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
    {
        if ((DateTime.Now.Year - ((DateTime)txtDate.Value).Year) < 18)
            args.IsValid = false;
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (CryptorEngine.Encrypt(txtOldPass.Text, true).Equals(Session["password"].ToString()))
        {
            objLog.ChangePassword(Session["userName"].ToString(), txtNewPassword.Text);
            lblLoginFail.Visible = false;
            lblLoginFail0.Visible = true;
        }
        else
            lblLoginFail.Visible = true;
    }
}
