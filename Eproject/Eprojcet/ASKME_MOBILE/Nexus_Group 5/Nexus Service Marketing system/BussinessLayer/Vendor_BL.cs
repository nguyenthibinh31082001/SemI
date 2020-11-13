using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;
namespace BussinessLayer
{
    public class Vendor_BL
    {
        Data objData = new Data();
        public DataTable DisplayVendor()
        {
            return objData.LoadData("select VendorID,VendorName,Phone from Vendors");
        }
        public DataTable DisplayVendorFull(string id)
        {
            string sqlDetail = "select * from Vendors where VendorID=@id";
            SqlParameter detail = new SqlParameter("@id", id);
            return objData.LoadData(sqlDetail, detail);
        }
     
        public DataTable SearchByName(string VendorName)
        {
            string sqlSearch = "select VendorID,VendorName,Phone from Vendors WHERE VendorName LIKE '%' + @name + '%'";
            SqlParameter spSer = new SqlParameter("@name", VendorName);
            return objData.LoadData(sqlSearch, spSer);
        }
        public DataTable SearchByID(string EquipID)
        {
            string sqlSearch = "select VendorID,VendorName,Phone from Vendors WHERE VendorID LIKE '%' + @name + '%'";
            SqlParameter spSer = new SqlParameter("@name", EquipID);
            return objData.LoadData(sqlSearch, spSer);
        }

        public int InsertVendor(string VendorID, string VendorName, string Address, string phone, string FAX)
        {
            string sqlInsert = "insert into Vendors values(@id,@name,@Add,@phone,@FAX)";
            SqlParameter[] spIns = new SqlParameter[5];
            spIns[0] = new SqlParameter("@id", VendorID);
            spIns[1] = new SqlParameter("@name", VendorName);
            spIns[2] = new SqlParameter("@Add", Address);
            spIns[3] = new SqlParameter("@phone", phone);
            spIns[4] = new SqlParameter("@FAX", FAX);
            try
            {
                return objData.Insert_Update_Delete(sqlInsert, spIns);
            }
            catch (SqlException)
            {
                return 0;
            }
        }
        public int UpdateVendor(string VendorID, string VendorName, string Address, string phone, string FAX)
        {
            string sqlUpdate = "Update Vendors set VendorName=@name,Address=@Add,phone=@phone,FAX=@FAX where VendorID=@id";
            SqlParameter[] spIns = new SqlParameter[5];
            spIns[0] = new SqlParameter("@id", VendorID);
            spIns[1] = new SqlParameter("@name", VendorName);
            spIns[2] = new SqlParameter("@Add", Address);
            spIns[3] = new SqlParameter("@phone", phone);
            spIns[4] = new SqlParameter("@FAX", FAX);
            return objData.Insert_Update_Delete(sqlUpdate, spIns);
        }
        public int DeleteVendor(string id)
        {
            string sqlDelete = "Delete from Vendors where VendorID=@id";
            SqlParameter spDel = new SqlParameter("@id", id);
            try
            {
                 return objData.Insert_Update_Delete(sqlDelete, spDel);
            }
            catch (Exception)
            {
                
              return 0;
            }
        }
    }
}
