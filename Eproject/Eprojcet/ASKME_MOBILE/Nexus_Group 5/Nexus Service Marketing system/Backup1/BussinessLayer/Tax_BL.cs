using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;

namespace BussinessLayer
{
    public class Tax_BL
    {
        Data objData = new Data();
        public DataTable DisplayTaxFull()
        {
            return objData.LoadData("select * from Tax");
        }

        public DataTable DisplayTaxEdit(int id)
        {
            string sql = "select * from Tax where TaxID=@id";
            SqlParameter sp = new SqlParameter("@id",id);
            return objData.LoadData(sql,sp);
        }

        public int InsertTax( string TaxName, float value,string Description)
        {
            string sqlInsert = "insert into Tax values(@name,@value,@des)";
            SqlParameter[] spIns = new SqlParameter[3];
            spIns[0] = new SqlParameter("@value", value);
            spIns[1] = new SqlParameter("@name", TaxName);
            spIns[2] = new SqlParameter("@des", Description);
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
        public int UpdateTax(int id ,string TaxName, float value, string Description)
        {
            string sqlUpdate = "update tax set TaxName=@name,taxvalue=@value,Description=@des where Taxid=@id";
            SqlParameter[] spIns = new SqlParameter[4];
            spIns[0] = new SqlParameter("@value", value);
            spIns[1] = new SqlParameter("@name", TaxName);
            spIns[2] = new SqlParameter("@des", Description);
            spIns[3] = new SqlParameter("@id",id);
            try
            {
                 return objData.Insert_Update_Delete(sqlUpdate, spIns);
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
        public int DeleteTax(string id)
        {
            string sqlDelete = "Delete from Tax where TaxID=@id";
            SqlParameter spDel = new SqlParameter("@id", id);
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
