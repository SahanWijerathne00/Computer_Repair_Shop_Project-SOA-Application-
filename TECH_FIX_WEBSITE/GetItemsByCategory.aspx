<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetItemsByCategory.aspx.cs" Inherits="TECH_FIX_WEBSITE.GetItemsByCategory" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Get Items by Category</title>
</head>
<body>
    <!-- This page does not have content as it is designed to serve data dynamically -->
</body>

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

        
        function addToCart(itemName, itemImage, price) {
            // Make an AJAX call to add the item to the cart
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'AddToCart.aspx', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function () {
                if (xhr.status === 200) {
                    alert("Order successful! Item added to the cart.");
                    window.location.href = "AdminCart.aspx"; // Redirect to the cart page after order
                }
            };
            xhr.send(`itemName=${itemName}&itemImage=${itemImage}&price=${price}`);

        }


    </script>

</html>

