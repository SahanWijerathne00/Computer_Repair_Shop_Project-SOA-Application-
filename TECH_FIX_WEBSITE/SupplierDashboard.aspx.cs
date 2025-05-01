using System;

namespace TECH_FIX_WEBSITE
{
    public partial class SupplierDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Check if user is logged in, otherwise redirect to login page
            if (Session["SupplierEmail"] == null)
            {
                Response.Redirect("SupplierLogin.aspx");
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear the session data when the user logs out
            Session.Clear();
            Session.Abandon();

            // Redirect to login page after logging out
            Response.Redirect("SupplierLogin.aspx");
        }

    }
}

