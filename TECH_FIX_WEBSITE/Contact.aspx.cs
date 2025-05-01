using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services.Description;
using System.Xml.Linq;

namespace TECH_FIX_WEBSITE
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string userName = name.Text;
            string userEmail = email.Text;
            string userSubject = subject.Text;
            string userMessage = message.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["TechFixxConnectionString"].ConnectionString;

            string query = "INSERT INTO Feedback (Name, Email, Subject, Message) VALUES (@Name, @Email, @Subject, @Message)";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                 cmd.Parameters.AddWithValue("@Name", userName);
                cmd.Parameters.AddWithValue("@Email", userEmail);
                cmd.Parameters.AddWithValue("@Subject", userSubject);
                cmd.Parameters.AddWithValue("@Message", userMessage);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                   Response.Write("<script>alert('Your message has been successfully submitted.');</script>");

                    name.Text = "";
                    email.Text = "";
                    subject.Text = "";
                    message.Text = "";
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}
