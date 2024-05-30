<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Menu</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        .animate__animated {
            animation-duration: 1s;
            animation-fill-mode: both;
        }

        .food-card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: none;
            border-radius: 10px;
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
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
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
            color: #2980b9;
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
            align-items: center;
            margin-bottom: 1rem;
        }

        .input-group .btn {
            flex: 0 0 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #2980b9;
            border-color: #2980b9;
            color: #fff;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .input-group .btn:hover {
            background-color: #1c6fa5;
            border-color: #1c6fa5;
        }

        .input-group input {
            flex: 1;
            max-width: 60px;
            max-height: 40px;
            text-align: center;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }

        .alert {
            position: fixed;
            top: 50%;
            left: 40%;
            transform: translate(-50%, -50%);
            z-index: 9999;
            width: 300px;
            text-align: center;
        }

        .cart-dropdown {
            position: absolute;
            top: 100%;
            right: 0;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            width: 300px;
            z-index: 1000;
            display: none;
        }

        .cart-dropdown ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .cart-dropdown li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .cart-dropdown img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            margin-right: 10px;
        }

        .navbar {
            background-color: #2980b9 !important;
            animation: animate__slideInDown 0.5s ease-in-out;
        }

        .navbar-brand, .nav-link {
            color: #fff !important;
            font-weight: bold;
            transition: color 0.3s;
        }

        .nav-link:hover {
            color: #f8f9fa !important;
        }
    </style>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg">
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand animate__animated animate__fadeInLeft" href="#">Restaurant Management</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center animate__animated animate__fadeInRight" id="navbarNav">
            <ul class="navbar-nav d-flex justify-content-around align-items-center">
                <li class="nav-item mx-3">
                    <a class="nav-link animate__animated animate__fadeInUp" href="#">Home</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link animate__animated animate__fadeInUp" href="#">Restaurants</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link animate__animated animate__fadeInUp" href="profile">Profile</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link animate__animated animate__fadeInUp" href="#">Contact</a>
                </li>
            </ul>
        </div>
        <div class="position-relative">
            <a href="shoppingCart" class="text-white animate__animated animate__fadeInRight" id="cart-icon">
                <i class="fas fa-shopping-cart fa-lg"></i>
                <span class="cart-count" id="cart-count">${addedItems.size()}</span>
            </a>
            <div class="cart-dropdown" id="cart-dropdown">
                <h5>Added Items</h5>
                <ul id="added-items">
                    <c:forEach var="transaction" items="${transactions}">
                        <li id="${transaction.foodId}" class="added-to-cart-list animate__animated animate__fadeInUp">
                            <img src="${pageContext.request.contextPath}/resources/images/foods/${transaction.foodImg}" alt="${transaction.foodName}">
                            <div>
                                <h6>${transaction.foodName}</h6>
                                <p class="pc-${transaction.foodId}" id="pc-${transaction.foodId}">$${transaction.foodPrice} x ${transaction.foodCount}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</nav>

<div class="container mt-5 pt-5 position-relative top-4">
    <h1 class="mb-4 animate__animated animate__fadeInDown">Menu List</h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="food" items="${foods}">
            <form action="${pageContext.request.contextPath}/addToCart" id="${food.foodId}" method="post" class="mt-3 addToCartForm">
                <div class="col mb-4">
                    <div class="card food-card h-100 animate__animated animate__fadeInUp">
                        <img src="${pageContext.request.contextPath}/resources/images/foods/${food.foodImg}" id="img-${food.foodId}" class="card-img-top animate__animated animate__fadeInLeft" alt="${food.foodImg}">
                        <div class="card-body">
                            <h5 class="card-title animate__animated animate__fadeInLeft" id="title-${food.foodId}">${food.foodName}</h5>
                            <p class="card-text animate__animated animate__fadeInRight" id="price-${food.foodId}">$${food.foodPrice}</p>
                            <div class="input-group">
                                <button class="btn btn-outline-secondary btn-minus animate__animated animate__fadeInLeft" type="button" id="${food.foodId}">-</button>
                                <input type="text" class="form-control form-control-sm text-center" name="foodCount" value="1" id="quantity-${food.foodId}">
                                <button class="btn btn-outline-secondary btn-plus animate__animated animate__fadeInRight addToCartButton" type="button" id="${food.foodId}">+</button>
                            </div>
                            <input type="hidden" name="foodId" value="${food.foodId}">
                            <button type="submit" class="btn btn-primary animate__animated animate__fadeInUp">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </form>
        </c:forEach>
    </div>
</div>

<div class="alert alert-success alert-dismissible fade show animate__animated animate__fadeInUp" role="alert" id="add-to-cart-alert" style="display: none;">
    <strong>Added to Cart!</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<script>
    const minusButtons = document.querySelectorAll(".btn-minus");
    const plusButtons = document.querySelectorAll(".btn-plus");
    const forms = document.querySelectorAll(".addToCartForm");

    const cartIcon = document.getElementById("cart-icon");
    const cartDropdown = document.getElementById("cart-dropdown");
    const addedItemsList = document.getElementById("added-items");

    let addedItems = [];

    forms.forEach(form => {
        form.addEventListener("submit", async function (event) {
            event.preventDefault();

            const foodId = form.id.valueOf();
            const foodCount = document.getElementById("quantity-"+foodId).value;
            const foodName = document.getElementById("title-"+foodId).textContent;
            const foodPrice = document.getElementById("price-"+foodId).textContent;
            const foodImg = document.getElementById("img-"+foodId).alt;

            try {
                const response = await fetch("${pageContext.request.contextPath}/addToCart", {
                    method: "POST",
                    body: new URLSearchParams({foodId,foodCount}),
                });

                if (response.ok) {
                    const message = await response.text();
                    showAlert(message);
                    document.getElementById("quantity-"+foodId).value = 1;
                    addedItems.push({
                        id: foodId,
                        name: foodName,
                        price: foodPrice,
                        count: foodCount,
                        img: foodImg
                    });

                    updateCartDropdown();
                } else {
                    console.error("Error adding item to cart:", response.status);
                }
            } catch (error) {
                console.error("Error:", error);
            }
        });
    });

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

    function showAlert(message) {
        const alert = document.getElementById("add-to-cart-alert");
        alert.querySelector("strong").textContent = message;
        alert.style.display = "block";

        setTimeout(() => {
            alert.style.display = "none";
        }, 3000);
    }

    function updateCartDropdown() {
        const addedToCartLists = document.querySelectorAll(".added-to-cart-list");
        let flag = false;
        addedItems.forEach(item => {
            addedToCartLists.forEach(list => {
                if (item.id === list.id) {
                    const existingListItem = list.querySelector("div");
                    const existingCount = parseInt(existingListItem.querySelector("p.pc-" + item.id).textContent.split(" x ")[1]);
                    const newCount = existingCount + parseInt(item.count);
                    existingListItem.querySelector("p.pc-" + item.id).textContent = item.price + " x " + newCount;
                    addedItems.pop();
                    flag = true;
                }
            })
            if (!flag) {
                const listItem = document.createElement("li");
                listItem.className = "added-to-cart-list animate__animated animate__fadeInUp";
                listItem.id = item.id;
                const htmlList = "<img src='${pageContext.request.contextPath}/resources/images/foods/"+ item.img + "' alt='"+item.name+"'>" +
                    "<div>" +
                    "<h6>"+item.name+"</h6>" +
                    "<p class ='pc-" + item.id + "'>" + item.price + " x " + item.count + "</p>" +
                    "</div>";
                listItem.innerHTML = htmlList;
                addedItemsList.appendChild(listItem);
                addedItems.pop();
            }
            flag = false;
        });
    };

    function updateCartCount() {
        const addedItemsList = document.getElementById("added-items");
        const cartCountSpan = document.getElementById("cart-count");
        const addedItems = addedItemsList.querySelectorAll(".added-to-cart-list");
        cartCountSpan.textContent = addedItems.length;
    }

    // Call the function to update the count when the page loads or refreshes
    document.addEventListener("DOMContentLoaded", function() {
        updateCartCount();
    });

    cartIcon.addEventListener("mouseenter", () => {
        cartDropdown.style.display = "block";
    });

    cartIcon.addEventListener("mouseleave", () => {
        cartDropdown.style.display = "none";
    });
</script>
</body>
</html>
