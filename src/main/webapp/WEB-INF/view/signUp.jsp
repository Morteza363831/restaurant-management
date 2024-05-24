<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
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
<div class="container my-5">
    <h1 class="text-center mb-4 animate">Sign Up</h1>
    <div class="row justify-content-center">
        <div class="col-md-6 animate">
            <form:form action="${pageContext.request.contextPath}/addUser" method="post" modelAttribute="user" class="bg-light p-4 rounded shadow">
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <form:input path="fname" id="fname" class="form-control"></form:input>
                </div>
                <div class="form-group">
                    <label for="lname">Last Name:</label>
                    <form:input path="lname" id="lname" class="form-control"></form:input>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <form:input path="password" id="password" type="password" class="form-control"></form:input>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <form:input path="email" id="email" class="form-control"></form:input>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <form:input path="phone" id="phone" class="form-control"></form:input>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
