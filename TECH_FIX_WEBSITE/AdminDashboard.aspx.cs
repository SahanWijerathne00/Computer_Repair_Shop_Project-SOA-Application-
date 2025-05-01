using System;
using System.Web.UI;

namespace TECH_FIX_WEBSITE
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   
            }
        }
        protected void OverviewTab_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        protected void CategoryTab_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");
        }
        protected void StoreTab_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStore.aspx");
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");
        }
    }
}
