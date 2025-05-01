<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierForgotPassword.aspx.cs" Inherits="TECH_FIX_WEBSITE.SupplierForgotPassword" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password - TechFixx</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
        }
        .forgot-password-container {
            max-width: 400px;
            margin: 60px auto;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .forgot-password-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-control {
            border-radius: 0;
            box-shadow: none;
            font-size: 1.1rem;
        }
        .btn-primary {
            background-color: #007bff;
            border-radius: 0;
            font-size: 1.2rem;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="forgot-password-container">
        <h2 class="forgot-password-title">Forgot Password</h2>
        <form id="ForgotPasswordForm" method="post" runat="server">
            <div class="mb-3">
                <label for="username">Username</label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter your username" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ControlToValidate="username" ErrorMessage="Username is required." CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="mb-3">
                <asp:Button ID="submitButton" runat="server" CssClass="btn btn-primary w-100" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
            <div id="message" runat="server" visible="false"></div>
            <div class="text-center">
                <a href="SupplierLogin.aspx">Back to Login</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

