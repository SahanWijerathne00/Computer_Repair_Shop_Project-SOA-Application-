<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierLogin.aspx.cs" Inherits="TECH_FIX_WEBSITE.SupplierLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Supplier Login - TechFixx</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
           background: url('images/admin_bg.jpg') no-repeat center center fixed;
           background-size: cover;
        }
        .login-container {
            max-width: 400px;
            margin: 60px auto;
            background-color: lightsteelblue;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .login-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: black;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-control {
            border-radius: 0;
            box-shadow: none;
            font-size: 1.1rem;
           
        }

        .form-label{
             font-weight:bold;
        }

        .btn-primary {
            background-color: blue;
            border-radius: 0;
            font-size: 1.2rem;
            transition: background-color 0.3s ease;
            color:black;
            font-weight:bold;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .forgot-password, .signup-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color:black;
        }
        .forgot-password a, .signup-link a {
            color: black;
            text-decoration: none;
        }
        .forgot-password a:hover, .signup-link a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="login-title">Supplier Login</h2>
        <form id="SupplierLoginForm" method="post" runat="server">
            <div class="mb-3">
                <label for="username" CssClass="form-label"><b>Username</b></label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter your username" required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="password"><b>Password</b></label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="loginButton" runat="server" CssClass="btn btn-primary w-100" Text="Login" OnClick="LoginButton_Click" />
            </div>
            <div class="forgot-password">
                <a href="SupplierForgotPassword.aspx">Forgot Password?</a>
            </div>
            <div class="signup-link">
                <a href="SupplierSignUp.aspx">Sign Up</a>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
