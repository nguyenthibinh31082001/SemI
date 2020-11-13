using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;

namespace BussinessLayer
{
    public class Connection_BL
    {
        Data objData = new Data();
        public DataTable DetailConnection(string type,int id)
        {
            string sql;
            
            if (type.Substring(0, 1).Equals("D"))
                sql = "exec ConnectionDialUp @id";
            else if (type.Substring(0, 1).Equals("B"))
                sql = "exec ConnectionBB @id";
            else
                sql = "exec ConnectionLL @id";
            SqlParameter sp = new SqlParameter("@id", id);
            return objData.LoadData(sql, sp);
        }

        public DataTable LoadConnections()
        {
            return objData.LoadData("select * from Connections");
        }
        public DataTable GetOrderID(int ID)
        {
            string sql = "select orderID,ConnectionStatus from Connections where connectionid=@id";
            SqlParameter sp = new SqlParameter("@id", ID);
            return objData.LoadData(sql, sp);
        }

        public int UpdateConnections(string connectionStatus, int id)
        {
            string sql = "update Connections set ConnectionStatus = @connectionStatus where connectionID = @ID";
            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@connectionStatus", connectionStatus);
            sp[1] = new SqlParameter("@ID", id);
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
