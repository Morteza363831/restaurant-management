<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
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
<div class="container my-5">
    <h1 class="mb-4 animate">User Profile</h1>

    <c:if test="${not empty message}">
        <div class="alert alert-success animate" role="alert">
                ${message}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/getUpdates" method="post">
        <div class="form-group animate">
            <label for="fname">First Name:</label>
            <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter new name" required>
        </div>
        <div class="form-group animate">
            <label for="lname">Last Name:</label>
            <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter new last name" required>
        </div>
        <div class="form-group animate">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="${user.email}" disabled required>
        </div>
        <div class="form-group animate">
            <label for="phone">Phone:</label>
            <input type="tel" class="form-control" id="phone" name="phone" value="${user.phone}" disabled required>
        </div>
        <div class="form-group animate">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter new password">
        </div>
        <button type="submit" class="btn btn-primary animate">Update Profile</button>
    </form>

    <div class="mt-4">
        <a href="${pageContext.request.contextPath}/restaurant-list" class="btn btn-secondary animate">Back to Restaurant List</a>
    </div>
</div>
</body>
</html>
