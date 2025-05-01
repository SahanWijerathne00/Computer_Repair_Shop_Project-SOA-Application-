<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="TECH_FIX_WEBSITE.AddItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item - TechFixx</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: seashell;
            color: #fff;
            overflow-x: hidden;
        }

        .header {
            background-color: blue;
            padding: 20px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .header h1 {
            display: inline;
            margin: 0;
            font-size: 2rem;
        }

        .header img {
            height: 40px;
            vertical-align: middle;
            margin-right: 10px;
        }

        .main-content {
            margin-top: 80px;
            padding: 20px;
            color: black;
        }

        .form-container {
            color: black;
            font-weight: bold;
            background-color: lightgray;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: space-between;
            max-width: 800px;
            margin: auto;
        }

        .form-section {
            flex: 1;
            margin-right: 10px;
        }

        .form-control {
            background-color: white;
            border: 1px solid #555;
            color: black;
        }

        .form-control:focus {
            background-color: white;
            border-color: #00bcd4;
            box-shadow: 0 0 5px rgba(0, 188, 212, 0.5);
        }

        .btn-submit {
            background-color: #00bcd4;
            border: none;
            padding: 10px 40px;
            color: #fff;
            font-size: 1rem;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #0097a7;
        }

        .btn-home {
            color: white;
            text-decoration: none;
            font-size: 1.2rem;
            margin: 0 10px;
        }

        .btn-home:hover {
            color: #00bcd4;
        }

        .image-preview {
            width: 200px;
            height: 200px;
            border: 1px dashed #555;
            border-radius: 5px;
            background-color: #444;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #aaa;
        }

        .image-preview img {
            max-width: 100%;
            max-height: 100%;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <div class="main-content">
        <div class="container">
            <h2 class="text-center mb-4">Add New Item</h2>
            <div class="form-container">
                <div class="form-section">
                    <form id="addItemForm" runat="server" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="itemCategory" class="form-label">Category</label>
                            <asp:DropDownList ID="itemCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="itemName" class="form-label">Item Name</label>
                            <asp:TextBox ID="itemName" runat="server" CssClass="form-control" placeholder="Enter item name" required="required"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="itemDescription" class="form-label">Description</label>
                            <asp:TextBox ID="itemDescription" TextMode="MultiLine" Rows="4" runat="server" CssClass="form-control" placeholder="Enter item description" required="required"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="itemPrice" class="form-label">Price (LKR)</label>
                            <asp:TextBox ID="itemPrice" runat="server" CssClass="form-control" placeholder="Enter item price" required="required"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="itemQuantity" class="form-label">Quantity</label>
                            <asp:TextBox ID="itemQuantity" runat="server" CssClass="form-control" placeholder="Enter item quantity" required="required"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="itemImage" class="form-label">Upload Image</label>
                            <asp:FileUpload ID="itemImage" runat="server" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="supplierUserId" class="form-label">Supplier User ID</label>
                            <asp:TextBox ID="supplierUserId" runat="server" CssClass="form-control" placeholder="Enter Supplier User ID" required="required"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubmit" runat="server" Text="Add Item" OnClick="AddItemForm_ServerClick" CssClass="btn-submit" />
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
