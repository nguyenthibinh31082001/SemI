using System;
using System.Collections.Generic;
using System.Text;
using EnCryptDecrypt;
using DataLayer;
using System.Data.SqlClient;
using System.Data;

namespace BussinessLayer
{
    public class LoginWeb
    {
        Data objData = new Data();
        public DataTable CheckLogin(string username, string password)
        {
            string sql="select * from members where username=@name and password=@pass";
            SqlParameter[] sp= new SqlParameter [2];
            sp[0]= new SqlParameter ("@name",username);
            sp[1]= new SqlParameter ("@pass",password);
            return objData.LoadData(sql, sp);
        }

        public void ChangePassword(string user, string newPass)
        {
            string sql = "update members  set password=@pass where username=@name";
            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@name", user);
            sp[1] = new SqlParameter("@pass", newPass);
            objData.Insert_Update_Delete(sql, sp);
        }
        public void UpdateRole(string user, string newRole)
        {
            string sql = "update members  set Role_member=@role where username=@name";
            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@name", user);
            sp[1] = new SqlParameter("@role", newRole);
            
            try
            {
                objData.Insert_Update_Delete(sql, sp);
            }
            catch (SqlException)
            {
                
            }
            catch (Exception)
            {
                
            }
        }
    }
}
