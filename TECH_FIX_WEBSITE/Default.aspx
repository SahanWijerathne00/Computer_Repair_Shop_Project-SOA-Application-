<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TECH_FIX_WEBSITE.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home - TechFix</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        .navbar-brand {
            display: flex;
            align-items: center; 
            font-size: 1.8rem;
            font-weight: bold;
            color: lightblue;
        }

        .navbar-nav .nav-link {
            font-size: 1.4em;
            color: #333;
            font-weight:bold;
        }

        .navbar-nav .nav-link:hover {
            color: #007bff;
        }

        .shop-logo {
            width: 70px; 
            height: auto;
            margin-right: 10px; 
        }

        .shop-name {
            font-size: 24px; 
            font-weight: bold;
            color: #333; 
        }

        .dropdown-menu a {
            color: #333;
        }
        .body-section {
            min-height: calc(100vh - 70px);
            background: url('<%= ResolveUrl("~/images/shop-image.jpg") %>') no-repeat center center;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: black;
            background-color:lightblue;
        }
        .body-section h2 {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .body-section p {
            font-size: 1.3rem;
            max-width: 600px;
            margin: 0 auto 30px;
            font-weight:bold;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            font-size: 1.2rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .footer {
            background-color: #2c2c2c; 
            color: #ffffff; 
            padding-top: 40px;
            padding-bottom: 20px;
        }

        .footer-title {
            font-size: 1.2rem;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .footer-link {
            color: #ffffff; 
            text-decoration: none;
            margin-bottom: 10px;
            display: block;
        }

        .footer-link:hover {
            text-decoration: underline; 
            color: crimson;
        }

        .social-links a {
            color: white; 
            font-size: 1.5rem;
            margin-right: 15px;
            transition: color 0.3s;
        }

        .social-links a:hover {
            color: crimson; 
        }

        /*Footer*/
        .footer {
        background-color: #2c2c2c; 
        color: #ffffff; 
        padding-top: 40px;
        padding-bottom: 20px;
         }

         .footer-title {
             font-size: 1.2rem;
             margin-bottom: 20px;
             font-weight: bold;
         }

         .footer-link {
             color: #ffffff;
             text-decoration: none;
             margin-bottom: 10px;
             display: block;
         }

         .footer-link:hover {
             text-decoration: underline; 
             color: crimson;
         }

         .social-links a {
             color: white; 
             font-size: 1.5rem;
             margin-right: 15px;
             transition: color 0.3s;
         }

         .social-links a:hover {
             color:brown; 
         }
    </style>
</head>

<body>
    <header class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container">
        <!-- Logo and Shop Name -->
        <a class="navbar-brand" href="Default.aspx">
            <img src="images/shop_new.jpeg" alt="Shop Logo" class="shop-logo">
            <span class="shop-name">TechFix</span>
        </a>


        <!-- Navigation Links -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Default.aspx">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="About.aspx">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Contact.aspx">Contact</a> 
                </li>

                <!-- Login Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Login
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="loginDropdown">
                        <li><a href="AdminLogin.aspx" class="dropdown-item">Admin</a></li> 
                        <li><a href="SupplierLogin.aspx" class="dropdown-item">Supplier</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    </header>

    <section class="body-section py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <img src='<%= ResolveUrl("~/images/home_bg.jpg") %>' alt="TechFix Shop" class="img-fluid rounded shadow">
                </div>
                <div class="col-lg-6">
                    <h2 class="mb-4">Welcome to TechFix</h2>
                    <p class="mb-4">At TechFix, we specialize in providing high-quality computer repairs, upgrades, and custom builds. With a team of experienced technicians, we ensure that all your tech needs are met with precision and care. Whether you're looking for a new gaming setup, need a repair for your laptop, or want to build a custom desktop, TechFix has got you covered!</p>
                    <a href="Store.aspx" class="btn btn-primary btn-lg">Go to Store</a>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer bg-dark text-white pt-5 pb-4">
    <div class="container text-center text-md-left">
        <div class="row">
            <!-- About Us Section -->
            <div class="col-md-3">
                <h5 class="footer-title">TechFix</h5>
                <p>At TechFix, we specialize in providing high-quality computer repairs, upgrades, and custom builds. Our mission is to deliver the best tech solutions with excellence.</p>
            </div>

            <!-- Quick Links -->
            <div class="col-md-2">
                <h5 class="footer-title">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="Home.aspx" class="footer-link">Home</a></li> <!-- Corrected links for Web Forms -->
                    <li><a href="About.aspx" class="footer-link">About Us</a></li>
                    <li><a href="Services.aspx" class="footer-link">Services</a></li>
                    <li><a href="Contact.aspx" class="footer-link">Contact</a></li>
                </ul>
            </div>

            <!-- Contact Us -->
            <div class="col-md-3">
                <h5 class="footer-title">Contact Us</h5>
                <ul class="list-unstyled">
                    <li><i class="fas fa-home me-2"></i> No.112/A, Kurunegala Rd, Colombo</li>
                    <li><i class="fas fa-envelope me-2"></i> info@techfix.com</li>
                    <li><i class="fas fa-phone me-2"></i> +94 11 2321255</li>
                    <li><i class="fas fa-print me-2"></i> +94 77 5653542</li>
                </ul>
            </div>

            <!-- Follow Us -->
            <div class="col-md-4">
                <h5 class="footer-title">Follow Us</h5>
                <div class="social-links">
                    <a href="#" class="text-white"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>

        <!-- Copyright Section -->
        <div class="row">
            <div class="col-md-12 text-center mt-3">
                <p>&copy; 2024 TechFix. All Rights Reserved.</p>
            </div>
        </div>
    </div>
    </footer>


     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
     <script src="~/lib/jquery/dist/jquery.min.js"></script>
     <script src="~/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
     <script src="~/js/site.js" asp-append-version="true"></script>
</body>
</html>
