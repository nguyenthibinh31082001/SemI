using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class View_Registrator : System.Web.UI.Page
{
    DataLinkQDataContext db = new DataLinkQDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //
    public void Reset()
    {
        txtuser.Text = "";
        txtpass.Text = "";
        txtname.Text = "";
        txtphone.Text = "";
        txtemail.Text = "";
        txtaddress.Text = "";
        txtaccnumber.Text = "";
        droptypefees.Text = "Month";
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string username = txtuser.Text;
            string pass = txtpass.Text;
            string name = txtname.Text;
            float phone = float.Parse(txtphone.Text);
            string email = txtemail.Text;
            string address = txtaddress.Text;
            string date = DateTime.Now.ToShortDateString();
            string drtypefees = droptypefees.Text;

            DateTime? dateexpired=null;

            if (drtypefees.Equals("Month"))
            {
                dateexpired = DateTime.Parse(dateexpired.ToString()).AddDays(30);
            }
            else
            {
                dateexpired = DateTime.Parse(dateexpired.ToString()).AddDays(365);
            }

            float money = 1000;
            if (drtypefees.Equals("Month"))
            {

                money = money - 15;
            }
            else {
                money = money - 150;
            }

            float accnumber = float.Parse(txtaccnumber.Text);
            try
            {

                //CUSTOMER cs = new CUSTOMER();

                //cs.CAddress = address;
                //cs.CEmail = email;
                //cs.CName = name;
                //cs.CPassWord = pass;
                //cs.CPhone = phone;
                //cs.CUserName = username;
                //cs.AccountNumber = accnumber;
                //cs.
                //db.CUSTOMERs.InsertOnSubmit(cs);
                //db.SubmitChanges();

                SqlCommand cmd = DataAccess.Connection.CreateCommand();
                cmd.CommandText = "insert into CUSTOMER values( @username, @pass, @name, @phone, @email, @address, @accnumber, @amount, @typefees, @date, @dateexpire)";

                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@pass", pass);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@accnumber", accnumber);
                cmd.Parameters.AddWithValue("@amount", money);
                cmd.Parameters.AddWithValue("@typefees", drtypefees);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@dateexpire", dateexpired);

                cmd.ExecuteNonQuery();

                lbstatus.Text = "Register successful";
                Reset();

            }
            catch (Exception ex)
            {
                lbstatus.Text = "Register not success";
            }
        }
        catch (Exception ex)
        {
            lbstatus.Text="Anh thái oi "+ex;
        }
    }
}