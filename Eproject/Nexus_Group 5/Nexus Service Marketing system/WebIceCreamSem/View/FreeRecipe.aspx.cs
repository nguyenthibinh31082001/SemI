using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class View_FreeRecipe : System.Web.UI.Page
{
    DataLinkQDataContext db = new DataLinkQDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFreeRecipe();
        }
    }

    private void LoadFreeRecipe()
    {
        SqlDataAdapter da = new SqlDataAdapter("select FId,FProvider,FName,FImage,Ingredient from FLAVOR where TypeFlavor=0", DataAccess.ConnectionString);
        DataSet dts = new DataSet();
        da.Fill(dts);

        dtlist.DataSource = dts.Tables[0];
        dtlist.DataBind();

        //var flavor = from p in db.FLAVORs where p.TypeFlavor==0 select p;
        //dtlist.DataSource = flavor;
        //dtlist.DataBind();
    }
}