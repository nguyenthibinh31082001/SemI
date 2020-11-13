using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using System.Data.SqlClient;

namespace BussinessLayer
{
    public class FeedBack_BL
    {
        Data objData = new Data();
        public DataTable DisplayFeedBack()
        {
            return objData.LoadData("select FeedbackID,DateSend,Title,status from FeedBack");
        }
        public DataTable DisplayFeedBackFull(string ID)
        {
            string sql = "select * from FeedBack where FeedbackID=@id";
            SqlParameter sp = new SqlParameter("@id", ID);
            return objData.LoadData(sql,sp);
        }

        public DataTable DisplayFeedBackFullCus(string ID)
        {
            string sql = "select CustomerID as 'Customer ID',Title,ContentFB as 'Content of Feedback',Answer,DateSend,DateAnswer from FeedBack where FeedbackID=@id";
            SqlParameter sp = new SqlParameter("@id", ID);
            return objData.LoadData(sql, sp);
        }

        public DataTable DisplayFeedBackStatus(string status)
        {
            string sql = "select FeedbackID,DateSend,Title,status from FeedBack where status=@stt";
            SqlParameter sp = new SqlParameter("@stt", status);
            return objData.LoadData(sql, sp);
        }
        public DataTable DisplayFeedBackStatusCus(string status)
        {
            string sql = "select FeedbackID,Title,DateSend from FeedBack where status=@stt";
            SqlParameter sp = new SqlParameter("@stt", status);
            return objData.LoadData(sql, sp);
        }
        public int InsertFeedBack(string customerID, string dateSend, string title, string contentFB, string status)
        {
            string sqlInsert = "insert into FeedBack (customerid,datesend,title,contentFB,status) values(@cusID,@dateSend,@title,@contentFB,@status)";
            SqlParameter[] sp = new SqlParameter[5];
            sp[1] = new SqlParameter("@cusID", customerID);
            sp[2] = new SqlParameter("@dateSend", dateSend);
            sp[4] = new SqlParameter("@title", title);
            sp[3] = new SqlParameter("@contentFB", contentFB);
            sp[0] = new SqlParameter("@status",status);
            try
            {
                  return objData.Insert_Update_Delete(sqlInsert, sp);
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

        public void AnswerFeedback(string id,string title, string content,string answer,string stt)
        {
            string sql = "update Feedback set Title=@title,status=@stt,contentFB=@content,answer=@ans,dateanswer=getdate() where FeedbackID=@id";
            SqlParameter[] sp = new SqlParameter[5];
            sp[0] = new SqlParameter("@title", title);
            sp[1] = new SqlParameter("@content",content);
            sp[2] = new SqlParameter("@stt",stt);
            sp[3] = new SqlParameter("@ans",answer);
            sp[4] = new SqlParameter("@id", id);
            try
            {
                 objData.LoadData(sql, sp);
            }
            catch (SqlException)
            {
                
            }
            catch (Exception)
            {
                
            }
           
        }
        public void DeleteFB(string id)
        {
            string sql = "delete from FeedBack where FeedbackID=@id";
            SqlParameter sp = new SqlParameter("@id", id);
            try
            {
                objData.LoadData(sql, sp);
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
