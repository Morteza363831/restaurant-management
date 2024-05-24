<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Restaurant List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        body {
            padding-top: 70px; /* Add padding to the top of the body to avoid content being hidden by the fixed navbar */
        }
        .fa-shopping-cart {
            font-size: 24px;
            color: white;
        }
        .animate {
            animation: fadeIn 1s ease-in-out;
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
        <a href="cart.html" class="text-white animate"><i class="fas fa-shopping-cart fa-lg"></i></a>
    </div>
</nav>

<div class="container my-5">
    <h1 class="mb-4 animate">Restaurant List</h1>

    <div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
        <c:forEach var="restaurant" items="${restaurants}" begin="0" end="2">
            <div class="col animate">
                <div class="card h-100">
                    <img src="${pageContext.request.contextPath}/resources/images/<c:out value="${restaurant.restImg}"/>" class="card-img-top" alt="Restaurant Image">
                    <div class="card-body">
                        <h5 class="card-title animate"><c:out value="${restaurant.restName}"/></h5>
                        <p class="card-text animate"><c:out value="${restaurant.restDescription}"/></p>
                        <form action="${pageContext.request.contextPath}/getRestaurant" method="post">
                            <input type="hidden" name="restaurantId" value="${restaurant.restName}">
                            <button type="submit" class="btn btn-primary animate">View Details</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="restaurant" items="${restaurants}" begin="3">
            <div class="col animate">
                <div class="card h-100">
                    <img src="${pageContext.request.contextPath}/resources/images/<c:out value="${restaurant.restImg}"/>" class="card-img-top" alt="Restaurant Image">
                    <div class="card-body">
                        <h5 class="card-title animate"><c:out value="${restaurant.restName}"/></h5>
                        <p class="card-text animate"><c:out value="${restaurant.restDescription}"/></p>
                        <form action="${pageContext.request.contextPath}/getRestaurant" method="post">
                            <input type="hidden" name="restaurantId" value="${restaurant.restName}">
                            <button type="submit" class="btn btn-primary animate">View Details</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
