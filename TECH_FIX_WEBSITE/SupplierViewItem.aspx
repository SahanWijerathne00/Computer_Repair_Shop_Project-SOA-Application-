<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierViewItem.aspx.cs" Inherits="TECH_FIX_WEBSITE.SupplierViewItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier View Items - TechFix</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: lightblue;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        h2 {
            margin-bottom: 30px;
            font-weight: bold;
            color: #007bff;
        }

        .form-control {
            margin-bottom: 20px;
            border-radius: 0.25rem; /* Slightly round the corners */
        }

        .table-container {
            margin-top: 30px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 0.5rem; 
            overflow: hidden; 
        }

        .table {
            background-color: #fff;
            margin-bottom: 0; 
        }

        .table img {
            max-width: 100px;
            border-radius: 5px; 
        }

        .input-group {
            border: 1px solid #007bff; 
            border-radius: 0.25rem; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); 
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); 
            border-color: #007bff;

        .btn-primary {
            border-radius: 0 0.25rem 0.25rem 0; 
        }

        .btn-primary:hover {
            background-color: #0056b3; 
            border-color: #0056b3; /* Match border color on hover */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Supplier View Items</h2>

            <!-- Supplier ID Input and Button -->
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="input-group mb-3">
                        <input type="text" id="supplierID" runat="server" class="form-control" placeholder="Enter Supplier ID" aria-label="Supplier ID" />
                        <div class="input-group-append">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="SearchItems" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Table for displaying items -->
            <div class="table-container">
                <asp:GridView ID="ItemsGridView" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Price" HeaderText="Price (LKR)" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" ControlStyle-Width="100px" ControlStyle-Height="100px" />
                        <asp:BoundField DataField="DateAdded" HeaderText="Date Added" />
                        <asp:BoundField DataField="SupplierUserID" HeaderText="Supplier UserID" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
