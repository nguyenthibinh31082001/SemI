using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class View_Home : System.Web.UI.Page
{
   
       DataLinkQDataContext db = new DataLinkQDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        //    LoadFlavor();
           Loadflavor();
           Loadbook();


       //   PhantrangBook();
       
       //    PhantrangFlavor();
    }
    //
    public void Loadbook()
    {
// Link Q
        //var book = from p in db.BOOKRECIPEs select p;
        //dtlisbook.DataSource = book;
        //dtlisbook.DataBind();
        // ADO
        SqlDataAdapter da = new SqlDataAdapter("select * from BOOKRECIPE", DataAccess.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);
        //phan trang
        PagedDataSource page = new PagedDataSource();
        page.AllowPaging = true;
        page.DataSource = ds.Tables[0].DefaultView;
        page.PageSize = 9;
        int p = 0;

        try
        {
            p = int.Parse(Request["p"]) - 1;
        }
        catch
        {
        }

        page.CurrentPageIndex = p;
        //
        dtlisbook.DataSource = page;
        dtlisbook.DataBind();
        //tao link
        for (int i = 1; i <= page.PageCount; i++)
        {
            if (i == p + 1)
                lbphantrangbook.Text += "  " + i + " ";
            else
                lbphantrangbook.Text += "<a href='?p=" + i + "'> " + i + " </a>";
        }

       
    }
    //
    public void Loadflavor()
    {
        // link Q

        //var flavor = from p in db.FLAVORs select p;
        //dtlist.DataSource = flavor;
        //dtlist.DataBind();

        // ADO
        SqlDataAdapter da = new SqlDataAdapter("select FId,FName,FImage,Ingredient from FLAVOR where TypeFlavor=1", DataAccess.ConnectionString);
        DataSet ds = new DataSet();
        da.Fill(ds);
        //phan trang
        PagedDataSource page = new PagedDataSource();
        page.AllowPaging = true;
        page.DataSource = ds.Tables[0].DefaultView;
        page.PageSize = 8;
        int p = 0;

        try
        {
            p = int.Parse(Request["p"]) - 1;
        }
        catch
        {
        }

        page.CurrentPageIndex = p;
        //
        dtlist.DataSource = page;
        dtlist.DataBind();
        //tao link
        for (int i = 1; i <= page.PageCount; i++)
        {
            if (i == p + 1)
                lbphantrang.Text += "  " + i + " ";
            else
                lbphantrang.Text += "<a href='?p=" + i + "'> " + i + " </a>";
        }
    }

    //
    //private void PhantrangFlavor()
    //{
    //    SqlDataAdapter da = new SqlDataAdapter("select FId,FName,FImage,Ingredient from FLAVOR where TypeFlavor=1", DataAccess.ConnectionString);
    //    DataSet dts = new DataSet();
    //    da.Fill(dts);
    //    clpage.MaxPages = 10000;

    //    clpage.PageSize = 6; // số items hiển thị trên một trang

    //    clpage.DataSource = dts.Tables[0].DefaultView;

    //    clpage.BindToControl = dtlist;

    //    dtlist.DataSource = clpage.DataSourcePaged;

    //    dtlist.DataBind();

    //}
  //
    //private void PhantrangBook()
    //{
    //    SqlDataAdapter adt = new SqlDataAdapter("select * from BOOKRECIPE", DataAccess.ConnectionString);
    //    DataSet dts = new DataSet();
    //    adt.Fill(dts);
    //    clpbook.MaxPages = 10000;

    //    clpbook.PageSize = 9; // số items hiển thị trên một trang

    //    clpbook.DataSource = dts.Tables[0].DefaultView;

    //    clpbook.BindToControl = dtlisbook;

    //    dtlisbook.DataSource = clpbook.DataSourcePaged;

    //    dtlisbook.DataBind();

  //  }
    protected void dtlist_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}