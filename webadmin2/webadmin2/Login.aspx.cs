using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webadmin2
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-M126M0V;Initial Catalog=QLSV3;Persist Security Info=True;User ID=sa;Password=123456;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["masinhvien"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }
        DataTable LoadTable(string query, SqlParameter[] parameters)
        {
            conn.Open();
            var cmd = new SqlCommand(query, conn);

            if (parameters != null)
            {
                cmd.Parameters.AddRange(parameters);
            }
            var dr = cmd.ExecuteReader();
            var dt = new DataTable();
            dt.Load(dr);
            dr.Dispose();
            conn.Close();
            return dt;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            var query = "SELECT * FROM [dbo].[Student] WHERE masinhvien = @masinhvien AND matkhau = @matkhau";
            SqlParameter[] parameters = {
                new SqlParameter("@masinhvien", txtMaSinhVien.Text),
                new SqlParameter("@matkhau", txtPassword.Text)
            };


            var dt = LoadTable(query, parameters);
            if (dt.Rows.Count > 0)
            {

                Session["masinhvien"] = txtMaSinhVien.Text;
                Session["role"] = dt.Rows[0]["roles"].ToString();


                Response.Redirect("Default.aspx");
            }
            else
            {

                Response.Write("<center>Vui lòng kiểm tra lại mã sinh viên hoặc mật khẩu</center>");
            }
        }
    }
}