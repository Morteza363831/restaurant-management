<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        }
        h2 {
            color: #2980b9;
        }

        .
        .icon {
            font-size: 24px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="container my-5">
    <div class="card">
        <div class="card-body">
            <h1 class="card-title"><i class="fas fa-utensils icon"></i>Profile</h1>
            <div class="row">
                <div class="col-md-6">
                    <h2><i class="fas fa-user icon"></i>First Name:</h2>
                    <p>${user.fname}</p>
                </div>
                <div class="col-md-6">
                    <h2><i class="fas fa-user icon"></i>Last Name:</h2>
                    <p>${user.lname}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <h2><i class="fas fa-envelope icon"></i>Email:</h2>
                    <p>${user.email}</p>
                </div>
                <div class="col-md-6">
                    <h2><i class="fas fa-phone icon"></i>Phone Number:</h2>
                    <p>${user.phone}</p>
                </div>
            </div>
            <a href="update-profile" class="btn btn-primary"><i class="fas fa-edit"></i>Make Changes</a>
        </div>
    </div>
</div>
</body>
</html>
