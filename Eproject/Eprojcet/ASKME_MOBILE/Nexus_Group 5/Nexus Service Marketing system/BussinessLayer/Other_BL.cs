using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;

namespace BussinessLayer
{
   public class Other_BL
    {
       Data objData = new Data();
       string sql = "";
       SqlParameter sp;

       //public DataTable oder()
       //{
       //    return objData.LoadData("select * from Orders");
       //}
       public DataTable chan() 
       {
           return objData.LoadData("select * From Orders");
                 
       }
       public DataTable LoadCity()
       {
           return objData.LoadData("select * from City");
       }
       public DataTable LoadCityDetails(string cityID)
       {
           sql = "select * from City where CityID = @cityID";
           sp = new SqlParameter("@cityID", cityID);
           return objData.LoadData(sql, sp);
       }
       public int InsertCity(string cityID, string cityName)
       {
           sql = "insert into City values (@cityID, @cityName)";
           SqlParameter[] sp = new SqlParameter[2];
           sp[0] = new SqlParameter("@cityID", cityID);
           sp[1] = new SqlParameter("@cityName", cityName);
           return objData.Insert_Update_Delete(sql, sp);
       }
       public int UpdateCity(string cityID, string cityName)
       {
           sql = "update City set CityName = @cityName where CityID = @cityID";
           SqlParameter[] sp = new SqlParameter[2];
           sp[0] = new SqlParameter("@cityID", cityID);
           sp[1] = new SqlParameter("@cityName", cityName);
           return objData.Insert_Update_Delete(sql, sp);
       }
       public int DeleteCity(string cityID)
       {
           sql = "delete City where CityID = @cityID";
           sp = new SqlParameter("@cityID", cityID);
           return objData.Insert_Update_Delete(sql, sp);
       }
       public DataTable LoadDistrict()
       {
           return objData.LoadData("select DistrictID,DistrictName,CityName from District,City where District.CityID=City.CityID ");
       }
       public DataTable LoadDistrictDetailsCity(string districtID)
       {
           sql = "select * from District where DistrictID = @districtID";
           sp = new SqlParameter("@districtID", districtID);
           return objData.LoadData(sql, sp);
       }
       public DataTable LoadDistrictDetails(string districtID)
       {
           sql = "select DistrictID,DistrictName,CityName CityName from District,City where District.CityID=City.CityID and DistrictID = @districtID";
           sp = new SqlParameter("@districtID", districtID);
           return objData.LoadData(sql, sp);
       }
       public int InsertDistrict(string districtID, string districtName, string cityID)
       {
           sql = "insert into District values (@districtID, @districtName, @cityID)";
           SqlParameter[] sp = new SqlParameter[3];
           sp[0] = new SqlParameter("@districtID", districtID);
           sp[1] = new SqlParameter("@districtName", districtName);
           sp[2] = new SqlParameter("@cityID", cityID);
           return objData.Insert_Update_Delete(sql, sp);
       }
       public int UpdateDistrict(string districtID, string districtName, string cityID)
       {
           sql = "update District set DistrictName = @districtName, CityID = @cityID where DistrictID = @districtID";
           SqlParameter[] sp = new SqlParameter[3];
           sp[0] = new SqlParameter("@districtID", districtID);
           sp[1] = new SqlParameter("@districtName", districtName);
           sp[2] = new SqlParameter("@cityID", cityID);
           return objData.Insert_Update_Delete(sql, sp);
       }
       public int DeleteDistrict(string districtID)
       {
           sql = "delete District where DistrictID = @districtID";
           sp = new SqlParameter("@districtID", districtID);
           return objData.Insert_Update_Delete(sql, sp);
       }

       public DataTable LoadEquipmentType()
       {
           return objData.LoadData("select * from EquipmentType");
       }
       public DataTable LoadEquipmentTypeDetails(int equipmentTypeID)
       {
           sql = "select * from EquipmentType where equipmentTypeID = @equipmentTypeID";
           sp = new SqlParameter("@equipmentTypeID", equipmentTypeID);
           return objData.LoadData(sql, sp);
       }
       public int InsertEquipmentType( string equipmentTypeName, string description)
       {
           sql = "insert into EquipmentType values ( @equipmentTypeName, @description)";
           SqlParameter[] sp = new SqlParameter[2];
           sp[1] = new SqlParameter("@equipmentTypeName", equipmentTypeName);
           sp[0] = new SqlParameter("@description", description);
           return objData.Insert_Update_Delete(sql, sp);
       }
       public int UpdateEquipmentType(int equipmentTypeID, string equipmentTypeName, string description)
       {
           sql = "update EquipmentType set equipmentTypeName = @equipmentTypeName, Description = @description where equipmentTypeID = @equipmentTypeID";
           SqlParameter[] sp = new SqlParameter[3];
           sp[0] = new SqlParameter("@equipmentTypeID", equipmentTypeID);
           sp[1] = new SqlParameter("@equipmentTypeName", equipmentTypeName);
           sp[2] = new SqlParameter("@description", description);
           return objData.Insert_Update_Delete(sql, sp);
       }
       public int DeleteEquipmentType(int equipmentTypeID)
       {
           sql = "delete EquipmentType where EquipmentTypeID = @equipmentTypeID";
           sp = new SqlParameter("@equipmentTypeID", equipmentTypeID);
           return objData.Insert_Update_Delete(sql, sp);
       }
    }
}
