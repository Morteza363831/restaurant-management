<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            height: 100px;
        }
        .form-group label {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 10px;
        }
        .form-group input[type="text"], .form-group input[type="email"] {
            width: 100%;
            height: 40px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group input[type="text"]:disabled, .form-group input[type="email"]:disabled {
            background-color: #f9f9f9;
            cursor: not-allowed;
        }
        .form-group input[type="text"]:focus, .form-group input[type="email"]:focus {
            border-color: #66afe9;
            box-shadow: 0 0 10px rgba(102, 175, 233, 0.5);
        }
        .form-group input[type="text"]:hover, .form-group input[type="email"]:hover {
            border-color: #66afe9;
            box-shadow: 0 0 10px rgba(102, 175, 233, 0.5);
        }
        .form-group input[type="submit"] {
            width: 100%;
            height: 40px;
            margin-bottom: 20px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #3e8e41;
        }
        .footer {
            background-color: #f9f9f9;
            padding: 20px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            color: #666;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="animate__animated animate__fadeInDown">Order Form</h1>
    <form:form action="${pageContext.request.contextPath}/purchase" cssClass="order-form" method="post">
        <div class="form-group">
            <label for="address">Address:</label>
            <textarea class="form-control" name="address" id="address"></textarea>
        </div>
        <div class="form-group">
            <h2>Price:</h2>
            <p id="price">${resultPrice}</p>
        </div>
        <div class="form-group">
            <h2>Count:</h2>
            <p id="count">${resultCount}</p>
        </div>
        <input type="submit" value="Purchase" class="btn btn-success" />
    </form:form>
</div>
<footer class="footer">
    <p>&copy; 2023 Restaurant Management. All rights reserved.</p>
</footer>
<script>

    const orderForm = document.querySelector(".order-form");

    orderForm.addEventListener("submit",async function (event) {
        event.preventDefault();

        const address = document.getElementById("address").value;
        const resultPrice = document.getElementById("price").textContent+"";
        const resultCount = document.getElementById("count").textContent+"";

        try {
            const response = await fetch("${pageContext.request.contextPath}/purchase", {
                method: "POST",
                body: new URLSearchParams({address,resultPrice,resultCount}),
            });

            if (response.ok) {
                window.location.href = "${pageContext.request.contextPath}/menu";
            } else {
                console.error("Error during update item:", response.status);
            }
        } catch (error) {
            console.error("Error:", error);
        }
    });

    // Add animation to the form
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.querySelector("form");
        form.classList.add("animate__animated", "animate__fadeInUp");
    });



</script>
</body>
</html>