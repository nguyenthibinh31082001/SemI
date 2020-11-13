using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;
namespace BussinessLayer
{
    public class Equipment_BL
    {
        Data objData = new Data();
        public DataTable DisplayEquip()
        {
            return objData.LoadData("select EquipmentID,EquipmentName,Price,Warranty from Equipment");
        }
        public DataTable DisplayEquipFull(string id)
        {
            string sqlDetail = "select  EquipmentID,EquipmentName as 'EquipmentName',vendorname as 'Vendor Name',Price,Warranty,EquipmentTypeName as 'Equipment Type' "+ 
                " from Equipment e,vendors v, equipmenttype et WHERE e.VendorID=v.VendorID and e.EquipmenttypeID=et.EquipmenttypeID and EquipmentID=@id";
            SqlParameter detail = new SqlParameter("@id", id);
            return objData.LoadData(sqlDetail, detail);
        }

        public DataTable DisplayEquipEdit(string id)
        {
            string sqlDetail = "select  EquipmentID,EquipmentName ,vendorID ,Price,Warranty,EquipmentTypeID from Equipment  WHERE EquipmentID=@id";
            SqlParameter detail = new SqlParameter("@id", id);
            return objData.LoadData(sqlDetail, detail);
        }

        public DataTable SearchByName(string EquipName)
        {
            string sqlSearch = "select EquipmentID,EquipmentName,Price,Warranty from Equipment WHERE EquipmentName LIKE '%' + @name + '%'";
            SqlParameter spSer = new SqlParameter("@name", EquipName);
            return objData.LoadData(sqlSearch, spSer);
        }
        public DataTable SearchByVendorName(string vendorID)
        {
            string sql = "select EquipmentID,EquipmentName,Price,Warranty from Equipment,vendors WHERE Equipment.VendorID=vendors.VendorID and vendors.VendorName LIKE '%' + @id + '%'";
            SqlParameter spSer = new SqlParameter("@id", vendorID);
            return objData.LoadData(sql, spSer);
        }
     
        public int InsertEqiup(string EquipmentID, string EquipmentName, string VendorID, float Price, float Warranty, int EquipmentTypeID)
        {
            string sqlInsert = "insert into Equipment values(@id,@name,@VendorID,@Price,@War,@EquipTypeID)";
            SqlParameter[] spIns = new SqlParameter[6];
            spIns[0] = new SqlParameter("@id", EquipmentID);
            spIns[1] = new SqlParameter("@name", EquipmentName);
            spIns[2] = new SqlParameter("@VendorID", VendorID);
            spIns[3] = new SqlParameter("@Price", Price);
            spIns[4] = new SqlParameter("@War", Warranty);
            spIns[5] = new SqlParameter("@EquipTypeID", EquipmentTypeID);
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
        public int UpdateEquip(string EquipmentID, string EquipmentName, string VendorID, float Price, float Warranty, int EquipmentTypeID)
        {
            string sqlUpdate = "Update Equipment set EquipmentName=@name,VendorID=@VendorID,Price=@Price,Warranty=@War,EquipmentTypeID=@EquipTypeID where EquipmentID=@id";
            SqlParameter[] spIns = new SqlParameter[6];
            spIns[0] = new SqlParameter("@id", EquipmentID);
            spIns[1] = new SqlParameter("@name", EquipmentName);
            spIns[2] = new SqlParameter("@VendorID", VendorID);
            spIns[3] = new SqlParameter("@Price", Price);
            spIns[4] = new SqlParameter("@War", Warranty);
            spIns[5] = new SqlParameter("@EquipTypeID", EquipmentTypeID);
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
        public int DeleteEquip(string id)
        {
            string sqlDelete = "Delete from Equipment where EquipmentID=@id";
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
