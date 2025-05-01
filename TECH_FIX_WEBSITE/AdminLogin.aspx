A<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="TECH_FIX_WEBSITE.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login - TechFixx</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('images/admin_bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .login-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 40px;
            background-color: lightsteelblue;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color:black;
        }

        .login-heading {
            font-size: 2rem;
            font-weight: bold;
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
            color:black;
        }

        .form-label{
            font-weight:bold;
        }

        .form-control {
            border-radius: 0;
            box-shadow: none;
            font-size: 1.1rem;
        }

        .btn-login, btn-secondary {
            background-color: #007bff;
            border-color: #007bff;
            color:black;
            font-weight:bold;
            border-radius: 0;
            padding: 10px 20px;
            font-size: 1.2rem;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #0056b3;
        }

        .forgot-password {
            text-align: right;
        }

        .forgot-password a {
            color: #007bff;
            text-decoration: none;
            color:black;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="login-heading">Admin Login</h2>
        <form id="adminLoginForm" method="post" runat="server">
            <div class="form-group mb-4">
                <asp:Label runat="server" Text="Username" AssociatedControlID="adminUsername" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="adminUsername" runat="server" CssClass="form-control" placeholder="Enter your username" required="true"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" Text="Password" AssociatedControlID="adminPassword" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="adminPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" required="true"></asp:TextBox>
            </div>
            <div class="forgot-password mb-3">
                <a href="ForgotPassword.aspx">Forgot your password?</a>
            </div>
            <asp:Button ID="loginButton" runat="server" CssClass="btn btn-login w-100" Text="Login" OnClick="LoginButton_Click" />
            <asp:Button ID="backButton" runat="server" CssClass="btn btn-secondary w-100 mt-3" Text="Back" OnClick="BackButton_Click" />
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
