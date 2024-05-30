<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .container {
            margin-top: 5rem;
            background-color: #fff;
            padding: 3rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: animate__fadeInUp 1s ease-in-out;
        }

        .form-group {
            margin-bottom: 1.5rem;
            animation: animate__fadeInUp 0.8s ease-in-out;
        }

        .btn {
            margin-top: 1rem;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem 1rem;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #2980b9;
            border-color: #2980b9;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #1c6fa5;
            border-color: #1c6fa5;
        }

        .btn-warning {
            background-color: #f39c12;
            border-color: #f39c12;
            color: #fff;
        }

        .btn-warning:hover {
            background-color: #e67e22;
            border-color: #e67e22;
        }

        .btn-secondary {
            background-color: #7f8c8d;
            border-color: #7f8c8d;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #95a5a6;
            border-color: #95a5a6;
        }

        .btn-icon {
            margin-right: 0.5rem;
            font-size: 1.2rem;
            color: #333333;
        }

        a.btn {
            display: inline-flex;
            align-items: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4 animate__animated animate__fadeInDown">Update Profile</h1>

    <c:if test="${not empty message}">
        <div class="alert alert-success animate__animated animate__fadeInUp" role="alert">
                ${message}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/getUpdates" method="post" class="animate__animated animate__fadeInUp">
        <div class="form-group">
            <label for="fname">First Name:</label>
            <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter new name" required>
        </div>
        <div class="form-group">
            <label for="lname">Last Name:</label>
            <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter new last name" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="${user.email}" disabled required>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="tel" class="form-control" id="phone" name="phone" value="${user.phone}" disabled required>
        </div>
        <div class="form-group">
            <label for="accessLevel">Access Level:</label>
            <input type="tel" class="form-control" id="accessLevel" name="accessLevel" value="${user.accessLevel}" disabled required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter new password">
        </div>
        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary animate__animated animate__fadeInUp">
                <i class="fas fa-save btn-icon"></i> Update Profile
            </button>

            <a href="${pageContext.request.contextPath}/profile" class="btn btn-warning animate__animated animate__fadeInUp">
                <i class="fas fa-undo btn-icon"></i> Discard Changes
            </a>

            <a href="${pageContext.request.contextPath}/restaurants" class="btn btn-secondary animate__animated animate__fadeInUp">
                <i class="fas fa-arrow-left btn-icon"></i> Back to Restaurants
            </a>
        </div>
    </form>
</div>
</body>
</html>
