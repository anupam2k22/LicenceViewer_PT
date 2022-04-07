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
    public partial class Licence_Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["New"] != null)
            {
                //Label_Welcome.Text += Session["New"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            //if (IsPostBack)
            //{
            //    //HyperLink1.Attributes.Add("OnClick",logout());
            //}
        }
        protected void Button_save_Click(object sender, EventArgs e)
        {
            customValidate();
        }

        //protected void Button_Exit_Click(object sender, EventArgs e)
        //{
        //    Session["New"] = null;
        //    Response.Redirect("Login.aspx");
        //}

        protected void TextBox15_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox_Anual_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox_Temporary_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox_Payment_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button_Logout(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }

        //string logout()
        //{
        //    Session["New"] = null;
        //    Response.Redirect("Login.aspx");
        //    return "logged out";
        //}

        protected void go_Home(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }

        public void customValidate()
        {
            string errors = "";
            //calling of validation functions
            errors += CheckSoftware();
            errors += CheckVendor();
            errors += CheckClientName();
            errors += CheckEnvironment();
            errors += CheckLocation();
            errors += CheckDomain();
            errors += CheckIPAddress();
            errors += CheckHTTP();
            errors += CheckHTTPS();
            errors += CheckLicenseExpDate();
            errors += CheckExpType();
            errors += CheckUrls();
            errors += CheckPrice();
            errors += CheckNewQuote();
            errors += CheckPO();
            errors += CheckInvoice();
            errors += CheckEstimatedTripAmount();
            if (errors == "")
                enterLicenseData();
            else Response.Write("<script>alert('" + errors.ToString() + "');</script>");
        }



        private string CheckEstimatedTripAmount()
        {
            string TN = TextBox_Payment.Text.ToString();
            if (TN == "")
            {
                Label17.Text = "Please enter Estimated Trip Amount.";
                return "Please enter Estimated Trip Amount.\\n";
            }
            else {Label17.Text = ""; return "";}
        }

        private string CheckInvoice()
        {
            string TN = TextBox_Invoice.Text.ToString();
            if (TN == "")
            {
                Label16.Text = "Please enter Invoice.";
                return "Please enter Invoice.\\n";
            }
            else {Label16.Text = ""; return "";}
        }

        private string CheckPO()
        {
            string TN = TextBox_PO.Text.ToString();
            if (TN == "")
            {
                Label15.Text = "Please enter PO.";
                return "Please enter PO.\\n";
            }
            else {Label15.Text = ""; return "";}
        }

        private string CheckNewQuote()
        {
            string TN = TextBox_Quote.Text.ToString();
            if (TN == "")
            {
                Label14.Text = "Please enter New Quote.";
                return "Please enter New Quote.\\n";
            }
            else {Label14.Text = ""; return "";}
        }

        private string CheckPrice()
        {
            string TN = TextBox_Price.Text.ToString();
            if (TN == "")
            {
                Label13.Text = "Please enter Price.";
                return "Please enter Price.\\n";
            }
            else {Label13.Text = ""; return "";}
        }

        private string CheckUrls()
        {
            string TN = TextBox_URL.Text.ToString();
            if (TN == "")
            {
                Label12.Text = "Please enter URL.";
                return "Please enter URL.\\n";
            }
            else {Label12.Text = ""; return "";}
        }

        private string CheckExpType()
        {
            string TP = DropDownList_Extype.SelectedValue;
            if (TP == "Select Type")
            {
                Label11.Text = "Please enter Expiry Type.";
                return "Please enter Expiry Type.\\n";
            }
            else {Label11.Text = ""; return "";}
        }

        private string CheckLicenseExpDate()
        {
            string TN = TextBox_Annual.Value.ToString();
            if (TN == "")
            {
                Label10.Text = "Please enter Licence Expiry Date.";
                return "Please enter License Expiry Date.\\n";
            }
            else {Label10.Text = ""; return "";}
        }

        private string CheckHTTPS()
        {
            string TN = TextBox_HTTPS.Text.ToString();
            if (TN == "")
            {
                Label9.Text = "Please enter HTTPS Port no.";
                return "Please enter HTTPS Port no.\\n";
            }
            else {Label9.Text = ""; return "";}
        }

        private string CheckHTTP()
        {
            string TN = TextBox_HTTP.Text.ToString();
            if (TN == "")
            {
                Label8.Text = "Please enter HTTP Port no.";
                return "Please enter HTTP Port no.\\n";
            }
            else {Label8.Text = ""; return "";}
        }

        private string CheckIPAddress()
        {
            string TN = TextBox_IP.Text.ToString();
            if (TN == "")
            {
                Label7.Text = "Please enter IP Address.";
                return "Please enter IP Address.\\n";
            }
            else {Label7.Text = ""; return "";}
        }

        private string CheckDomain()
        {
            string TP = DropDownList_Domain.SelectedValue;
            if (TP == "Select Domain")
            {
                Label6.Text = "Please enter Domain.";
                return "Please enter Domain.\\n";
            }
            else {Label6.Text = ""; return "";}
        }

        private string CheckLocation()
        {
            string TP = DropDownList_Location.SelectedValue;
            if (TP == "Select Location")
            {
                Label5.Text = "Please enter Location.";
                return "Please enter Location.\\n";
            }
            else {Label5.Text = ""; return "";}

        }

        private string CheckEnvironment()
        {
            string TN = TextBox_Tier.Text.ToString();
            if (TN == "")
            {
                Label4.Text = "Please enter Environment.";
                return "Please enter Environment.\\n";
            }
            else {Label4.Text = ""; return "";}
        }

        private string CheckClientName()
        {
            string TP = concatClients(Listbox_Client.Items);
            if (TP == "")
            {
                Label3.Text = "Please select at least one Client.";
                return "Please select at least one Client.\\n";
            }
            else {Label3.Text = ""; return "";}
        }

        private string CheckVendor()
        {
            string TP = DropDownList_Vendor.SelectedValue;
            if (TP == "Select Vendor")
            {
                Label2.Text = "Please enter Vendor.";
                return "Please enter Vendor.\\n";
            }
            else {Label2.Text = ""; return "";}
        }

        private string CheckSoftware()
        {
            string TP = DropDownList_Software.SelectedValue;
            if (TP == "Select Software")
            {
                Label1.Text = "Please enter Software.";
                return "Please enter Software.\\n";
            }
            else {Label1.Text = ""; return "";}
        }

        private string concatClients(ListItemCollection clients)
        {
            String ClientNames="";
            foreach (ListItem i in clients)
            {
                if (i.Selected)
                    ClientNames += i.Text + "\r\n";
            }

            return ClientNames;
        }

        public void enterLicenseData()
        {
            try
            {
                //Guid newGUID = Guid.NewGuid();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Licence_viewerConnectionString"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into Licence_Info(Software,Vendor,Client_Name,Environment,Location,Domain,IP_Addresses,HTTP_Port,HTTPS_Port,License_Expiry_Date,Expiry_Type,URLs,Price,New_Quote,PO,Invoice,Payment_Status) values (@Software,@Vendor,@Client,@Tier,@Location,@Domain,@IP,@HTTP,@HTTPS,@Exdate,@Extype,@URLs,@Price,@Quote,@PO,@Invoice,@Payment)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                //com.Parameters.AddWithValue("@ID", newGUID.ToString());
                com.Parameters.AddWithValue("@Software", DropDownList_Software.SelectedItem.ToString());
                com.Parameters.AddWithValue("@Vendor", DropDownList_Vendor.SelectedItem.ToString());
                com.Parameters.AddWithValue("@Client", concatClients(Listbox_Client.Items));
                com.Parameters.AddWithValue("@Tier", TextBox_Tier.Text);
                com.Parameters.AddWithValue("@Location", DropDownList_Location.SelectedItem.ToString());
                com.Parameters.AddWithValue("@Domain", DropDownList_Domain.SelectedItem.ToString());
                com.Parameters.AddWithValue("@IP", TextBox_IP.Text);
                com.Parameters.AddWithValue("@HTTP", TextBox_HTTP.Text);
                com.Parameters.AddWithValue("@HTTPS", TextBox_HTTPS.Text);
                com.Parameters.AddWithValue("@Exdate", Page.Request.Form["TextBox_Annual"].ToString());
                com.Parameters.AddWithValue("@Extype", DropDownList_Extype.SelectedItem.ToString());
                com.Parameters.AddWithValue("@URLs", TextBox_URL.Text);
                com.Parameters.AddWithValue("@Price", TextBox_Price.Text);
                com.Parameters.AddWithValue("@Quote", TextBox_Quote.Text);
                com.Parameters.AddWithValue("@PO", TextBox_PO.Text);
                com.Parameters.AddWithValue("@Invoice", TextBox_Invoice.Text);
                com.Parameters.AddWithValue("@Payment", TextBox_Payment.Text);
                com.ExecuteNonQuery();
                Response.Write("<script language='javascript'>window.alert('Your Data has been successfully submitted');window.location='Admin.aspx';</script>");
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error" + ex.ToString());
            }
        }
    }
}