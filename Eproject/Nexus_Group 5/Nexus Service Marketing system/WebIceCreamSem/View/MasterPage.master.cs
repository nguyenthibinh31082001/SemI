using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class View_MasterPage : System.Web.UI.MasterPage
{
    DataLinkQDataContext db = new DataLinkQDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["login"] != null)
            {
                string status = Session["login"].ToString();
                lbstatus.Text = "Wellcome: " + status;
            }

            loadflavor();
            LoadBook();
        }
      
    }
    // load flavor to menu
  
    public void loadflavor()
    {
        //var fl = from sp in db.FLAVORs select sp;
        //dtlistflavor .DataSource = fl;
        //dtlistflavor.DataBind();
        SqlDataAdapter da = new SqlDataAdapter("select Top 5 * from FLAVOR order by FLAVOR.FId DESC", DataAccess.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dtlistflavor.DataSource=ds.Tables[0];
        dtlistflavor.DataBind();

    }


    // load book recipe to menu
    public void LoadBook()
    {
        //var book = from Books in db.BOOKRECIPEs select Books;
        //DataListBook.DataSource = book;
        //DataListBook.DataBind();
        SqlDataAdapter da = new SqlDataAdapter("select Top 5 * from BOOKRECIPE order by BOOKRECIPE.BId DESC", DataAccess.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataListBook.DataSource = ds.Tables[0];
        DataListBook.DataBind();

    }


    protected void btlogin_Click(object sender, ImageClickEventArgs e)
    {
        bool nd = db.CUSTOMERs.Where(us => us.CUserName == txtuser.Text && us.CPassWord == txtpass.Text).FirstOrDefault() != null ? true : false;
        if (nd)
        {


          //  pnlogin.Visible = false;
            Session["login"] = txtuser.Text;
           
            linkLogout2.Enabled = true;
         
            Response.Redirect("Home.aspx");
           
        }
        else
        {
            lbstatus.Text = "Not match";
            //Response.Redirect("Register.aspx");
        }
    }
    protected void lbtlogout_Click(object sender, EventArgs e)
    {
        Session["login"] = null;
        Response.Redirect("Home.aspx");
    }
}
