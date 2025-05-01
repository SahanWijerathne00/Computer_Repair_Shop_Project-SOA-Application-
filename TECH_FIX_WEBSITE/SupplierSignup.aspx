<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierSignup.aspx.cs" Inherits="TECH_FIX_WEBSITE.SupplierSigup" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Supplier Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .signup-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color:darkkhaki;
        }
        .signup-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-custom {
            width: 100%;
            padding: 10px;
            font-size: 1.2rem;
        }
        .mb3{
            text-decoration-style:solid;
        }
    </style>
</head>
<body>
    <div class="container signup-container">
        <div class="signup-header">
            <h2>Supplier Sign Up</h2>
        </div>
        <form id="supplierSignUpForm" runat="server">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="Enter your name" required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="companyName" class="form-label">Company Name</label>
                <asp:TextBox ID="companyName" runat="server" CssClass="form-control" placeholder="Enter your company name" required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email" required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Phone Number</label>
                <asp:TextBox ID="phoneNumber" runat="server" CssClass="form-control" placeholder="Enter your phone number" required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <asp:TextBox ID="address" runat="server" CssClass="form-control" placeholder="Enter your address" required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter your username" required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password" required="true"></asp:TextBox>
            </div>
            <div class="d-grid gap-2">
                <asp:Button ID="signUpButton" runat="server" Text="Sign Up" CssClass="btn btn-primary btn-custom" OnClick="SignUpButton_Click" />
            </div>
        </form>
       
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

