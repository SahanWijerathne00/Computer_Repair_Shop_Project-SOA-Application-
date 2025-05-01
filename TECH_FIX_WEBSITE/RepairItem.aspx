<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepairItem.aspx.cs" Inherits="TECH_FIX_WEBSITE.RepairItem" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Repair Item</title>
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

        .success-message {
            color: green;
            text-align: center;
            margin-bottom: 20px;
        }

        .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Button ID="HomeButton" runat="server" Text="Home" CssClass="btn-home" OnClick="HomeButton_Click" />
            
            <h1>Create Repair Item</h1>
            <asp:Label ID="SuccessMessage" runat="server" CssClass="success-message" Visible="false"></asp:Label>
            
            <div class="form-group">
                <label for="customerName">Customer Name</label>
                <asp:TextBox ID="customerName" runat="server" placeholder="Enter customer name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="customerNameRequired" runat="server" ControlToValidate="customerName"
                    ErrorMessage="Customer Name is required" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="repairItem">Repair Item</label>
                <asp:TextBox ID="repairItem" runat="server" placeholder="Enter repair item"></asp:TextBox>
                <asp:RequiredFieldValidator ID="repairItemRequired" runat="server" ControlToValidate="repairItem"
                    ErrorMessage="Repair Item is required" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <asp:TextBox ID="description" runat="server" TextMode="MultiLine" placeholder="Enter description"></asp:TextBox>
                <asp:RequiredFieldValidator ID="descriptionRequired" runat="server" ControlToValidate="description"
                    ErrorMessage="Description is required" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="repairDate">Repair Date</label>
                <asp:TextBox ID="repairDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="repairDateRequired" runat="server" ControlToValidate="repairDate"
                    ErrorMessage="Repair Date is required" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="status">Status</label>
                <asp:DropDownList ID="status" runat="server">
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="CreateRepairBtn" runat="server" Text="Create Repair Request" CssClass="btn" OnClick="CreateRepairBtn_Click" />
         </div>
    </form>
</body>
</html>
