using System;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.Services.Description;

namespace TECH_FIX_WEBSITE
{
    public partial class SupplierForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string username = this.username.Text;

            // Connect to the database
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TechDatabase.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Email FROM Suppliers WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                conn.Open();
                string email = cmd.ExecuteScalar() as string;

                if (!string.IsNullOrEmpty(email))
                {
                    // Here you would generate a reset token and send an email
                    // For demonstration, we will just display a message
                    message.InnerHtml = "<div class='alert alert-success'>An email with password reset instructions has been sent to your registered email address.</div>";
                    message.Visible = true;

                    // Uncomment the following lines to send a real email (update your SMTP settings)
                    /*
                    SendResetEmail(email);
                    */
                }
                else
                {
                    message.InnerHtml = "<div class='alert alert-danger'>Username not found.</div>";
                    message.Visible = true;
                }
            }
        }

        private void SendResetEmail(string email)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("your-email@example.com"); // Replace with your email
            mail.Subject = "Password Reset Request";
            mail.Body = "To reset your password, please click on the following link: [Reset Link]"; // Create a link for reset
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.your-email-provider.com"; // Replace with your SMTP server
            smtp.Port = 587; // Change if necessary
            smtp.Credentials = new System.Net.NetworkCredential("your-email@example.com", "your-email-password"); // Replace with your credentials
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }
    }
}
