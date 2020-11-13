using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;
using EnCryptDecrypt;

namespace BussinessLayer
{
   public class Common
    {
        Data objdata = new Data();
        public DataTable ddlCity()
        {
            return objdata.LoadData("select * from City");
        }
        public DataTable ddlCityByID(string CityName)
        {
            string sql = "select CityID from City where CityName=@Name";
            SqlParameter sp = new SqlParameter("@Name",CityName);
            return objdata.LoadData(sql, sp);
        }
        public DataTable ddlDistrict(string CityID)
        {
            string sql = "select * from District where CityID=@ID";
            SqlParameter sp = new SqlParameter("@ID", CityID);
            return objdata.LoadData(sql,sp);
        }
        public DataTable ddlDistrictByID(string DistrictName)
        {
            string sql = "select DistrictID from District where DistrictName=@Name";
            SqlParameter sp = new SqlParameter("@Name",DistrictName);
            return objdata.LoadData(sql, sp);
        }
        public DataTable ddlRetailsShop()
        {
            return objdata.LoadData("select * from RetailsShop");
        }
        public DataTable ddlRetailsShopByID(string name)
        {
            string sql = "select RetailID from RetailsShop where RetailName=@name";
            SqlParameter sp = new SqlParameter("@name", name);
            return objdata.LoadData(sql, sp);
        }
        public DataTable ddlVendor()
        {
          //  string sql = ;
          //  SqlParameter sp = new SqlParameter("@Name", CityName);
            return objdata.LoadData("select * from vendors");
        }
        public DataTable ddlEquipType()
        {
            //  string sql = ;
            //  SqlParameter sp = new SqlParameter("@Name", CityName);
            return objdata.LoadData("select * from EquipmentType");
        }
        public int CountID(string value)
        {
            string sql="select CountMember from CountID where ID=@value";
            SqlParameter sp = new SqlParameter("@value", value);
            try
            {
                return int.Parse(objdata.LoadData(sql,sp).Rows[0][0].ToString());
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
        public void updateID(int newValue,string ID)
        {
            string sql = "update CountID set CountMember=@newValue where ID=@ID";
            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@newValue", newValue);
               sp[1]= new  SqlParameter("@ID", ID);
               
               try
               {
                    objdata.Insert_Update_Delete(sql, sp);
               }
               catch (SqlException)
               {
                  
               }
               catch (Exception)
               {
                   
               }
        }
        public void InsertMember(string username, string password, string role)
        {
            string sql = "insert into Members values(@user,@pass,@role)";
            SqlParameter[] sp = new SqlParameter[3];
            sp[0] = new SqlParameter("@user", username);
            sp[1] = new SqlParameter("@pass", CryptorEngine.Encrypt(password,true));
            sp[2] = new SqlParameter("@role",role);
            try
            {
                objdata.Insert_Update_Delete(sql, sp);
            }
            catch (SqlException)
            {
                
            }
            catch (Exception)
            {
               
            }
            
        }
        public void DeleteMember(string userName)
        {
            string sql = "delete from members where userName=@username";
            SqlParameter sp = new SqlParameter("@username", userName);
            
            try
            {
                 objdata.Insert_Update_Delete(sql, sp);
            }
            catch (SqlException)
            {
                
            }
            catch (Exception)
            {
               
            }
        }
        public DataTable SearchOrderID(string orderID)
        {
            string sql = "select OrderID, ConnectionStatus from Connections where OrderID like @orderID";
            SqlParameter sp = new SqlParameter("@orderID", "%" + orderID + "%");
            return objdata.LoadData(sql, sp);
        }
        public DataTable LoadBills()
        {
            return objdata.LoadData("execute LoadBills");
        }
        public DataTable LoadBillDetails(string orderID)
        {
            string sql = "execute LoadBillDetails @orderID";
            SqlParameter sp = new SqlParameter("@orderID", orderID);
            return objdata.LoadData(sql, sp);
        }
        public DataTable SearchBillOrderID(string orderID)
        {
            string sql = "execute SearchBillOrderID @orderID";
            SqlParameter sp = new SqlParameter("@orderID", "%" + orderID + "%");
            return objdata.LoadData(sql, sp);
        }
        public DataTable SearchBillCustomerID(string customerID)
        {
            string sql = "execute SearchBillCustomerID @customerID";
            SqlParameter sp = new SqlParameter("@customerID", "%" + customerID + "%");
            return objdata.LoadData(sql, sp);
        }
        public DataTable SearchBillDate(int month,int year)
        {
            string sql = "execute SearchBillDate @month,@year";
            SqlParameter[] sp = new SqlParameter[2];
                sp[0] = new SqlParameter("@month", month);
                sp[1] = new SqlParameter("@year",year);
            return objdata.LoadData(sql, sp);
        }
        public int UpdateBillStatus(string pay, int month, int year, string customerID)
        {
            string sql = "execute EditBill @pay, @month, @year, @customerID";
            SqlParameter[] sp = new SqlParameter[4];
            sp[0] = new SqlParameter("@pay", pay);
            sp[1] = new SqlParameter("@month", month);
            sp[2] = new SqlParameter("@year", year);
            sp[3] = new SqlParameter("@customerID", customerID);
            return objdata.Insert_Update_Delete(sql, sp);

        }
        public DataTable LoadBillsCustomer(string customerID)
        {
            string sql = "execute LoadBillsCustomer @customerID";
            SqlParameter sp = new SqlParameter("@customerID", customerID);
            return objdata.LoadData(sql, sp);
        }
        public DataTable LoadBillDetailsCustomer(string customerID, int month, int year)
        {
            string sql = "execute  LoadBillDetailsCustomer @customerID, @month, @year";
            SqlParameter[] sp = new SqlParameter[3];
            sp[0] = new SqlParameter("@customerID", customerID);
            sp[1] = new SqlParameter("@month", month);
            sp[2] = new SqlParameter("@year", year);
            return objdata.LoadData(sql, sp);
        }
    }
}
