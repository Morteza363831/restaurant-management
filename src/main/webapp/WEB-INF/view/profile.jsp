<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        .card-title {
            font-weight: bold;
            color: #2980b9;
        }
        h2 {
            color: #2980b9;
            font-weight: bold;
        }
        .icon {
            font-size: 24px;
            margin-right: 10px;
            color: #2980b9;
        }
        .back-button {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .btn {
            margin-right: 10px;
        }
        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background-image: url('https://via.placeholder.com/150');
            background-size: cover;
            background-position: center;
            margin-bottom: 20px;
        }
        .profile-info {
            border-left: 3px solid #2980b9;
            padding-left: 20px;
        }
        .btn-primary {
            background-color: #2980b9;
            border-color: #2980b9;
        }
        .btn-primary:hover {
            background-color: #1c6fa5;
            border-color: #1c6fa5;
        }
    </style>
</head>
<body>
<div class="container my-5">
    <div class="card">
        <div class="card-body">
            <div class="text-center">
                <div class="profile-image"></div>
                <h1 class="card-title"><i class="fas fa-utensils icon"></i>User Profile</h1>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="profile-info">
                        <h2><i class="fas fa-user icon"></i>First Name</h2>
                        <p>${user.fname}</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-info">
                        <h2><i class="fas fa-user icon"></i>Last Name</h2>
                        <p>${user.lname}</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="profile-info">
                        <h2><i class="fas fa-envelope icon"></i>Email</h2>
                        <p>${user.email}</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-info">
                        <h2><i class="fas fa-phone icon"></i>Phone Number</h2>
                        <p>${user.phone}</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="profile-info">
                        <h2><i class="fas fa-key icon"></i>Access Level</h2>
                        <p>${user.accessLevel}</p>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-end">
                <a href="${pageContext.request.contextPath}/profile/update" class="btn btn-primary">
                    <i class="fas fa-edit"></i> Make Changes
                </a>
                <a href="${pageContext.request.contextPath}/restaurants" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to Restaurants
                </a>
                <a href="logout" class="btn btn-danger">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
                <a href="${pageContext.request.contextPath}/deleteAccount" class="btn btn-danger">
                    <i class="fas fa-trash"></i> Delete Account
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
