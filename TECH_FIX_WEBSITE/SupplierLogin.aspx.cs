using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TECH_FIX_WEBSITE
{
    public partial class SupplierLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = this.username.Text.Trim();
            string password = this.password.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please enter both username and password.');", true);
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Suppliers WHERE Username = @Username AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password); // Consider hashing the password for security

                    try
                    {
                        conn.Open();
                        int count = (int)cmd.ExecuteScalar();

                        if (count > 0)
                        {
                            Session["SupplierEmail"] = username; // Store the username (or email) in session
                            Response.Redirect("SupplierDashboard.aspx"); // Redirect to dashboard
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Invalid username or password.');", true);
                        }

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
