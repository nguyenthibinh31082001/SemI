using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class View_Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string id = Request["id"];
            AddToBasket(id);
            //lblError.Text = Session["bid"].ToString() + "<br>" + Session["qty"].ToString();
            ViewBasket();
        }
    }
    //
    private void AddToBasket(string bid)
    {
        try
        {
            if (Session["bid"].ToString() == "")
            {
                Session["bid"] += bid + ",";
                Session["qty"] += "1,";
            }
            else
            {
                //chuyển Session thành mảng và kiểm tra trùng sản phẩm
                string[] apid = Session["bid"].ToString().Split(new char[] { ',' });
                string[] aqty = Session["qty"].ToString().Split(new char[] { ',' });
                bool flag = false;
                for (int i = 0; i < apid.Length - 1; i++)
                {
                    if (apid[i] == bid)
                    {
                        int q = int.Parse(aqty[i]) + 1;
                        aqty[i] = q.ToString();
                        flag = true;
                        break;
                    }
                }
                if (flag == true)
                {
                    Session["bid"] = "";
                    Session["qty"] = "";
                    for (int i = 0; i < apid.Length - 1; i++)
                    {
                        Session["bid"] += apid[i] + ",";
                        Session["qty"] += aqty[i] + ",";
                    }
                }
                else
                {
                    Session["bid"] += bid + ",";
                    Session["qty"] += "1,";
                }

            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }

    }
    //
    //
    private void ViewBasket()
    {
        try
        {
            //chuyển Session thành mảng
            string[] apid = Session["bid"].ToString().Split(new char[] { ',' });
            string[] aqty = Session["qty"].ToString().Split(new char[] { ',' });
            //Tạo datatable chứa thông tin sản phẩm
            DataTable dt = new DataTable();
            DataColumn bookid = new DataColumn("bid", typeof(string));
            DataColumn bookname = new DataColumn("BookName", typeof(string));
            DataColumn quantity = new DataColumn("Quantity", typeof(int));
            DataColumn price = new DataColumn("Price", typeof(int));
            DataColumn amount = new DataColumn("Amount", typeof(int));

            dt.Columns.AddRange(new DataColumn[] { bookid, bookname, quantity, price, amount });

            BOOKRECIPE b;

            double tongtien = 0;
            for (int i = 0; i < apid.Length - 1; i++)
            {
                //thêm 1 dòng mới
                DataRow dr = dt.NewRow();
                //lấy thông tin sản phẩm dựa vào id
                //   p = new ProductDAL().GetProduct(apid[i]);
              SqlDataAdapter da = new SqlDataAdapter("select * from BOOKRECIPE where BId=id", DataAccess.ConnectionString);
            


                //dr["bid"] = apid[i];
                //dr["BookName"] = b.BName;
                //dr["Quantity"] = int.Parse(aqty[i]);
                //dr["Price"] = b.Price;
                //dr["Amount"] = int.Parse(aqty[i]) * b.Price;
                //tongtien += double.Parse(aqty[i]) * b.Price;
                dt.Rows.Add(dr);
            }
            grCart.DataSource = dt;
            grCart.DataBind();
            lblTotal.Text = "Tổng tiền:" + tongtien.ToString();

        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
   
    //
    public void DeleteBook(string bid)
    {
        //chuyển Session thành mảng
        string[] apid = Session["bid"].ToString().Split(new char[] { ',' });
        string[] aqty = Session["qty"].ToString().Split(new char[] { ',' });
        Session["bid"] = "";
        Session["qty"] = "";
        for (int i = 0; i < apid.Length - 1; i++)
        {
            if (apid[i] != bid)
            {
                Session["bid"] += apid[i] + ",";
                Session["qty"] += aqty[i] + ",";
            }
        }
    }
    //
    //
    public void UpdateBasket(string bid, int qty)
    {
        //chuyển Session thành mảng
        string[] apid = Session["bid"].ToString().Split(new char[] { ',' });
        string[] aqty = Session["qty"].ToString().Split(new char[] { ',' });
        for (int i = 0; i < apid.Length - 1; i++)
        {
            if (apid[i] == bid)
            {
                aqty[i] = qty.ToString();
                break;
            }
        }
        Session["bid"] = "";
        Session["qty"] = "";
        for (int i = 0; i < apid.Length - 1; i++)
        {
            Session["bid"] += apid[i] + ",";
            Session["qty"] += aqty[i] + ",";
        }
    }
    //

    protected void grCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string bid = grCart.DataKeys[e.RowIndex].Value.ToString();
        DeleteBook(bid);
        ViewBasket();
    }
    //
    protected void grCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grCart.EditIndex = -1;
        ViewBasket();
    }
    //
    protected void grCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string bid = grCart.DataKeys[e.RowIndex].Value.ToString();
        int qty = int.Parse(((TextBox)grCart.Rows[e.RowIndex].Cells[1].Controls[0]).Text);
        UpdateBasket(bid, qty);
        grCart.EditIndex = -1;
        ViewBasket();
    }
    //
    protected void grCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grCart.EditIndex = e.NewEditIndex;
        ViewBasket();
    }
    //
}