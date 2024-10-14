<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Business.Product" %>
<%@ page import="Business.ShoppingCart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Shopping Cart</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 20px;
        }

        /* Banner Styles */
        .banner-container {
            position: relative;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
            background-image: url('images/dogcat.jpg'); 
            background-size: cover;
            background-position: center;
            height: 300px;
            border-radius: 8px;
        }

        .banner-container a img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 150px;
            height: auto;
            border-radius: 8px;
        }

        h2 {
            color: #339933; /* Green color */
            margin: 20px 0;
        }

        table {
            width: 100%;
            max-width: 800px;
            margin-bottom: 20px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #339933;
            color: #fff;
        }

        td {
            color: #333;
        }

        tr:last-child td {
            border-bottom: none;
        }

        .cart-actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 800px;
        }

        .cart-actions button, .cart-actions a {
            background-color: #339933; /* Green */
            color: #fff;
            padding: 12px 25px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .cart-actions button:hover, .cart-actions a:hover {
            background-color: #66cc66; /* Lighter green on hover */
        }

        .cart-actions a {
            display: inline-block;
        }
    </style>
</head>
<body>

    <!-- Updated Banner -->
    <div class="banner-container">
        <a href="home.jsp">
            <img src="images/hppsl.png" alt="Cart Banner Logo">
        </a>
    </div>

    <%
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart == null || cart.getProductList().isEmpty()) {
    %>
        <p>Your cart is empty.</p>
    <%
        } else {
    %>
        <h2>Your Shopping Cart</h2>
        <table>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Stock Quantity</th>
                <th>Price</th>
            </tr>
            <c:forEach var="product" items="${cart.productList}">
                <tr>
                    <td>${product.productID}</td>
                    <td>${product.productName}</td>
                    <td>${product.productDescription}</td>
                    <td>${product.category}</td>
                    <td>${product.stockQuantity}</td>
                    <td>$${product.productPrice}</td>
                </tr>
            </c:forEach>
        </table>

        <div class="cart-actions">
            <!-- Go to Checkout Button -->
            <form action="CheckoutRedirectServlet" method="POST" style="margin: 0;">
                <button type="submit">Go to Checkout</button>
            </form>

            <!-- Continue Shopping Button -->
            <a href="products.jsp">Continue Shopping</a>

            <!-- Back to Search Results Button -->
            <a href="search-results.jsp">Back to Search Results</a>
        </div>
    <%
        }
    %>

</body>
</html>
