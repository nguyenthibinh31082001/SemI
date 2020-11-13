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
        public DataTable Plan()
        {
            return objData.LoadData("select * from Plans");
        }
        public DataTable DialUp()
        {
            return objData.LoadData("select DialUpID,Package,Duration,Price,Validity from DialUpConnection");
        }
        public DataTable BB()
        {
            return objData.LoadData("select BroadBandID,Package,Duration,Price,Validity from BroadBandConnection");
        }
        public DataTable LL()
        {
            return objData.LoadData("select LandLineID,Package,Duration,Price,Validity from LandLineConnection");
        }
        public DataTable LLCC()
        {
            return objData.LoadData("select * from LandLineCallCharge");
        }
    }
}
