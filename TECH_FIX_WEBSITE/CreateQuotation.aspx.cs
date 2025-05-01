using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TECH_FIX_WEBSITE
{
    public partial class CreateQuotation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void HomeBtn_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("SupplierDashboard.aspx");
        }

        protected void CreateQuotationBtn_Click(object sender, EventArgs e)
        {
            string supplierUserId = txtSupplierUserId.Text;

            DateTime quotationDate;
            if (!DateTime.TryParse(txtQuotationDate.Text, out quotationDate))
            {
                ShowAlert("Please enter a valid date.");
                return;
            }

            decimal totalAmount;
            if (!decimal.TryParse(txtTotalAmount.Text, out totalAmount))
            {
                ShowAlert("Please enter a valid total amount.");
                return;
            }

            string description = txtDescription.Text;
            string status = ddlStatus.SelectedValue;

           
            try
            {
                InsertQuotation(supplierUserId, quotationDate, totalAmount, description, status);
                ShowAlert("Quotation Created Successfully");
            }
            catch (SqlException ex)
            {
                
                ShowAlert("Error: Database operation failed. Please check your input and try again.");
            }
            catch (Exception ex)
            {
                
                ShowAlert("Error: An unexpected error occurred. Please try again later.");
            }
        }

       
        private void InsertQuotation(string supplierUserId, DateTime quotationDate, decimal totalAmount, string description, string status)
        {
           
            string connStr = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string insertQuery = "INSERT INTO Quotations (SupplierUserID, QuotationDate, TotalAmount, Description, Status) " +
                                     "VALUES (@SupplierUserID, @QuotationDate, @TotalAmount, @Description, @Status)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);

               
                cmd.Parameters.AddWithValue("@SupplierUserID", supplierUserId);
                cmd.Parameters.AddWithValue("@QuotationDate", quotationDate);
                cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Status", status);

              
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        
        private void ShowAlert(string message, string redirectUrl = "")
        {
            string script = $"<script>alert('{message}');";

            
            if (!string.IsNullOrEmpty(redirectUrl))
            {
                script += $"window.location='{redirectUrl}';";
            }
            script += "</script>";

            
            Response.Write(script);
        }
    }
}
