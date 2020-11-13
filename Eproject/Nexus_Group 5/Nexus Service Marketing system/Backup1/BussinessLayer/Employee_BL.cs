using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data.SqlClient;
using System.Data;

namespace BussinessLayer
{
   public class Employee_BL
    {
       Data objData = new Data();

       public DataTable DisplayEmployee()
       {
          return objData.LoadData("select EmployeeID ,employeeName as Name,Email,Phone,EmployeeRole as Role from Employee");
       }
       public DataTable DisplayEmployeeFull(string id)
       {
           string sql = "select * from Employee where EmployeeID=@id";
           SqlParameter sp = new SqlParameter("@id", id);
           return objData.LoadData(sql, sp);

       }

       public int InsertEmployee(string ID,string name,string identification ,string birthday,string sex,string add, string district, string city, string email, string phone,string role, string retailID, string dateJoin)
       {
           string sqlInsert = "insert into Employee values(@id,@name,@identification,@birthday,@sex,@add,@district,@city,@email,@phone,@role,@retailID,@dateJoin)";
           SqlParameter[] sp = new SqlParameter[13];
           sp[0] = new SqlParameter("id",ID);
           sp[1] = new SqlParameter("@name",name);
           sp[2] = new SqlParameter("@birthday",birthday);
           sp[3] = new SqlParameter("@add",add);
           sp[4] = new SqlParameter("district",district);
           sp[5] = new SqlParameter("@city",city);
           sp[6] = new SqlParameter("@email",email);
           sp[7] = new SqlParameter("@phone",phone);
           sp[8] = new SqlParameter("@role",role);
           sp[9] = new SqlParameter("@retailId",retailID);
           sp[10] = new SqlParameter("@dateJoin",dateJoin);
           sp[11] = new SqlParameter("@identification",identification);
           sp[12] = new SqlParameter("@sex",sex);
           try
           {
                return objData.Insert_Update_Delete(sqlInsert, sp);
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

       public int ChangeProfileEmployee(string id, string birthday, string sex,string add, string district, string city,string mail, string phone)
       {
           string sql = "update employee set Birthday=@birthday,sex=@sex,address=@add,district=@district,city=@city,email=@mail,phone=@phone where EmployeeID=@id";
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

       public int UpdateEmployee(string Role, string ID)
       {
           string sql = "update employee set EmployeeRole=@Role where EmployeeID=@ID";
           SqlParameter[] sp = new SqlParameter[2];
           sp[0] = new SqlParameter("@Role", Role);
           sp[1] = new SqlParameter("@ID", ID);
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

       public int DeleteEmployee(string id)
       {
           string sql = "delete from Employee where EmployeeID=@ID";
           SqlParameter sp = new SqlParameter("@ID",id);
           try
           {
               return objData.Insert_Update_Delete(sql,sp); 
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
       public DataTable SearchByName(string value)
       {
           string sql = "select EmployeeID ,employeeName as Name,Email,Phone,EmployeeRole as Role from Employee where EmployeeName like @value";
           SqlParameter sp = new SqlParameter("@value", "%"+value+"%");
           return objData.LoadData(sql, sp);
       }
       public DataTable SearchByID(string value)
       {
           string sql = "select EmployeeID ,employeeName as Name,Email,Phone,EmployeeRole as Role from Employee where EmployeeID like @value";
           SqlParameter sp = new SqlParameter("@value", "%" + value + "%");
           return objData.LoadData(sql, sp);
       }
    }
}
