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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["New"] = Button_Submit.Text;
        }

        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                //Guid newGUID = Guid.NewGuid();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Licence_viewerConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from Registration where UserName='" + TextBoxUserName.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    //Response.Write("User already Exists");
                    Response.Write("<script language='javascript'>window.alert('User already Exists');window.location='Registration.aspx';</script>");

                }

                else
                {
                    string insertQuery = "insert into Registration (UserName,Email,Password) values (@Uname,@Email,@Password)";
                    SqlCommand com1 = new SqlCommand(insertQuery, conn);
                    //com.Parameters.AddWithValue("@ID", newGUID.ToString());
                    com1.Parameters.AddWithValue("@Uname", TextBoxUserName.Text);
                    com1.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    com1.Parameters.AddWithValue("@Password", TextBoxPassword.Text);
                    com1.ExecuteNonQuery();
                    Response.Write("<script language='javascript'>window.alert('Registration is successful');window.location='login.aspx';</script>");
                }
                //Response.Write("Registration is successful");
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("Error" + ex.ToString());
            }
        }

        protected void Button_Exit_Click(object sender, EventArgs e)
        {

            Response.Redirect("Login.aspx");
        }
    }
}