<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminViewStore.aspx.cs" Inherits="TECH_FIX_WEBSITE.AdminViewStore" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin View Store - TechFixx</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    
    <style>
        body {
            background-color: #f4f6f9;
        }
        /* Header Styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #007bff;
            color: white;
            position: relative;
        }

        .header .logo {
            display: flex;
            align-items: center;
        }

        .header img {
            max-height: 50px;
            margin-right: 10px;
        }

        .header h1 {
            font-size: 24px;
            margin: 0;
            color: white;
        }

        /* Centered search bar */
        .search-bar {
            display: flex;
            align-items: center;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .search-bar input {
            padding: 5px 10px;
            border-radius: 5px;
            border: none;
            width: 300px;
        }

        .search-bar button {
            margin-left: 10px;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            background-color: #f8f9fa;
        }

        /* Cart and Home aligned to the right */
        .cart-home {
            display: flex;
            align-items: center;
        }

        .cart-home .btn {
            margin-left: 15px;
            color: #007bff;
            background-color: #f8f9fa;
        }

        .cart-home i {
            margin-right: 5px;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 237px;
            position: fixed;
            top: 93px;
            left: -5px;
            height: 107%;
            background-color: darkgrey;
            padding-top: 60px;
            overflow-y: auto;
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }
        .sidebar a:hover {
            background-color: #007bff;
        }
        
        /* Content Styles */
        .content {
            margin-left: 260px;
            padding: 20px;
        }

        .card {
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">
            <img src="logo.png" alt="Shop Logo" />
            <h1>TechFixx</h1>
        </div>

        <!-- Search bar in the middle with search icon -->
        <div class="search-bar">
            <input type="text" placeholder="Search items..." />
            <button class="btn btn-light">
                <i class="fas fa-search" src=""></i> <!-- Font Awesome search icon -->
            </button>
        </div>

        <!-- Cart and Home buttons aligned to the right -->
        <div class="cart-home">
            <a href="AdminCart.aspx" class="btn btn-light">
                <i class="fas fa-shopping-cart"></i> Cart
            </a>
            <a href="AdminDashboard.aspx" class="btn btn-light">
                <i class="fas fa-home"></i> Home
            </a>
        </div>
    </div>


    <!-- Sidebar for Categories -->
    <div class="sidebar">
        <asp:Repeater ID="CategoryRepeater" runat="server">
           <ItemTemplate>
                <a href="javascript:void(0)" onclick="loadItems('<%# Eval("CategoryName") %>')"><%# Eval("CategoryName") %></a>
            </ItemTemplate>


        </asp:Repeater>
    </div>

    <!-- Content Section for Items -->
    <div class="content">
        <h2>Items</h2>
        <div id="itemsContainer">
            <!-- Items will be loaded here based on the selected category -->
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Load items based on category selection
        function loadItems(categoryId) {
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'GetItemsByCategory.aspx?CategoryID=' + categoryId, true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    document.getElementById('itemsContainer').innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }

       
            function addToCart(itemId, itemName, price) {
                // Show a success message when an item is added to the cart
                alert(itemName + " successfully added to your cart!");

            // Send the request to the server to add the item to the cart
            window.location.href = "GetItemsByCategory.aspx?action=add&ItemID=" + itemId + "&ItemName=" + encodeURIComponent(itemName) + "&Price=" + price;
    }
    

    </script>
</body>
</html>