<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TECH_FIX_WEBSITE.About" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - TechFix</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="~/css/site.css" rel="stylesheet">
    <style>
        /* Custom styles for About Us page */
        .about-section {
            background-color: lightblue;
        }

        .about-heading {
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            color: #007bff;
            margin-bottom: 40px;
        }

        .about-text {
            font-size: 1.1rem;
            line-height: 1.8;
            text-align: justify;
            color: #333;
        }

        .about-images {
            padding: 20px 0;
        }

        .about-image {
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .team-section {
            background-color: #ffffff;
            padding: 60px 0;
        }

        .team-heading {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            color: #333;
            margin-bottom: 40px;
        }

        .team-member {
            text-align: center;
        }

        .team-member img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .team-member h5 {
            font-size: 1.2rem;
            font-weight: bold;
            color: #007bff;
        }

        .team-member p {
            font-size: 1rem;
            color: #666;
        }

        /*Header*/

        .navbar-brand {
        display: flex;
        align-items: center; /* Align logo and text vertically */
        font-size: 1.8rem;
        font-weight: bold;
        color: #007bff;
        }

        .navbar-nav .nav-link {
            font-size: 1.3em;
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
                    <a class="nav-link" href="Default.aspx">Home</a> <!-- Web Forms navigation -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="About.aspx">About Us</a> <!-- Replace with actual pages -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Contact.aspx">Contact</a> <!-- Replace with actual pages -->
                </li>

                <!-- Login Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Login
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="loginDropdown">
                        <li><a href="AdminLogin.aspx" class="dropdown-item">Admin</a></li> <!-- Replace with actual login pages -->
                        <li><a href="SupplierLogin.aspx" class="dropdown-item">Supplier</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    </header>

    <div class="about-section">
        <div class="container">
            <h2 class="about-heading">About TechFix</h2>
            <div class="row">
                <div class="col-md-6">
                    <p class="about-text">
                        TechFix is a leading provider of computer repair and IT services, dedicated to offering the best solutions for all your technology needs. Whether it's troubleshooting hardware, upgrading systems, or providing professional consultation, we’ve been at the forefront of innovation since our founding. With a commitment to quality service and customer satisfaction, we have helped countless clients get back online, stay secure, and maintain their technology for long-term success.
                    </p>
                    <p class="about-text">
                        Our team of certified professionals is passionate about helping businesses and individuals with everything from routine computer repairs to complex network setups. At TechFix, we believe in a personalized approach and prioritize transparency and trust in every project we undertake.
                    </p>
                </div>
                <div class="col-md-6 about-images">
                    <img src="images/shop_image.jpg"" alt="Our Office" class="about-image mb-4">
                    <img src='<%= ResolveUrl("~/images/working.jpeg") %>' alt="Technicians at Work" class="about-image">
                </div>
            </div>
        </div>
    </div>

    <div class="team-section">
        <div class="container">
            <h2 class="team-heading">Meet Our Team</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="team-member">
                        <img src='<%= ResolveUrl("~/images/team-member-1.jpg") %>' alt="John Doe">
                        <h5>John Doe</h5>
                        <p>Lead Technician</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        <img src='<%= ResolveUrl("~/images/team-member-2.jpg") %>' alt="Jane Smith">
                        <h5>Jane Smith</h5>
                        <p>Customer Support</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        <img src='<%= ResolveUrl("~/images/team-member-3.jpg") %>' alt="Mike Johnson">
                        <h5>Mike Johnson</h5>
                        <p>IT Consultant</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
</body>
</html>
