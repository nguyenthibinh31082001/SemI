using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;

namespace BussinessLayer
{
    public class count_BL
    {
        Data objData = new Data();
        public DataTable CountEmployee()
        {
            string sql = "select max(cast(substring(EmployeeID,4,10)as int)) from Employee";
            return objData.LoadData(sql) ;
        }
    }
}
