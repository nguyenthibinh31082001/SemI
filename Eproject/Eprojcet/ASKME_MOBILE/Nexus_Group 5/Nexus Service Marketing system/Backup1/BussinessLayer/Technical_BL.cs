using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data.SqlClient;
using System.Data;
using EnCryptDecrypt;

namespace BussinessLayer
{
   public class Technical_BL
    {
        Data objData = new Data();
        string sql = "";
        SqlParameter sp = null;
        public int LoadCountCustomer()
        {
            return (int)objData.LoadData("select CountMember from CountID where ID = 'Customer'").Rows[0][0];
        }
        public int UpdateCountCustomer(int count)
        {
            sql = "update CountID set CountMember = @count where ID='Customer'";
            sp = new SqlParameter("@count", count);
            try
            {
                 return objData.Insert_Update_Delete(sql, sp);
            }
            catch (SqlException)
            {
                return 0;
            }
            catch (Exception)
            {
                return 0;
            }
            
        }
        public int InsertCustomer(string customerID, string customerName, string identification, DateTime birthday, string sex, string address, string district, string city, string email, string phone, string orderID)
        {
            sql = "insert into Customers(CustomerID, CustomerName, Identification, Birthday, Sex, Address, District, City, Email, Phone, OrderID, Quantity) values(@customerID, @customerName, @identification, @birthday, @sex, @address, @district, @city, @email, @phone, @orderID, 1)";
            SqlParameter[] sp = new SqlParameter[11];
            sp[0] = new SqlParameter("@customerID", customerID);
            sp[1] = new SqlParameter("@customerName", customerName);
            sp[2] = new SqlParameter("@identification", identification);
            sp[3] = new SqlParameter("@birthday", birthday);
            sp[4] = new SqlParameter("@sex", sex);
            sp[5] = new SqlParameter("@address", address);
            sp[6] = new SqlParameter("@district", district);
            sp[7] = new SqlParameter("@city", city);
            sp[8] = new SqlParameter("@email", email);
            sp[9] = new SqlParameter("@phone", phone);
            sp[10] = new SqlParameter("@orderID", orderID);
            try
            {
                 return objData.Insert_Update_Delete(sql, sp);
            }
            catch (SqlException)
            {
                return 0;
            }
            catch (Exception)
            {
                return 0;
            }
            
        }
        public int CountIdentification(string identification)
        {
            sql = "select count(Identification) from Customers where Identification = @identification";
            sp = new SqlParameter("@identification", identification);
            try
            {
                return (int)objData.LoadData(sql, sp).Rows[0][0];
            }
            catch (SqlException)
            {
                return 0;
            }
            catch (Exception)
            {
                return 0;
            }
            
        }
        public int UpdateQuantity(int quantity, string identification)
        {
            sql = "update Customers set Quantity = @quantity where Identification = @identification";
            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@quantity", quantity);
            sp[1] = new SqlParameter("@identification", identification);
            try
            {
               return objData.Insert_Update_Delete(sql, sp);  
            }
            catch (SqlException)
            {
                return 0;
            }
            catch (Exception)
            {
                return 0;
            }
            
        }
        public int InsertMember(string userName, string password)
        {
            sql = "insert into Members values(@userName, @password, 'Customers')";
            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@userName", userName);
            sp[1] = new SqlParameter("@password", password);
            try
            {
              return objData.Insert_Update_Delete(sql, sp);   
            }
            catch (SqlException)
            {
                return 0;
            }
            catch (Exception)
            {
                return 0;
            }
            
        }
        public int UpdateOrders(string orderID, string customerID)
        {
            sql = "update Orders set OrderStatus = 'Yes', CustomerID = @customerID, ConnectDate = getdate() where OrderID = @orderID";
            SqlParameter[] sp =new SqlParameter[2];
            sp[0] = new SqlParameter("@orderID", orderID);
            sp[1] = new SqlParameter("@customerID", customerID);
            try
            {
                return objData.Insert_Update_Delete(sql, sp);
            }
            catch (SqlException)
            {
                return 0;
            }
            catch (Exception)
            {
                return 0;
            }
            
        }
        public int InsertConnection(string orderID, string connectionStatus)
        {
            sql = "insert into Connections values (@orderID, @connectionStatus)";
            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@orderID", orderID);
            sp[1] = new SqlParameter("@connectionStatus", connectionStatus);
            try
            {
               return objData.Insert_Update_Delete(sql, sp);   
            }
            catch (SqlException)
            {
                return 0;
            }
            catch (Exception)
            {
                return 0;
            }
           
        }
        
    }
}
