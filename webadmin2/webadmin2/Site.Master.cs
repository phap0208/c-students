using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webadmin2
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["masinhvien"] != null)
            {

                logoutLink.Visible = true;
                loginLink.Visible = false;


                StudentInfoLiteral.Text = Session["masinhvien"].ToString();
            }
            else
            {

                logoutLink.Visible = false;
                loginLink.Visible = true;
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["masinhvien"] = null;
            Response.Redirect("~/Login.aspx");
        }
    }
}