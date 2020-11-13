using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataLayer;

namespace BussinessLayer
{
    public class Plan_BL
    {
        Data objData= new Data ();
        //public DataTable oder()
        //{
        //    return objData.LoadData("select * from Orders");
        //}
        public DataTable oder() 
        {
            return objData.LoadData("select *from Orders");
        }
        public DataTable Plan()
        {
            return objData.LoadData("select * from Plans");
        }
        
        public DataTable DialUp()
        {
            return objData.LoadData("select * from DialUpConnection");
        }
        public DataTable BB()
        {
            return objData.LoadData("select * from BroadBandConnection");
        }
        public DataTable LL()
        {
            return objData.LoadData("select * from LandLineConnection");
        }
        public DataTable LLCC()
        {
            return objData.LoadData("select * from LandLineCallCharge");
        }
    }
}
