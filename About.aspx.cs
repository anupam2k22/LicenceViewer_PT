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
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                //Label_Welcome.Text += Session["New"].ToString();
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Licence_viewerConnectionString"].ConnectionString);
                    conn.Open();
                    string id = Request.QueryString["id"];
                    //Response.Write(id);
                    String query = "select * from Licence_Info where Id =" + id;
                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    SqlDataReader reader = com.ExecuteReader();
                    reader.Read();
                    Label1.Text = reader["Software"].ToString();
                    Label2.Text = reader["Vendor"].ToString();
                    Label3.Text = reader["Client_Name"].ToString();
                    Label4.Text = reader["Environment"].ToString();
                    Label5.Text = reader["Location"].ToString();
                    Label6.Text = reader["Domain"].ToString();
                    Label7.Text = reader["IP_Addresses"].ToString();
                    Label8.Text = reader["HTTP_Port"].ToString();
                    Label9.Text = reader["HTTPS_Port"].ToString();
                    Label10.Text = reader["License_Expiry_Date"].ToString();
                    Label11.Text = reader["Expiry_Type"].ToString();
                    //Label12.Text= reader["URLs"].ToString();
                    HyperLink1.NavigateUrl = reader["URLs"].ToString();
                    Label13.Text = reader["Price"].ToString();
                    Label14.Text = reader["New_Quote"].ToString();
                    Label15.Text = reader["PO"].ToString();
                    Label16.Text = reader["Invoice"].ToString();
                    Label17.Text = reader["Payment_Status"].ToString();

                    reader.Close();

                    conn.Close();

                }
                catch (Exception ex)
                {
                    Response.Write("Error" + ex.ToString());
                }


                //string message = "Confirm Deletion?";

                Button2.Attributes.Add("OnClick", "Javascript:if(confirm('Confirm Deletion?')== false) return false;");

                //ClientScript.RegisterOnSubmitStatement(this.GetType(), "confirm", "return confirm('" + message + "');");

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

           

        }

        protected void Button_edit_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            Response.Redirect("Modify.aspx?ID=" + id);
        }

        protected void Button_delete_Click(object sender, EventArgs e)
        {

            try
            {
                //Response.Write("<script language='javascript'>window.alert('Confirm Deletion?');</script>");
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Licence_viewerConnectionString"].ConnectionString);
                conn.Open();
                string id = Request.QueryString["id"];
                //Response.Write(id);
                String query = "delete from Licence_Info where Id =" + id;
                SqlCommand com = new SqlCommand(query, conn);
                com.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("Error" + ex.ToString());
            }

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record successfully deleted.');window.location='Admin.aspx';", true);
            //Response.Redirect("Admin.aspx");
        }

        protected void Button_Logout(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void go_Home(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }

    }
}