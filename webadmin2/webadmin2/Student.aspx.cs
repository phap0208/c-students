using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webadmin2
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["masinhvien"] == null)
            {
                Response.Write("<center>Vui lòng đăng nhập để xem danh sách sinh viên.</center>");
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {

                if (Session["role"] != null)
                {
                    string userRole = Session["role"].ToString();
                    EnableEditing(userRole == "admin");
                }
                else
                {

                    Response.Redirect("Login.aspx");
                }
            }
            btnDelete.Visible = false;
        }
        private void EnableEditing(bool enable)
        {
            txtFullName.ReadOnly = !enable;
            txtEmail.ReadOnly = !enable;
            txtMobilePhone.ReadOnly = !enable;
            txtPassword.ReadOnly = !enable;
            txtRoles.ReadOnly = !enable;
            btnSave.Visible = enable;
            btnDelete.Visible = (Session["role"] != null && Session["role"].ToString() == "admin");
            txtStudentCode.Enabled = true;
        }
        void Reset()
        {
            txtStudentCode.Text = txtFullName.Text = txtEmail.Text = txtMobilePhone.Text = txtPassword.Text = txtRoles.Text = "";
            txtStudentCode.Enabled = true;
            btnDelete.Visible = false;
        }
        private bool IsInputValid()
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtMobilePhone.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(txtRoles.Text))
            {
                return false;
            }

            return true;
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtStudentCode.Text = GridView1.SelectedRow.Cells[0].Text;
            txtFullName.Text = GridView1.SelectedRow.Cells[1].Text;
            txtEmail.Text = GridView1.SelectedRow.Cells[2].Text;
            txtMobilePhone.Text = GridView1.SelectedRow.Cells[3].Text;
            txtPassword.Text = GridView1.SelectedRow.Cells[4].Text;
            txtRoles.Text = GridView1.SelectedRow.Cells[5].Text;
            txtStudentCode.Enabled = false;
            btnDelete.Visible = (Session["role"] != null && Session["role"].ToString() == "admin");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Reset();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!IsInputValid())
            {
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin!');</script>");
                return;
            }
            if (txtStudentCode.Enabled)
            {

                SqlDataSourceStudent.Insert();
                Response.Write("<script>alert('Thêm sinh viên thành công!');</script>");
            }
            else
            {

                SqlDataSourceStudent.Update();
                Response.Write("<script>alert('Cập nhật thông tin sinh viên thành công!');</script>");
            }


            Reset();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Session["role"] != null && Session["role"].ToString() == "admin")
            {

                SqlDataSourceStudent.Delete();
                Reset();
                Response.Write("<script>alert('Xóa sinh viên thành công!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Bạn không có quyền xóa thông tin sinh viên!');</script>");
            }
        }
    }
}