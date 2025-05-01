using System;
using System.Web.UI;

namespace TECH_FIX_WEBSITE
{
    public partial class AdminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = adminUsername.Text;
            string password = adminPassword.Text;

            // Validate admin credentials (this is just an example)
            if (username == "a" && password == "a")
            {
                // Redirect to admin dashboard
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                // Display error message
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Invalid username or password');", true);
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            // Redirect to the home page
            Response.Redirect("Default.aspx");
        }
    }
}
