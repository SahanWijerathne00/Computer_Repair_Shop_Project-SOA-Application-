using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TECH_FIX_WEBSITE
{
    public partial class SupplierSigup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            string name = this.name.Text.Trim();
            string companyName = this.companyName.Text.Trim();
            string email = this.email.Text.Trim();
            string phoneNumber = this.phoneNumber.Text.Trim();
            string address = this.address.Text.Trim();
            string username = this.username.Text.Trim();
            string password = this.password.Text.Trim();

         
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(companyName) || string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(phoneNumber) || string.IsNullOrEmpty(address) ||
                string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please fill in all required fields.');", true);
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Suppliers (Name, CompanyName, Email, PhoneNumber, Address, Username, Password) " +
                               "VALUES (@Name, @CompanyName, @Email, @PhoneNumber, @Address, @Username, @Password)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@CompanyName", companyName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password); 

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery(); 

                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Sign up successful!');", true);

                        Response.Redirect("SupplierLogin.aspx");
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error: " + ex.Message + "');", true);
                    }
                }
            }
        }
    }
}
