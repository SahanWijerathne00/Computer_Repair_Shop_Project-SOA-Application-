<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierDashboard.aspx.cs" Inherits="TECH_FIX_WEBSITE.SupplierDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Supplier Dashboard - TechFixx</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
        }
        .dashboard-container {
            margin: 60px auto;
            padding: 40px;
            background-color: lightslategray;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .dashboard-title {
            font-size: 2rem;
            font-weight: bold;
            color: black;
            text-align: center;
            margin-bottom: 30px;
        }
        .card {
            margin: 10px 0;
        }

        .btn-secondary{
            color:black;
            background-color:red;
            font-weight:bold;
        }

        .btn-secondary hover{
            color:slategrey;
        }

    </style>
    <script type="text/javascript">
        function confirmLogout() {
            var result = confirm("Are you sure you want to logout?");
            return result; // Returns true if "Yes" is clicked, false if "No" is clicked
        }
    </script>
</head>
<body>
    <div class="dashboard-container">
        <h2 class="dashboard-title">Supplier Dashboard</h2>
        
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add Items</h5>
                        <p class="card-text">Add Items to Admin Store.</p>
                        <a href="AddItem.aspx" class="btn btn-primary">Go to Add Page</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">View Items</h5>
                        <p class="card-text">Manage and view Items.</p>
                        <a href="SupplierViewItem.aspx" class="btn btn-primary">Go to Items</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">View Item Orders</h5>
                        <p class="card-text">View and manage orders.</p>
                        <a href="ViewOrders.aspx" class="btn btn-primary">Go to Orders</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Create Quotation</h5>
                        <p class="card-text">add Quotations for Items.</p>
                        <a href="CreateQuotation.aspx" class="btn btn-primary">Go to Add Quotation</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                 <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">View Repair Orders</h5>
                        <p class="card-text">View all repairing items orders and manage.</p>
                        <a href="UpdateProfile.aspx" class="btn btn-primary">Go to Repairs</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Logout Form -->
        <form id="form1" runat="server">
            <div class="text-center mt-4">A
                <asp:Button ID="LogoutButton" runat="server" CssClass="btn btn-secondary" Text="Logout" OnClientClick="return confirmLogout();" OnClick="Logout_Click" />
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
