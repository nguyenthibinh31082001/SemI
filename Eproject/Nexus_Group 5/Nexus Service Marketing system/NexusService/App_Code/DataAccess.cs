using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DataAccess
/// </summary>
public class DataAccess
{
    public DataAccess()
    {
        //
        // TODO: Add constructor logic here

    }
        public static string ConnectionString
    {
        get
        {
            return ConfigurationManager.ConnectionStrings["connectNexusDB"].ConnectionString;
        }
    }
    public static SqlConnection Connection
    {
        get
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            con.Open();
            return con;
        }
   }
}