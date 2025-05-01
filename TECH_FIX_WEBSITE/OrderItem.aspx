<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderItem.aspx.cs" Inherits="TECH_FIX_WEBSITE.OrderItem" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: darkslategray;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: lightgrey;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
        }

        .btn-home {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }

        .btn-home:hover {
            background-color: #0056b3;
        }

        .logo {
            height: 30px;
            vertical-align: middle; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Button ID="HomeButton" runat="server" Text="Home" CssClass="btn-home" OnClick="HomeButton_Click" />
            <h1>Create Order</h1>

            <!-- Item ID Field -->
            <div class="form-group">
                <label for="itemId">Item ID</label>
                <asp:TextBox ID="itemId" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="itemIdRequired" runat="server" ControlToValidate="itemId"
                    ErrorMessage="Item ID is required" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="itemName">Item Name</label>
                <asp:TextBox ID="itemName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="itemNameRequired" runat="server" ControlToValidate="itemName"
                    ErrorMessage="Item Name is required" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="price">Price</label>
                <asp:TextBox ID="price" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="priceRequired" runat="server" ControlToValidate="price"
                    ErrorMessage="Price is required" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="priceValidator" runat="server" ControlToValidate="price"
                    ErrorMessage="Invalid Price format" ForeColor="Red" ValidationExpression="^\d+(\.\d{1,2})?$" />
            </div>

            <div class="form-group">
                <label for="quantity">Quantity</label>
                <asp:TextBox ID="quantity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="quantityRequired" runat="server" ControlToValidate="quantity"
                    ErrorMessage="Quantity is required" ForeColor="Red" />
                <asp:RangeValidator ID="quantityRangeValidator" runat="server" ControlToValidate="quantity"
                    ErrorMessage="Quantity must be between 1 and 100" MinimumValue="1" MaximumValue="100" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="supplierId">Supplier</label>
                <asp:DropDownList ID="supplierId" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="supplierRequired" runat="server" ControlToValidate="supplierId"
                    InitialValue="" ErrorMessage="Please select a supplier" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="orderDate">Order Date</label>
                <asp:TextBox ID="orderDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="orderDateRequired" runat="server" ControlToValidate="orderDate"
                    ErrorMessage="Order Date is required" ForeColor="Red" />
            </div>

            <asp:Button ID="CreateOrderBtn" runat="server" Text="Create Order" CssClass="btn" OnClick="CreateOrderBtn_Click" />
        </div>
    </form>
</body>
</html>
