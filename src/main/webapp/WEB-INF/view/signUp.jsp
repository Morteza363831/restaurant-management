<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
            text-align: center;
        }

        .div-1 {
            padding: 3rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeInRight 0.8s ease-in-out;
        }

        .form-group {
            margin-bottom: 20px;
            animation: fadeInUp 0.8s ease-in-out;
        }

        .btn-primary {
            background-color: #2980b9;
            border-color: #2980b9;
            animation: fadeInUp 0.8s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #1c6fa5;
            border-color: #1c6fa5;
        }

        .icon {
            font-size: 24px;
            margin-right: 10px;
            color: #2980b9;
        }

        @keyframes fadeInRight {
            0% {
                opacity: 0;
                transform: translateX(-20px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<div class="div-1">
    <h1 class="text-center mb-4 animate__animated animate__fadeInDown">Sign Up</h1>
    <form:form action="${pageContext.request.contextPath}/addUser" method="post" modelAttribute="user" class="bg-light p-4 rounded shadow">
        <div class="form-group animate__animated animate__fadeInUp">
            <i class="fas fa-user icon"></i>
            <label for="fname">First Name:</label>
            <form:input path="fname" id="fname" class="form-control"></form:input>
        </div>
        <div class="form-group animate__animated animate__fadeInUp">
            <i class="fas fa-user icon"></i>
            <label for="lname">Last Name:</label>
            <form:input path="lname" id="lname" class="form-control"></form:input>
        </div>
        <div class="form-group animate__animated animate__fadeInUp">
            <i class="fas fa-lock icon"></i>
            <label for="password">Password:</label>
            <form:input path="password" id="password" type="password" class="form-control"></form:input>
        </div>
        <div class="form-group animate__animated animate__fadeInUp">
            <i class="fas fa-envelope icon"></i>
            <label for="email">Email:</label>
            <form:input path="email" id="email" class="form-control"></form:input>
        </div>
        <div class="form-group animate__animated animate__fadeInUp">
            <i class="fas fa-phone icon"></i>
            <label for="phone">Phone Number:</label>
            <form:input path="phone" id="phone" class="form-control"></form:input>
        </div>
        <div class="text-center animate__animated animate__fadeInUp">
            <button type="submit" class="btn btn-primary">Sign Up</button>
        </div>
    </form:form>
</div>
</body>
</html>
