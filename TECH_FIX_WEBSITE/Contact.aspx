<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TECH_FIX_WEBSITE.Contact" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us - TechFixx</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
     
    <style>

        body{
            background-color:lightblue;
        }

        .contact-section h2 {
            color: #007bff;
            font-weight: bold;
        }

        .form-control {
            border-radius: 0;
            box-shadow: none;
            font-size: 1.1rem;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 0;
            padding: 10px 20px;
            font-size: 1.2rem;
            transition: background-color 0.3s ease;
        }

            .btn-primary:hover {
                background-color: #0056b3;
            }

        .social-links i {
            transition: color 0.3s ease;
        }

        .social-links a:hover i {
            color: #007bff;
        }
    </style>
</head>
<body>
    <section class="contact-section py-5">
        <div class="container">
            <div class="row">
                <!-- Contact Form -->
                <div class="col-md-6 mb-4">
                    <h2 class="mb-4">Get in Touch</h2>
                    <form id="contactForm" method="post" runat="server">
                        <div class="form-group mb-3">
                            <label for="name" id="name">Your Name</label>
                            <asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="Enter your name" required="true"></asp:TextBox>
                        </div>
                        <div class="form-group mb-3">
                            <label for="email" id="email">Your Email</label>
                            <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email" required="true"></asp:TextBox>
                        </div>

                        <div class="form-group mb-3">
                            <label for="subject">Subject</label>
                            <asp:TextBox ID="subject" runat="server" CssClass="form-control" placeholder="Enter the subject" required="true"></asp:TextBox>
                        </div>
                        <div class="form-group mb-4">
                            <label for="message">Message</label>
                            <asp:TextBox ID="message" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6" placeholder="Type your message here" required="true"></asp:TextBox>
                        </div>
                        <asp:Button ID="submitButton" runat="server" CssClass="btn btn-primary btn-lg" Text="Send Message" OnClick="SubmitButton_Click" />
                    </form>
                </div>

                <!-- Contact Information -->
                <div class="col-md-6">
                    <h2 class="mb-4">Contact Information</h2>
                    <ul class="list-unstyled">
                        <li class="mb-3">
                            <i class="fas fa-map-marker-alt me-2"></i>
                            <strong>Address:</strong> No.112/A, Kurunegala Rd, Colombo
                        </li>
                        <li class="mb-3">
                            <i class="fas fa-envelope me-2"></i>
                            <strong>Email:</strong> <a href="mailto:info@techfix.com" class="text-dark">info@techfix.com</a>
                        </li>
                        <li class="mb-3">
                            <i class="fas fa-phone-alt me-2"></i>
                            <strong>Phone:</strong> <a href="tel:+94112321255" class="text-dark">+94 11 2321255</a>
                        </li>
                        <li class="mb-3">
                            <i class="fas fa-mobile-alt me-2"></i>
                            <strong>Mobile:</strong> <a href="tel:+94775653542" class="text-dark">+94 77 5653542</a>
                        </li>
                        <li class="mb-3">
                            <i class="fas fa-clock me-2"></i>
                            <strong>Working Hours:</strong> Monday - Friday: 9 AM - 6 PM
                        </li>
                    </ul>

                    <h3 class="mt-5">Follow Us</h3>
                    <div class="social-links">
                        <a href="#" class="text-dark me-3"><i class="fab fa-facebook-f fa-2x"></i></a>
                        <a href="#" class="text-dark me-3"><i class="fab fa-twitter fa-2x"></i></a>
                        <a href="#" class="text-dark me-3"><i class="fab fa-instagram fa-2x"></i></a>
                        <a href="#" class="text-dark me-3"><i class="fab fa-linkedin-in fa-2x"></i></a>
                        <a href="#" class="text-dark"><i class="fab fa-youtube fa-2x"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


