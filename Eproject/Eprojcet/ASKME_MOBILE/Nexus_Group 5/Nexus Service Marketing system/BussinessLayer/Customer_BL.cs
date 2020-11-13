using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;

namespace BussinessLayer
{
  public   class Customer_BL
    {
        Data objData = new Data();

        public DataTable DisplayCustomer()
        {
            return objData.LoadData("select CustomerID ,CustomerName as Name,Identification,Email,Phone from Customers");
        }
        public DataTable DisplayCustomerFull(string id)
        {
            string sql = "select * from Customers where CustomerID=@id";
            SqlParameter sp = new SqlParameter("@id", id);
            return objData.LoadData(sql, sp);

        }
        public int ChangeProfileCustomer(string id, string birthday, string sex, string add, string district, string city, string mail, string phone)
        {
            string sql = "update Customers set Birthday=@birthday,sex=@sex,address=@add,district=@district,city=@city,email=@mail,phone=@phone where CustomerID=@id";
            SqlParameter[] sp = new SqlParameter[8];
            sp[0] = new SqlParameter("id", id);
            sp[1] = new SqlParameter("@birthday", birthday);
            sp[2] = new SqlParameter("@sex", sex);
            sp[3] = new SqlParameter("@add", add);
            sp[4] = new SqlParameter("district", district);
            sp[5] = new SqlParameter("@city", city);
            sp[6] = new SqlParameter("@mail", mail);
            sp[7] = new SqlParameter("@phone", phone);
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

        public DataTable getConnectionID(string cusID)
        {
            string sql = "select connectionid from connections con,orders ord,customers cus "+
                            "where con.orderid=ord.orderid and ord.customerid=cus.customerid and cus.customerid=@id";
            SqlParameter sp = new SqlParameter("@id", cusID);
            return objData.LoadData(sql, sp);
        }

    }
}
