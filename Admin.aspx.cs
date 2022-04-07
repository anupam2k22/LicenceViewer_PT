using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

using Syncfusion.XlsIO;
using System.IO;

namespace LicenceViewer
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                //Label_Welcome.Text += Session["New"].ToString();
                GridView1.Columns[0].Visible = false;
                GridView1.Columns[1].Visible = false;

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void SqlDataSourceRegistration_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument.ToString();

            Response.Redirect("About.aspx?ID=" + id);
        }

        protected void Button_save_Click(object sender, EventArgs e)
        {
            Response.Redirect("Licence_Info.aspx");
        }

        protected void Button_Logout(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }
        protected void Button_Export(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Licence_viewerConnectionString"].ConnectionString);
            conn.Open();
            string query = "select * from Licence_Info";
            SqlCommand com = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet dt = new DataSet();
            // this will query your database and return the result to your datatable
            da.Fill(dt);


            DataTable dataTable = new DataTable();
            dataTable = dt.Tables[0];

            if (dataTable.Rows.Count > 0)
            {
                string filename = "LicenseReport.xls";
                System.IO.StringWriter tw = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
                DataGrid dgGrid = new DataGrid();
                dgGrid.DataSource = dt;
                dgGrid.DataBind();

                //Get the HTML for the control.
                dgGrid.RenderControl(hw);
                //Write the HTML back to the browser.
                //Response.ContentType = application/vnd.ms-excel;
                Response.ContentType = "application/vnd.ms-excel";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
                this.EnableViewState = false;
                Response.Write(tw.ToString());
                Response.End();
            }

            conn.Close();
        }
        protected void btnSubs_Click(object sender, EventArgs e)
        {

            ImageButton btn = (ImageButton)sender;
            //globalBtn = btn;
            string id = btn.CommandArgument.ToString();
            Subscriber sub = new Subscriber();
            string SmtpServer = ConfigurationManager.AppSettings["SMTPServer"].ToString().Trim();
            string ToAddress = ConfigurationManager.AppSettings["ToAddress"].ToString().Trim();
            string EmailSubject = ConfigurationManager.AppSettings["EmailSubject"].ToString().Trim();
            string SMTPUserName = ConfigurationManager.AppSettings["SMTPUserName"].ToString().Trim();
            string SMTPPassword = ConfigurationManager.AppSettings["SMTPPassword"].ToString().Trim();
            string MsgBody = ConfigurationManager.AppSettings["MsgBody"].ToString().Trim();
            string FromAddress = ConfigurationManager.AppSettings["FromAddress"].ToString().Trim();

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Licence_viewerConnectionString"].ConnectionString);
                conn.Open();
                String query = "select * from Licence_Info where Id =" + id;
                SqlCommand com = new SqlCommand(query, conn);
                com.ExecuteNonQuery();
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                string compValue = reader["Subscriber_Flag"].ToString();
                string vendorName = reader["Vendor"].ToString();
                string clientName = reader["Client_Name"].ToString();
                string domainName = reader["Domain"].ToString();
                reader.Close();
                //if (btn.CommandName.ToString() == "1")
                if (compValue == "1")
                {
                    string updateQuery = "update Licence_Info SET Subscriber_Flag = 0 WHERE Id =" + id;
                    SqlCommand upd = new SqlCommand(updateQuery, conn);
                    //com.Parameters.AddWithValue("@ID", newGUID.ToString());
                    upd.ExecuteNonQuery();
                    btn.ImageUrl = "style\\sub.png";
                    
                    MsgBody = "Hi " + Session["New"] + "<br/><br/>" + "You have unsubscribed to a " + vendorName + " licence entry in " + domainName + " Domain applying to the below accounts:" + "<br/><br/>" + clientName + "<br/><br/>" + "Regards" + "<br/>" + "Conduent Licence Management Group";

                }
                else
                {
                    string updateQuery = "update Licence_Info SET Subscriber_Flag = 1 WHERE Id =" + id;
                    SqlCommand upd = new SqlCommand(updateQuery, conn);
                    //com.Parameters.AddWithValue("@ID", newGUID.ToString());
                    upd.ExecuteNonQuery();
                    btn.ImageUrl = "style\\unsub.png";
                    MsgBody = "Hi " + Session["New"] + "<br/><br/>" + "You have subscribed to a " + vendorName + " licence entry in " + domainName + " Domain applying to the below accounts:" + "<br/><br/>" + clientName + "<br/><br/>" + "Regards" + "<br/>" + "Conduent Licence Management Group";
                }
                sub.SendSMTPEmail(SmtpServer, FromAddress, SMTPUserName, SMTPPassword, ToAddress, "", EmailSubject, MsgBody, "");
                //Response.Write("<script language='javascript'>window.alert('Your Data has been successfully submitted');window.location='Admin.aspx';</script>");
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('Error: "+ ex.ToString() + " ')</script>");
            }

            //sub.Subscribe(btn);

        }

        //protected void datagrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    try
        //    {
        //        //FillGrid();
        //        datagrid.PageIndex = e.NewPageIndex;
        //        datagrid.DataBind();
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}

    }
}