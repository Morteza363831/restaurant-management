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
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .food-card .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .food-card .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
        }

        .food-card .card-body .btn-group {
            margin-top: auto;
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

<div class="container my-5">
    <h1 class="mb-4 animate">Menu List</h1>
    <div class="row g-4">
        <!-- Food item cards -->
        <c:forEach var="food" items="${foods}">
            <div class="col-md-4 mb-4">
                <div class="card food-card">
                    <img src="${pageContext.request.contextPath}/resources/images/foods/${food.foodImg}" class="card-img-top" alt="${food.foodName}">
                    <div class="card-body">
                        <h5 class="card-title">${food.foodName}</h5>
                        <p class="card-text">$${food.foodPrice}</p>
                        <div class="input-group">
                            <button class="btn btn-outline-secondary btn-minus" type="button" id="minus">-</button>
                            <input type="text" class="form-control text-center quantity" value="1" id="label">
                            <button class="btn btn-outline-secondary btn-plus" type="button" id="plus">+</button>
                        </div>
                        <form action="${pageContext.request.contextPath}/addToCart" method="post" class="mt-3">
                            <input type="hidden" name="foodId" value="${food.foodId}" disabled>
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<script>
    const quantityInput = document.getElementById("label");
    const minusButton = document.getElementById("minus");
    const plusButton = document.getElementById("plus");

    // Add event listeners to the buttons
    minusButton.addEventListener('click', decreaseQuantity);
    plusButton.addEventListener('click', increaseQuantity);

    // Functions to increase and decrease the quantity
    function decreaseQuantity() {
        let quantity = parseInt(quantityInput.value);
        if (quantity > 1) {
            quantityInput.value = quantity - 1;
        }
    }

    function increaseQuantity() {
        let quantity = parseInt(quantityInput.value);
        quantityInput.value = quantity + 1;
    }
</script>
</body>
</html>
