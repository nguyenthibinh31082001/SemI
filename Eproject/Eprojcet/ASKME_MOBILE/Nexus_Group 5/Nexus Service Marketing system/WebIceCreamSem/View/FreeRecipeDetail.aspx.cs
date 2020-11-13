using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_FreeRecipeDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            int a = Int32.Parse(Request.QueryString["id"]);
            loaddetail(a);
        }
    }

    DataLinkQDataContext db = new DataLinkQDataContext();
    public void loaddetail(int id)
    {

        var dt = from p in db.FLAVORs where p.FId == id select p;
        dtlFreeFlavorDetail.DataSource = dt;
        dtlFreeFlavorDetail.DataBind();

    }
    //protected void dtlistdetail_ItemDataBound(object sender, DataListItemEventArgs e)
    //{
    //    if(e.Item.ItemIndex<0)
    //        return;

    //    Panel p= (Panel) e.Item.FindControl("pnDetail");
    //    Label lb= (Label)e.Item.FindControl("lbxemchitiet");
    //    if (Session["login"] != null)
    //        p.Visible = true;
    //    else {
    //        lb.Text = "You must login to view Recipe !";
    //    }
    //}
}