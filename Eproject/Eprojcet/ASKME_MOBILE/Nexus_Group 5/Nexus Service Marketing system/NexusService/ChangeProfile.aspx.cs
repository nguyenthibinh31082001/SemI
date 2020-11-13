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
using System.Data;
using System.Data.SqlClient;

public partial class ChangeProfile : System.Web.UI.Page
{
    //form login dau

    protected void btnChange_Click(object sender, EventArgs e)
    {
        try
        {


            if (Session["idlogin"] != null)
            {
                string pass = Session["password"].ToString();
                string ids = Session["idlogin"].ToString();
                Response.Write(ids);
                SqlCommand cmd = DataAccess.Connection.CreateCommand();
                cmd.CommandText = "update Employee set Identification=@Identification where EmployeeID=@EmployeeID";
                if (txtNewPassword.Text.Length < 5 |txtConfirmNewPassword.Text.Length<5) 
                        {
                
                        lbtb.Text="pass fai lon hon hoac bang 5 ky tu";
                        }

                       else if (txtNewPassword.Text != txtConfirmNewPassword.Text || txtOldPass.Text!=pass)
                        {
                           
                            lbtb.Text = "Pass kko trug nhau";
                        }
                else
                {
                    cmd.Parameters.AddWithValue("Identification", txtConfirmNewPassword.Text);
                    cmd.Parameters.AddWithValue("@EmployeeID", ids);
                    cmd.ExecuteNonQuery();
                    lbtb.Text = "thanh cong";
                }
            }
        }
        catch (Exception ex)
        {

            lbtb.Text = "Loi" + ex.Message;
        }
    }
}
