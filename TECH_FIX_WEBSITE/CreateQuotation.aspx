<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateQuotation.aspx.cs" Inherits="TECH_FIX_WEBSITE.CreateQuotation" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Supplier Quotation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: darkslategray;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 40px;
            background-color: lightgrey;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: black;
            font-weight: bold;
        }

        .form-label {
            font-weight: bold;
            color: black;
        }

        .form-control {
            margin-bottom: 20px;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            font-size: 1.2rem;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .top-right {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        /* Add padding to validation messages */
        .validation-message {
            color: red;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Create Quotation</h2>
        <form id="quotationForm" runat="server">
          
            <div class="top-right">
                <asp:Button ID="HomeBtn" runat="server" Text="Home" CssClass="btn btn-primary" OnClick="HomeBtn_Click" />
            </div>

        
            <div class="form-group">
                <label for="supplierUserId" class="form-label">Supplier UserID</label>
                <asp:TextBox ID="txtSupplierUserId" runat="server" CssClass="form-control" placeholder="Enter Supplier UserID"></asp:TextBox>
                <asp:RequiredFieldValidator ID="supplierUserIdValidator" runat="server" ControlToValidate="txtSupplierUserId"
                    ErrorMessage="Supplier UserID is required" ForeColor="Red" CssClass="validation-message" />
            </div>

            
            <div class="form-group">
                <label for="quotationDate" class="form-label">Quotation Date</label>
                <asp:TextBox ID="txtQuotationDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="quotationDateValidator" runat="server" ControlToValidate="txtQuotationDate"
                    ErrorMessage="Quotation Date is required" ForeColor="Red" CssClass="validation-message" />
            </div>

          
            <div class="form-group">
                <label for="totalAmount" class="form-label">Total Amount</label>
                <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control" placeholder="Enter Total Amount"></asp:TextBox>
                <asp:RequiredFieldValidator ID="totalAmountValidator" runat="server" ControlToValidate="txtTotalAmount"
                    ErrorMessage="Total Amount is required" ForeColor="Red" CssClass="validation-message" />
            </div>

          
            <div class="form-group">
                <label for="description" class="form-label">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Description"></asp:TextBox>
                <asp:RequiredFieldValidator ID="descriptionValidator" runat="server" ControlToValidate="txtDescription"
                    ErrorMessage="Description is required" ForeColor="Red" CssClass="validation-message" />
            </div>

            <div class="form-group">
                <label for="status" class="form-label">Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                    <asp:ListItem Value="Approved" Text="Approved"></asp:ListItem>
                    <asp:ListItem Value="Rejected" Text="Rejected"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="CreateQuotationBtn" runat="server" Text="Create Quotation" CssClass="btn-submit" OnClick="CreateQuotationBtn_Click" />
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
