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

        .animate {
            animation: fadeIn 1s ease-in-out;
        }
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

        .alert {
            position: fixed;
            top: 50%;
            left: 50%;
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

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
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
        <div class="position-relative">
            <a href="#" class="text-white animate" id="cart-icon"><i class="fas fa-shopping-cart fa-lg"></i></a>
            <div class="cart-dropdown" id="cart-dropdown">
                <h5>Added Items</h5>
                <ul id="added-items">
                    <c:forEach var="transaction" items="${transactions}">
                        <li id="li-${transaction.foodId}" class="added-to-cart-list">
                            <img src="${pageContext.request.contextPath}/resources/images/foods/${transaction.foodImg}" alt="${transaction.foodName}">
                            <div>
                                <h6>${transaction.foodName}</h6>
                                <p id="pc-${transaction.foodId}">$${transaction.foodPrice} x ${transaction.foodCount}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</nav>

<div class="container mt-5 pt-5 position-relative top-4">
    <h1 class="mb-4 animate mt-4">Menu List</h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="food" items="${foods}">
            <form action="${pageContext.request.contextPath}/addToCart" id="${food.foodId}" method="post" class="mt-3 addToCartForm">
                <div class="col mb-4">
                    <div class="card food-card h-100">
                        <img src="${pageContext.request.contextPath}/resources/images/foods/${food.foodImg}" id="img-${food.foodId}" class="card-img-top animate" alt="${food.foodImg}">
                        <div class="card-body">
                            <h5 class="card-title animate" id="title-${food.foodId}">${food.foodName}</h5>
                            <p class="card-text animate" id="price-${food.foodId}">$${food.foodPrice}</p>

                            <div class="input-group">
                                <button class="btn btn-outline-secondary btn-minus animate" type="button" id="${food.foodId}">-</button>
                                <input type="text" class="form-control form-control-sm text-center" name="foodCount" value="1" id="quantity-${food.foodId}">
                                <button class="btn btn-outline-secondary btn-plus animate addToCartButton" type="button" id="${food.foodId}">+</button>
                            </div>
                                <input type="hidden" name="foodId" value="${food.foodId}">
                                <button type="submit" class="btn btn-primary animate">Add to Cart</button>

                        </div>
                    </div>
                </div>
            </form>
        </c:forEach>
    </div>
</div>

<div class="alert alert-success alert-dismissible fade show" role="alert" id="add-to-cart-alert" style="display: none;">
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
            console.log(foodName + " " + foodPrice + " " + foodImg)
            try {
                const response = await fetch("${pageContext.request.contextPath}/addToCart", {
                    method: "POST",
                    body: new URLSearchParams({foodId,foodCount}),
                });

                if (response.ok) {
                    const message = await response.text();
                    showAlert(message);

                    // Add the item to the added items list
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
                if (item.foodId === list.id) {
                    flag = true;
                }
            })
            if (flag) {
                const existingListItem = document.getElementById("pc-${item.foodId}");
                if (existingListItem) {
                    // cant get list price and count fix it
                    existingListItem.textContent = item.price + " x " + item.count;
                }
            }
            else {
                const listItem = document.createElement("li");
                console.log(item.name + " " + item.price + " " + item.count + " " + item.img + " int update");
                const htmlList = "<img src='${pageContext.request.contextPath}/resources/images/foods/"+ item.img + "' alt='"+item.name+"'>" +
                    "<div>" +
                    "<h6>"+item.name+"</h6>" +
                    "<p class ='pc-" + item.foodId + "'>" + item.price + " x " + item.count + "</p>" +
                    "</div>";
                listItem.innerHTML = htmlList;
                addedItemsList.appendChild(listItem);
            }
        });
    }

    cartIcon.addEventListener("mouseenter", () => {
        cartDropdown.style.display = "block";
    });

    cartIcon.addEventListener("mouseleave", () => {
        cartDropdown.style.display = "none";
    });




</script>
</body>
</html>
