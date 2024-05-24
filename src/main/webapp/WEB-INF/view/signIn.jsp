<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            color: #212529;
            background-color: #E9ECEF;
            font-family: 'Times New Roman', Times, serif;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
            text-align: center;
        }

        .div-1 {
            padding: 10vw;
            animation: fadeInRight 1s ease-in-out;
        }

        .div-2 {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 5vw;
            animation: fadeInLeft 1s ease-in-out;
        }

        .cup {
            position: relative;
            width: 15vw;
            height: 40vh;
            background: linear-gradient(to right, #F8F9FA, #CED4DA);
            margin-left: 2vw;
            border-bottom-left-radius: 38%;
            border-bottom-right-radius: 38%;
            display: flex;
            align-items: center;
            text-align: center;
            justify-content: center;
            color: #F8F9FA;
            animation: fadeInLeft 1s ease-in-out;
        }

        .cup:hover {
            display: flex;
            align-items: center;
            text-align: center;
            justify-content: center;
            transition-duration: 1s;
            color: #c57e65;
        }

        .top {
            position: absolute;
            top: -4vh;
            width: 15vw;
            height: 8vh;
            background: linear-gradient(to right, #F8F9FA, #CED4DA);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .circle {
            position: absolute;
            top: 1vh;
            width: 14vw;
            height: 6vh;
            background: linear-gradient(to left, #F8F9FA, #CED4DA);
            background-color: #000000;
            border-radius: 50%;
            display: flex;
            box-sizing: border-box;
            overflow: hidden;
        }

        .tea {
            position: absolute;
            top: 2.8vh;
            width: 100%;
            height: 100%;
            background: linear-gradient(#c57e65, #e28462);
            border-radius: 50%;
        }

        .handle {
            position: absolute;
            width: 5vw;
            height: 16vh;
            border: solid 3vh #CED4DA;
            border-left: solid 3vh transparent;
            border-bottom: solid 3vh transparent;
            border-radius: 50%;
            transform: rotate(35deg);
            margin-left: 14vw;
            margin-top: 32vh;
        }

        .plate {
            position: absolute;
            transform: translateX(-50%);
            width: 25vw;
            height: 18vh;
            background: linear-gradient(to right, #F8F9FA, #CED4DA);
            border-radius: 50%;
            margin-left: 27vw;
            margin-top: 36vh;
            box-shadow: 0 35px 35px rgba(0, 0, 0, 0.2);
        }

        .plate::before {
            content: "";
            position: absolute;
            top: 0.5vw;
            left: 0.5vw;
            right: 0.5vw;
            bottom: 0.5vw;
            border-radius: 50%;
            background: linear-gradient(to left, #F8F9FA, #CED4DA);
        }

        .plate::after {
            content: "";
            position: absolute;
            top: 40px;
            left: 30px;
            right: 30px;
            bottom: 25px;
            background: radial-gradient(rgba(0, 0, 0, 0.2) 25%, transparent, transparent);
            border-radius: 50%;
        }

        .vapour {
            position: relative;
            display: flex;
            z-index: 1;
        }

        .vapour span {
            position: relative;
            bottom: 10px;
            display: block;
            margin: 0.2vw;
            min-width: 0.3vw;
            height: 10vh;
            background: #ADB5BD;
            border-radius: 50%;
            animation: animate 5s linear infinite;
            opacity: 0;
            filter: blur(3px);
            animation-delay: calc(var(--i) * -0.5s);
        }

        @keyframes animate {
            0% {
                transform: translateY(0) scaleX(1);
                opacity: 0;
            }
            15% {
                opacity: 1;
            }
            50% {
                transform: translateY(-80px) scaleX(5);
            }
            95% {
                opacity: 0;
            }
            100% {
                transform: translateY(-160px) scaleX(10);
            }
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

        @keyframes fadeInLeft {
            0% {
                opacity: 0;
                transform: translateX(20px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>


<form:form action="${pageContext.request.contextPath}/getUser" method="post" modelAttribute="user" class="bg-light p-5 rounded shadow div-1">
    <h1 class="text-center mb-4">Sign In</h1>
    <div class="form-group">
        <label for="phone">Phone Number:</label>
        <form:input path="phone" id="phone" class="form-control form-control-lg"></form:input>
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <form:input path="password" id="password" type="password" class="form-control form-control-lg"></form:input>
    </div>
    <div class="text-center">
        <button type="submit" class="btn btn-primary btn-lg">Sign In</button>
    </div>
</form:form>


<div class="div-2">
    <div class="plate"></div>
    <div class="cup">
        <h2>Java</h2>
        <div class="top">
            <div class="vapour">
                <span style="--i:1"></span>
                <span style="--i:3"></span>
                <span style="--i:2"></span>
                <span style="--i:8"></span>
                <span style="--i:7"></span>
                <span style="--i:10"></span>
                <span style="--i:9"></span>
                <span style="--i:14"></span>
                <span style="--i:19"></span>
                <span style="--i:11"></span>
                <span style="--i:13"></span>
                <span style="--i:4"></span>
                <span style="--i:15"></span>
                <span style="--i:12"></span>
                <span style="--i:5"></span>
                <span style="--i:6"></span>
                <span style="--i:18"></span>
                <span style="--i:16"></span>
                <span style="--i:17"></span>
                <span style="--i:20"></span>
            </div>
            <div class="circle">
                <div class="tea">

                </div>
            </div>
            <div class="handle"></div>
        </div>
    </div>
</div>
</body>
</html>
