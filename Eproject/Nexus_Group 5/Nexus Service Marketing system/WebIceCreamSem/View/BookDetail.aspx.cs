using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_BookDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            int b = Int32.Parse(Request.QueryString["id"]);
            loaddetail(b);
        }
    }

    DataLinkQDataContext db = new DataLinkQDataContext();
    public void loaddetail(int a)
    {

        var book = from b in db.BOOKRECIPEs where b.BId == a select b;
        dtdetailbook.DataSource = book;
        dtdetailbook.DataBind();
    }
}