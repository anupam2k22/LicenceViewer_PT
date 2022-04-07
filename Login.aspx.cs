using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace LicenceViewer
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void ButtonNewUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void Button_Login_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Licence_viewerConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from Registration where UserName='" + TextBoxUserName.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
                if (temp == 1)
                {
                    conn.Open();
                    string checkpasswordQuery = "select password from Registration where UserName='" + TextBoxUserName.Text + "'";
                    SqlCommand passcom = new SqlCommand(checkpasswordQuery, conn);
                    string password = passcom.ExecuteScalar().ToString().Replace(" ", "");
                    if (password == TextBoxPassword.Text)
                    {
                        Session["New"] = TextBoxUserName.Text;
                        Response.Write("Password is correct");
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        Response.Write("<script language='javascript'>window.alert('Password is not correct.');</script>");
                    }
                }
                else
                {
                    Response.Write("<script language='javascript'>window.alert('Username is not correct.');</script>");
                }
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("Error" + ex.ToString());
            }

        }

    }
}