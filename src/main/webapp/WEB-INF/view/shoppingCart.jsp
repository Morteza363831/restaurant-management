<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <style>
        .navbar {
            background-color: #2980b9 !important;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            animation: slideInDown 0.5s ease-in-out;
        }

        .navbar-brand {
            color: #FFFFFF; /* White text color for "Restaurant Management" */
            transition: color 0.3s;
        }

        .navbar.fixed-top .navbar-brand {
            color: #FFD700; /* Change text color when navbar is fixed to the top */
        }
        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: bold;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3e%3cpath stroke='rgba(255, 255, 255, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
        /* Add your custom CSS styles here */
        .food-card {
            display: flex;
            flex-direction: row;
            align-items: center;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            margin-bottom: 1rem;
        }

        .food-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .food-card img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 1rem;
        }

        .food-card .card-body {
            flex-grow: 1;
            padding: 1rem;
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
            align-items: center;
            margin-bottom: 1rem;
        }

        .input-group .btn {
            flex: 0 0 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .input-group input {
            flex: 1;
            max-width: 60px;
            max-height: 40px;
            text-align: center;
        }

        .btn-remove {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #fff;
        }

        .btn-remove:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .footer {
            background-color: #f8f9fa;
            padding: 1rem;
            text-align: center;
            margin-top: 2rem;
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
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">Restaurant Management</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav animate">
                <li class="nav-item animate">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Restaurants</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-5 pt-5 animate__animated animate__fadeInUp">
    <h1 class="mb-4 animate__animated animate__fadeInDown">Shopping Cart</h1>
    <c:forEach var="transaction" items="${transactions}">
        <div class="card food-card animate__animated animate__fadeInUp" id="card-${transaction.transactionId}">
            <img src="${pageContext.request.contextPath}/resources/images/foods/${transaction.foodImg}" alt="${transaction.foodName}">
            <div class="card-body">
                <h5 class="card-title animate__animated animate__fadeInLeft">${transaction.foodName}</h5>
                <p class="card-text animate__animated animate__fadeInRight">$${transaction.foodPrice}</p>
                <div class="input-group animate__animated animate__fadeInUp">
                    <button class="btn btn-outline-secondary btn-minus" type="button" id="${transaction.transactionId}">-</button>
                    <input type="text" class="form-control form-control-sm text-center" name="foodCount" id="quantity-${transaction.transactionId}" value="${transaction.foodCount}">
                    <button class="btn btn-outline-secondary btn-plus" type="button" id="${transaction.transactionId}">+</button>
                </div>
                <form:form action="${pageContext.request.contextPath}/updateCart" id="${transaction.transactionId}" cssClass="updateForm" method="post">
                    <input type="hidden" name="transactionId" value="${transaction.transactionId}">
                    <button type="submit" class="btn btn-primary btn-sm animate__animated animate__fadeInLeft">Save Changes</button>
                </form:form>
                <form:form action="${pageContext.request.contextPath}/removeFromCart" id="${transaction.transactionId}" cssClass="removeForm" method="post">
                    <input type="hidden" name="transactionId" id="transaction-${transaction.transactionId}" value="${transaction.transactionId}">
                    <button type="submit" class="btn btn-remove btn-sm animate__animated animate__fadeInRight">Remove</button>
                </form:form>
            </div>
        </div>
    </c:forEach>
    <div class="d-flex justify-content-between mt-4 animate__animated animate__fadeInUp">
        <a href="${pageContext.request.contextPath}/menu" class="btn btn-primary animate__animated animate__fadeInLeft">Back to Menu</a>
        <a href="${pageContext.request.contextPath}/checkout" class="btn btn-success animate__animated animate__fadeInRight">Proceed to Checkout</a>
    </div>
</div>
<footer class="footer">
    <p>&copy; 2023 Restaurant Management. All rights reserved.</p>
</footer>

<div class="alert alert-success alert-dismissible fade show animate__animated animate__fadeInUp" role="alert" id="update-alert" style="display: none;">
    <strong>Added to Cart!</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<div class="alert alert-danger alert-dismissible fade show animate__animated animate__fadeInUp" role="alert" id="remove-alert" style="display: none;">
    <strong>Added to Cart!</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>


<script>
    const minusButtons = document.querySelectorAll(".btn-minus");
    const plusButtons = document.querySelectorAll(".btn-plus");
    const updateForms = document.querySelectorAll(".updateForm");
    const removeForms = document.querySelectorAll(".removeForm")

    updateForms.forEach(updateForm => {
        updateForm.addEventListener("submit", async function (event) {
            event.preventDefault();

            const transactionId = updateForm.id.valueOf();
            const foodCount = document.getElementById("quantity-"+transactionId).value;


            try {
                const response = await fetch("${pageContext.request.contextPath}/updateCart", {
                    method: "POST",
                    body: new URLSearchParams({transactionId,foodCount}),
                });

                if (response.ok) {
                    const message = await response.text();
                    showAlert(message,0);
                } else {
                    console.error("Error during update item:", response.status);
                }
            } catch (error) {
                console.error("Error:", error);
            }
        });
    });

    removeForms.forEach(removeForm => {
        removeForm.addEventListener("submit", async function (event) {
            event.preventDefault();

            const transactionId = removeForm.id.valueOf();

            try {
                const response = await fetch("${pageContext.request.contextPath}/removeFromCart", {
                    method: "POST",
                    body: new URLSearchParams({transactionId}),
                });

                if (response.ok) {
                    const message = await response.text();
                    document.getElementById("card-"+transactionId).remove();
                    showAlert(message,1);
                } else {
                    console.error("Error during remove item:", response.status);
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

    function showAlert(message,flag) {
        if (flag === 0) {
            const alert = document.getElementById("update-alert");
            alert.querySelector("strong").textContent = message;
            alert.style.display = "block";
            alert.classList.add("animate__animated", "animate__fadeInUp");

            setTimeout(() => {
                alert.style.display = "none";
                alert.classList.remove("animate__animated", "animate__fadeInUp");
            }, 3000);
        }
        else {
            const alert = document.getElementById("remove-alert");
            alert.querySelector("strong").textContent = message;
            alert.style.display = "block";
            alert.classList.add("animate__animated", "animate__fadeInUp");

            setTimeout(() => {
                alert.style.display = "none";
                alert.classList.remove("animate__animated", "animate__fadeInUp");
            }, 3000);
        }
    }

</script>
</body>
</html>
