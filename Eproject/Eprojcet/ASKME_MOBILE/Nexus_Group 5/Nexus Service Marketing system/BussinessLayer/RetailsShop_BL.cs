using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataLayer;
namespace BussinessLayer
{
    public class RetailsShop_BL
    {
        Data objData = new Data();
        public DataTable DisplayRTS()
        {
            return objData.LoadData("select RetailID,RetailName,Email,Phone from retailsShop");
        }
        public DataTable DisplayRTSFull(string id,params SqlParameter[] spDet)
        {
            string sqlDetail = "select * from retailsShop where RetailID=@id";
            SqlParameter detail = new SqlParameter("@id", id);
            return objData.LoadData(sqlDetail, detail);
        }

        public DataTable SearchRTSByName(string retailName)
        {
            string sqlSearch = "SELECT RetailID,RetailName,Email,Phone FROM [RetailsShop] WHERE ([RetailName] LIKE '%' + @name + '%')";
            SqlParameter spSer = new SqlParameter("@name", retailName);
            return objData.LoadData(sqlSearch, spSer);
        }
        public DataTable SearchRTSByID(string ID)
        {
            string sql = "SELECT RetailID,RetailName,Email,Phone FROM [RetailsShop] WHERE ([RetailID] LIKE '%' + @id + '%')";
            SqlParameter spSer = new SqlParameter("@id", ID);
            return objData.LoadData(sql, spSer);
        }
        public int InsertRetailsShop(string retailID, string retailName, string address, string district, string city, string email, string phone)
        {
            string sqlInsert = "insert into retailsShop values(@id,@name,@add,@di,@ci,@email,@phone)";
            SqlParameter[] spIns = new SqlParameter[7];
            spIns[0] = new SqlParameter("@id", retailID);
            spIns[1] = new SqlParameter("@name", retailName);
            spIns[2] = new SqlParameter("@add", address);
            spIns[3] = new SqlParameter("@di", district);
            spIns[4] = new SqlParameter("@ci", city);
            spIns[5] = new SqlParameter("@email", email);
            spIns[6] = new SqlParameter("@phone", phone);
            try
            {
                 return objData.Insert_Update_Delete(sqlInsert, spIns);
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
        public int UpdateRetailShop(string retailID, string retailName, string address, string district, string city, string email, string phone)
        {
            string sqlUpdate = "Update retailsShop set RetailName=@name,Address=@add,District=@di,City=@ci,Email=@email,Phone=@phone where RetailID=@id";
            SqlParameter[] spUpd = new SqlParameter[7];
            spUpd[0] = new SqlParameter("@id", retailID);
            spUpd[1] = new SqlParameter("@name", retailName);
            spUpd[2] = new SqlParameter("@add", address);
            spUpd[3] = new SqlParameter("@di", district);
            spUpd[4] = new SqlParameter("@ci", city);
            spUpd[5] = new SqlParameter("@email", email);
            spUpd[6] = new SqlParameter("@phone", phone);
            try
            {
                return objData.Insert_Update_Delete(sqlUpdate, spUpd);
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
        public int DeleteRetailShop(string retailID)
        {
            string sqlDelete = "Delete from retailsShop where RetailID=@id";
            SqlParameter[] spDel = new SqlParameter[1];
            spDel[0] = new SqlParameter("@id", retailID);
            try
            {
                 return objData.Insert_Update_Delete(sqlDelete, spDel);
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
