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

public partial class Tonghop : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        switch (Session["role"].ToString())
        {
            case "Admin":
                DefaultSidebarACC1.Visible = false;
                DefaultSidebarAdmin1.Visible = true;
                DefaultSidebarBroker1.Visible = false;
                DefaultSidebarCU1.Visible = false;
                DefaultSidebarTE1.Visible = false;
                DefaultSidebar11.Visible = false;
                break;
            case "RetailShop":
                DefaultSidebarACC1.Visible = false;
                DefaultSidebarAdmin1.Visible = false;
                DefaultSidebarBroker1.Visible = true;
                DefaultSidebarCU1.Visible = false;
                DefaultSidebarTE1.Visible = false;
                DefaultSidebar11.Visible = false;
                break;
            case "Customer":
                DefaultSidebarACC1.Visible = false;
                DefaultSidebarAdmin1.Visible = false;
                DefaultSidebarBroker1.Visible = false;
                DefaultSidebarCU1.Visible = true;
                DefaultSidebarTE1.Visible = false;
                DefaultSidebar11.Visible = false;
                break;
            case "Accountant":
                DefaultSidebarACC1.Visible = true;
                DefaultSidebarAdmin1.Visible = false;
                DefaultSidebarBroker1.Visible = false;
                DefaultSidebarCU1.Visible = false;
                DefaultSidebarTE1.Visible = false;
                DefaultSidebar11.Visible = false;
                break;
           case "Technician":
                DefaultSidebarACC1.Visible = false;
                DefaultSidebarAdmin1.Visible = false;
                DefaultSidebarBroker1.Visible = false;
                DefaultSidebarCU1.Visible = false;
                DefaultSidebarTE1.Visible = true;
                DefaultSidebar11.Visible = false;
                break;
            default:
                DefaultSidebarACC1.Visible = false;
                DefaultSidebarAdmin1.Visible = false;
                DefaultSidebarBroker1.Visible = false;
                DefaultSidebarCU1.Visible = false;
                DefaultSidebarTE1.Visible = false;
                DefaultSidebar11.Visible = true;
                break;

        }
      //  DefaultSidebar11.Visible = false;
    }
}
