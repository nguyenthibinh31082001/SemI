using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class View_AddRecipe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
         string tenfile = System.IO.Path.GetFileName(uploadimage.PostedFile.FileName);

         string provider = txtprovider.Text;

         string address = txtaddress.Text;
         string phone = txtphone.Text;
         string email = txtemail.Text;

        string name = txtname.Text;
        string ingredient = txtingredient.Text;
        string recipe = txtrecipe.Text;
        
        uploadimage.PostedFile.SaveAs(Server.MapPath("~/images/imageflavor/" )+ tenfile);
        try
        {
            
            //if (provider == "")
            //{
            //    lbthongbaoaddrecipe.Text = "Enter your name";

            //}
            //else if (address == "")
            //    lbthongbaoaddrecipe.Text = "Enter your address";
            //else if (phone == "")
            //    lbthongbaoaddrecipe.Text = "Enter your phone";
            //else if (email == "")
            //    lbthongbaoaddrecipe.Text = "Enter your email";
            //else if (name == "")
            //    lbthongbaoaddrecipe.Text = "Enter flavor name";
            //else if (ingredient == "")
            //    lbthongbaoaddrecipe.Text = "Enter ingredient";
            //else if (recipe == "")
            //    lbthongbaoaddrecipe.Text = "Enter recipe";
            //else
            //{

                SqlCommand cmd = DataAccess.Connection.CreateCommand();
                cmd.CommandText = "insert into FLAVOR values (@provider,@address, @phone, @email,@name, @image, @ingredient, @recipe, @type)";
                cmd.Parameters.AddWithValue("@provider", provider);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@image", tenfile);
                cmd.Parameters.AddWithValue("@ingredient", ingredient);
                cmd.Parameters.AddWithValue("@recipe", recipe);
                cmd.Parameters.AddWithValue("@type", 0);

                cmd.ExecuteNonQuery();
                lbthongbaoaddrecipe.Text = "Congratulation, You have just added new recipe";
                Reset();
        //    }
        }catch(Exception ex){
            lbthongbaoaddrecipe.Text = "Fail"+ex.Message;
        }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Reset();
    }
    //\
    public void Reset() {
        txtname.Text = "";
        txtprovider.Text = "";
        txtrecipe.Text = "";
        txtingredient.Text = "";
        txtaddress.Text = "";
        txtphone.Text = "";
        txtemail.Text = "";


    }
}