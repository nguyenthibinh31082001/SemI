using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data.SqlClient;
using System.Data;

namespace BussinessLayer
{
   public class Broker_BL
    {
        Data objData = new Data();
        string sql = "";
        SqlParameter sp = null;
        public DataTable LoadPlans()
        {
            sql = "select * from Plans";
            return objData.LoadData(sql);
        }
        public DataTable LoadDeposit(string planID)
        {
            sql = "select SecurityDeposit from Plans where PlanID = @planID";
            sp = new SqlParameter("@planID", planID);
            return objData.LoadData(sql, sp);
        }
        public DataTable LoadPlanTypes(string select, string planID)
        {
            if (select=="DialUp")
            {
                sql = "select DISTINCT Package, PlanID from DialUpConnection where PlanID = @planID";
                sp = new SqlParameter("@planID", planID);
                
            }
            else if (select=="BroadBand")
            {
                sql = "select DISTINCT Package, PlanID from BroadBandConnection where PlanID = @planID";
                sp = new SqlParameter("@planID", planID);
                
            }
            else if (select=="LandLine")
            {
                sql = "select DISTINCT Package, PlanID from LandLineConnection where PlanID = @planID";
                sp = new SqlParameter("@planID", planID);
               
            }
            return objData.LoadData(sql, sp);
        }

        public DataTable LoadConnectionTypes(string select, string package)
        {
            if (select == "1")
            {
                sql = "select BroadBandID, Duration from BroadBandConnection where Package = @package";
                sp = new SqlParameter("@package", package);                
            }
            else if (select == "2")
            {
                sql = "select DialUpID, Duration from DialUpConnection where Package = @package";
                sp = new SqlParameter("@package", package);               
            }
            else if (select == "3")
            {
                sql = "select LandLineID, Duration from LandLineConnection where Package = @package";
                sp = new SqlParameter("@package", package);
            }
            return objData.LoadData(sql, sp);            
        }       
        public int InsertOrder(string orderID, string employeeID, string equipmentID, string connectionTypeID,double securityDeposit)
        {            
            SqlParameter[] sp = new SqlParameter[5];
            sql = "insert into orders(OrderID, OrderDate, OrderStatus, RetailID, EquipmentID, ConnectionTypeID, SecurityDeposit) values(@orderID, getdate(), 'No', @employeeID, @equipmentID, @connectionTypeID, @securityDeposit)";
            sp[0] = new SqlParameter("@orderID", orderID);
            sp[1] = new SqlParameter("@employeeID", employeeID);
            sp[2] = new SqlParameter("@equipmentID", equipmentID);
            sp[3] = new SqlParameter("@connectionTypeID", connectionTypeID); 
            sp[4] = new SqlParameter("@securityDeposit", securityDeposit); 
            
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

        public DataTable LoadEquipment()
        {
            return objData.LoadData("select EquipmentID, EquipmentName from Equipment");  
        }
        public int LoadConnectionTypeID(string typeID)
        {
            sql = "select ConnectionTypeID from ConnectionType where DialUpID = @typeID or BroadBandID = @typeID or LandLineID = @typeID";            
            sp = new SqlParameter("@typeID", typeID);
            
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
        public int LoadCountID()
        {
            int count=0;
            
            try
            {
                return count = (int)objData.LoadData("select CountMember from CountID where ID = 'Order'").Rows[0][0];
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
        public int UpdateCountID(int count)
        {
            sql = "update CountID set CountMember = @count where ID = 'Order'";
            sp = new SqlParameter("@count", count + 1);
            
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
        public DataTable LoadOrderList()
        {
            sql = "execute LoadOrdersList";
            return objData.LoadData(sql);
        }
        public DataTable SearchOrdersOrderID(string orderID)
        {
            sql = "Execute SearchOrderID @orderID";
            sp = new SqlParameter("@orderID", "%"+orderID+"%");
            return objData.LoadData(sql, sp);
        }
        public DataTable SearchOrdersCustomerID(string customerID)
        {
            sql = "execute SearchCustomerID @customerID";
            sp = new SqlParameter("@customerID", "%"+customerID+"%");
            return objData.LoadData(sql, sp);
        }
        public DataTable LoadOrderDetails(string orderID)
        {
            sql = "execute LoadOrderDetails @orderID";
            sp = new SqlParameter("@orderID", orderID);
            return objData.LoadData(sql, sp);// 
        }
        public string LoadOrderStatus(string orderID)
        {
            sql = "select OrderStatus from Orders where OrderID = @orderID";
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
        public DataTable SearchCustomerID(string text)
        {
            sql = "select CustomerID, CustomerName, Identification, OrderID, Quantity from Customers where CustomerID like @text";            
            sp = new SqlParameter("@text", "%"+text+"%");
            return objData.LoadData(sql, sp);
        }
        public DataTable SearchCustomerName(string text)
        {
            sql = "select CustomerID, CustomerName, Identification, OrderID, Quantity from Customers where CustomerName like @text";
            sp = new SqlParameter("@text", "%" + text + "%");
            return objData.LoadData(sql, sp);
        }
        public DataTable SearchOrderID(string text)
        {
            sql = "select CustomerID, CustomerName, Identification, OrderID, Quantity from Customers where OrderID like @text";
            sp = new SqlParameter("@text", "%" + text + "%");
            return objData.LoadData(sql, sp);
        }
        public DataTable LoadCustomers()
        {
            return objData.LoadData("select CustomerID, CustomerName, Identification, OrderID, Quantity from Customers");
        }
        public DataTable LoadCustomerDetails(string customerID)
        {
            sql = "select * from Customers where CustomerID = @customerID";
            sp = new SqlParameter("@customerID", customerID);
            return objData.LoadData(sql, sp);
        }
        public string getOrderID(string CusID)
        {
            sql = "select OrderID from Orders where customerID = @orderID";
            sp = new SqlParameter("@orderID", CusID);

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
