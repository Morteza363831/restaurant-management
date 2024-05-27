<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Menu</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        .food-card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .food-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .food-card .card-img-top {
            height: 200px;
            object-fit: cover;
            border-radius: 5px 5px 0 0;
        }

        .food-card .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
            padding: 1.5rem;
        }

        .food-card .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .food-card .card-text {
            font-size: 1rem;
            color: #6c757d;
            margin-bottom: 1rem;
        }

        .input-group {
            display: flex;
            justify-content: space-around;
            margin-bottom: 1rem;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004a9e;
        }

        .input-group {
            display: flex;
            justify-content: space-around;
            align-items: center; /* Align items vertically in the center */
            margin-bottom: 1rem;
        }

        .input-group .btn {
            flex: 0 0 40px; /* Set a fixed width and height for the buttons */
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .input-group input {
            flex: 1; /* Allow the input field to take up remaining space */
            max-width: 60px; /* Set a maximum width for the input field */
            max-height: 40px;
            text-align: center; /* Center the text in the input field */
        }


    </style>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand animate" href="#">Restaurant Management</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center animate" id="navbarNav">
            <ul class="navbar-nav d-flex justify-content-around align-items-center">
                <li class="nav-item mx-3">
                    <a class="nav-link animate" href="#">Home</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link animate" href="#">Restaurants</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link animate" href="profile">Profile</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link animate" href="#">Contact</a>
                </li>
            </ul>
        </div>
        <a href="cart.html" class="text-white animate"><i class="fas fa-shopping-cart fa-lg"></i></a>
    </div>
</nav>

<div class="container mt-5 pt-5 position-relative top-4">
    <h1 class="mb-4 animate mt-4">Menu List</h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="food" items="${foods}">
            <div class="col mb-4">
                <div class="card food-card h-100">
                    <img src="${pageContext.request.contextPath}/resources/images/foods/${food.foodImg}" class="card-img-top" alt="${food.foodName}">
                    <div class="card-body">
                        <h5 class="card-title animate">${food.foodName}</h5>
                        <p class="card-text animate">$${food.foodPrice}</p>
                        <form action="${pageContext.request.contextPath}/addToCart" method="post" class="mt-3">
                        <div class="input-group">
                            <button class="btn btn-outline-secondary btn-minus animate" type="button" id="${food.foodId}">-</button>
                            <input type="text" class="form-control form-control-sm text-center" name="foodCount" value="1" id="quantity-${food.foodId}">
                            <button class="btn btn-outline-secondary btn-plus animate" type="button" id="${food.foodId}">+</button>
                        </div>
                            <input type="hidden" name="foodId" value="${food.foodId}">
                            <button type="submit" class="btn btn-primary animate">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>



<script>
    const minusButtons = document.querySelectorAll(".btn-minus");
    const plusButtons = document.querySelectorAll(".btn-plus");

    minusButtons.forEach(button => {
        button.onclick = function (event) {
            const quantityInput = document.getElementById("quantity-"+button.id);
            let quantity = parseInt(quantityInput.value);
            if(quantity > 1) {
                quantityInput.value = quantity -1;
            }
        }

    });

    plusButtons.forEach(button => {
        button.onclick = function (event) {
            const quantityInput = document.getElementById("quantity-"+button.id);
            let quantity = parseInt(quantityInput.value);
            quantityInput.value = quantity + 1;
        }
    });

    function decreaseQuantity(event) {
        const foodId = event.target.getAttribute('id');
        const quantityInput = document.getElementById(`quantity-${foodId}`);
        let quantity = parseInt(quantityInput.value);
        if (quantity > 1) {
            quantityInput.value = quantity - 1;
        }
    }

    function increaseQuantity(event) {
        const foodId = event.target.getAttribute('id');
        const quantityInput = document.getElementById(`quantity-${foodId}`);
        let quantity = parseInt(quantityInput.value);
        quantityInput.value = quantity + 1;
    }
</script>
</body>
</html>
