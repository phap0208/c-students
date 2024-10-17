using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webadmin2
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-M126M0V;Initial Catalog=QLSV3;Persist Security Info=True;User ID=sa;Password=123456;");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text == txtConfirmPassword.Text)
            {

                if (CheckEmail(txtEmail.Text))
                {

                    string[] parameter = { "masinhvien", "hovaten", "email", "sodt", "matkhau", "roles" };
                    object[] values = { txtMaSinhVien.Text, txtTenSinhVien.Text, txtEmail.Text, txtPhone.Text, txtPassword.Text, txtRoles.Text };

                    var query = "INSERT INTO [dbo].[Student](masinhvien, hovaten, email, sodt, matkhau, roles) VALUES(@masinhvien, @hovaten, @email, @sodt, @matkhau, @roles)";


                    ExecuteSQL(query, parameter, values);
                }
                else
                {
                    Response.Write("<center>Địa chỉ email không hợp lệ!</center>");
                }
            }
            else
            {

                txtPassword.Focus();
                Response.Write("<center>Kiểm tra lại mật khẩu!</center>");
            }
            void ExecuteSQL(string query, string[] parameter, object[] values)
            {
                try
                {

                    conn.Open();
                    var cmd = new SqlCommand(query, conn);


                    if (parameter != null)
                    {
                        for (var i = 0; i < parameter.Length; i++)
                            cmd.Parameters.AddWithValue("@" + parameter[i], values[i]);
                    }


                    cmd.ExecuteNonQuery();


                    Response.Write("<center>Đăng ký thành công! Bạn sẽ được chuyển đến trang đăng nhập </center>");
                    Response.Redirect("Login.aspx", false);
                }
                catch (Exception ex)
                {

                    Response.Write("<center>Error: " + ex.Message + "</center>");
                }
                finally
                {

                    conn.Close();
                }
            }
            bool CheckEmail(string email)
            {
                try
                {

                    new MailAddress(email);
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}