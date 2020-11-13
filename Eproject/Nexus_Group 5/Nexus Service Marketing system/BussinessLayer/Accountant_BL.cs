using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;

namespace BussinessLayer
{    
   public class Accountant_BL
    {
        Data objData = new Data();
        SqlParameter sp;
        string sql = "";
        public DataTable LoadConnections()
        {
            return objData.LoadData("select ConnectionID, OrderID, ConnectionStatus from Connections");
        }
        public DataTable LoadCustomerDetails(string orderID)
        {
            sql = "execute LoadCustomerDetails @orderID";
            sp = new SqlParameter("@orderID", orderID);
            return objData.LoadData(sql, sp);
        }
        public DataTable LoadPlanDetails(string orderID)
        {
            sql = "execute LoadDetailsPlans @orderID";
            sp = new SqlParameter("@orderID", orderID);
            return objData.LoadData(sql, sp);
        }
        public int InsertBill(int monthBill, int yearBill, int connectionID, string customerID, bool billStatus, float amount, int taxID, float total)
        {
            sql = "insert into Bills values (@monthBill, @yearBill, @connectionID, @customerID, @billStatus, @amount, @taxID, @total)";
            SqlParameter[] sp = new SqlParameter[8];
            sp[0] = new SqlParameter("@monthBill", monthBill);
            sp[1] = new SqlParameter("@yearBill", yearBill);
            sp[2] = new SqlParameter("@connectionID", connectionID);
            sp[3] = new SqlParameter("@customerID", customerID);
            sp[4] = new SqlParameter("@billStatus", billStatus);
            sp[5] = new SqlParameter("@amount", amount);
            sp[6] = new SqlParameter("@taxID", taxID);
            sp[7] = new SqlParameter("@total", total);
            
            try
            {
                return objData.Insert_Update_Delete(sql, sp);
            }
            catch(SqlException)
            {
                return 0;
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public DataTable LoadTax()
        {
            return objData.LoadData("select * from Tax");
        }
        public DataTable LoadLandLineCallCharge(string orderID)
        {
            sql = "execute LoadLandLineCallCharge @orderID";
            sp = new SqlParameter("@orderID", orderID);
            return objData.LoadData(sql, sp);
        }
        public DataTable SearchConnection(string orderID)
        {
            sql = "select ConnectionID, OrderID, ConnectionStatus from Connections where OrderID like @orderID";
            sp = new SqlParameter("@orderID", "%"+orderID+"%");
            return objData.LoadData(sql, sp);
        }
        public string LoadConnectionStatus(string orderID)
        {
            sql = "select ConnectionStatus from Connections where OrderID = @orderID";
            sp = new SqlParameter("@orderID", orderID);
            
            try
            {
                return objData.LoadData(sql, sp).Rows[0][0].ToString();
            }
            catch (SqlException)
            {
                return "";
            }
            catch (Exception)
            {
                return "";
            }
        }
    }
}
