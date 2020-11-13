using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;

/// <summary>
/// Summary description for CheckRole
/// </summary>
public class CheckRole
{
    public CheckRole()
    {

    }
    public string role()
    {
        if (Roles.IsUserInRole("RetailShop"))
            return "RetailShop";
        else if (Roles.IsUserInRole("Admin"))
            return "Admin";
        else if (Roles.IsUserInRole("Customer"))
            return "Customer";
        else if (Roles.IsUserInRole("Accountant"))
            return "Accountant";
        else if (Roles.IsUserInRole("Technician"))
            return "Techinician";
        return "";
    }
}
