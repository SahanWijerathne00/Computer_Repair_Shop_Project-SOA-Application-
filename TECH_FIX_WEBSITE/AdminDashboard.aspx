<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="TECH_FIX_WEBSITE.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard - TechFixx</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom Styles -->
    <style>
        body {
            background-color: lightblue;
        }
        .dashboard-container {
            margin: 60px auto;
            padding: 40px;
            color:black;
            background-color: lightslategray;
            border-radius: 10px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
        }
        .dashboard-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: black;
            text-align: center;
            margin-bottom: 40px;
        }
        .nav-tabs {
            border-bottom: 2px solid #dee2e6;
        }
        .nav-tabs .nav-link {
            border: none;
            border-radius: 0;
            background-color: #f4f6f9;
            color: #495057;
            font-weight: 600;
        }
        .nav-tabs .nav-link.active {
            background-color: #007bff;
            color: #fff;
        }
        .card {
            margin: 20px 0;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-title {
            font-weight: bold;
            color: #007bff;
        }
        .logout-container {
            text-align: right;
            margin-top: 20px;
        }
        .btn-logout {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="dashboard-container">
            <h2 class="dashboard-title">Admin Dashboard</h2>

            <!-- Nav tabs for different sections -->
            <ul class="nav nav-tabs" id="adminTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="overview-tab" data-bs-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Overview</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="category-tab" data-bs-toggle="tab" href="AddCategory.aspx" role="tab" aria-controls="addCategory" aria-selected="false">Add Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="store-tab" data-bs-toggle="tab" href="AdminViewStore.aspx" role="tab" aria-controls="viewStore" aria-selected="false">View Store</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="orders-tab" data-bs-toggle="tab" href="OrderItem.aspx" role="tab" aria-controls="orderItems" aria-selected="false">Order Items</a>
                </li>
                 <li class="nav-item">
                     <a class="nav-link" id="repair-tab" data-bs-toggle="tab" href="RepairItem.aspx" role="tab" aria-controls="repairItems" aria-selected="false">Request Repairing Items</a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link" id="quotation-tab" data-bs-toggle="tab" href="ViewQuotation.aspx" role="tab" aria-controls="viewQuotaions" aria-selected="false">View Quotations</a>
                 </li>
                <li class="nav-item">
                    <a class="nav-link" id="supplier-tab" data-bs-toggle="tab" href="SupplierView.aspx" role="tab" aria-controls="manageSuppliers" aria-selected="false">Manage Suppliers</a>
                </li>
            </ul>

            <!-- Tab Content -->
            <div class="tab-content" id="adminTabContent">
                <!-- Overview Tab -->
                <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                    <div class="row mt-4" style="font-size:20px">
                      <b>Manage Everthing In Here.............</b> 
                        
                    </div>
                </div>

                <!-- Add Category Tab -->
                <div class="tab-pane fade" id="addCategory" role="tabpanel" aria-labelledby="category-tab">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Add Category</h5>
                                    <p class="card-text">Create and manage product categories.</p>
                                    <a href="AddCategory.aspx" class="btn btn-primary">Go to Add Category</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- View Store Tab -->
                <div class="tab-pane fade" id="viewStore" role="tabpanel" aria-labelledby="store-tab">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">View Store</h5>
                                    <p class="card-text">View and manage all store items.</p>
                                    <a href="ViewStore.aspx" class="btn btn-primary">Go to View Store</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Items Tab -->
                <div class="tab-pane fade" id="orderItems" role="tabpanel" aria-labelledby="orders-tab">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Order Items</h5>
                                    <p class="card-text">View and manage all order items.</p>
                                    <a href="ManageOrders.aspx" class="btn btn-primary">Go to Order Items</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="repairItems" role="tabpanel" aria-labelledby="repair-tab">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Request Repair Items</h5>
                                    <p class="card-text">Add Items for Repairing</p>
                                    <a href="Repairing.aspx" class="btn btn-primary">Go to Suppliers</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            

                <div class="tab-pane fade" id="viewquotations" role="tabpanel" aria-labelledby="quotation-tab">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">View Quotations</h5>
                                    <p class="card-text">View Quotations for Items</p>
                                    <a href="ViewQuotations.aspx" class="btn btn-primary">Go to Suppliers</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
         
            

                <!-- Manage Suppliers Tab -->
                <div class="tab-pane fade" id="manageSuppliers" role="tabpanel" aria-labelledby="supplier-tab">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Manage Suppliers</h5>
                                    <p class="card-text">Add, remove, and edit suppliers.</p>
                                    <a href="ManageSuppliers.aspx" class="btn btn-primary">Go to Suppliers</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           

            <!-- Logout Button -->
            <div class="logout-container">
                <asp:Button ID="LogoutButton" runat="server" CssClass="btn btn-logout" Text="Logout" OnClientClick="return confirm('Are you sure you want to logout?');" OnClick="Logout_Click" />
            </div>
        </div>
    </form>
</body>
</html>
