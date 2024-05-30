<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

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
        body {
            font-family: 'Montserrat', sans-serif;
            padding-top: 80px; /* Add padding to the top of the body to avoid content being hidden by the fixed navbar */
            background-color: #f8f9fa;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            animation: fadeIn 0.5s ease-in-out;
        }
        .card-title {
            font-weight: bold;
            color: #2980b9;
            animation: slideInLeft 0.5s ease-in-out;
        }
        .card-text {
            color: #666;
            animation: slideInRight 0.5s ease-in-out;
        }
        .btn-primary {
            background-color: #2980b9;
            border-color: #2980b9;
            animation: fadeIn 0.5s ease-in-out;
        }
        .btn-primary:hover {
            background-color: #1c6fa5;
            border-color: #1c6fa5;
        }
        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }
        @keyframes slideInLeft {
            0% { opacity: 0; transform: translateX(-20px); }
            100% { opacity: 1; transform: translateX(0); }
        }
        @keyframes slideInRight {
            0% { opacity: 0; transform: translateX(20px); }
            100% { opacity: 1; transform: translateX(0); }
        }
        .navbar {
            background-color: #2980b9 !important;
            animation: slideInDown 0.5s ease-in-out;
        }
        @keyframes slideInDown {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: bold;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3e%3cpath stroke='rgba(255, 255, 255, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
        .container {
            animation: fadeIn 0.5s ease-in-out;
        }


        /* Keyframes for fade-in animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .section.fade-out {
            opacity: 0;
            transition: opacity 0.5s ease;
        }


        .scroll-animation {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s, transform 0.5s;
        }

        .scroll-animation.animated {
            opacity: 1;
            transform: translateY(0);
        }

        /* Scrolling timeline animation */
        .timeline-container {
            position: fixed;
            top: 50%;
            left: 8%;
            transform: translate(-50%, -50%);
            z-index: 1000;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .timeline-circle {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: #ccc;
            margin: 20px 0;
            transition: background-color 0.5s ease;
        }

        .timeline-circle.active {
            background-color: #2980b9;
        }

        .timeline-line {
            width: 4px;
            height: 0;
            background-color: #ccc;
            transition: height 0.8s ease, background-color 0.8s ease;
        }

        .timeline-line.active {
            height: 60px;
            background-color: #2980b9;
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
            <ul class="navbar-nav">
                <li class="nav-item active">
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

<div class="container my-5 pt-5">
    <h1 class="mb-4 ">Restaurant Management</h1>

    <section class="py-5">
        <div class="container">
            <h2 class="mb-4 ">Welcome to Our Restaurant</h2>
            <p class="">Discover the finest dining experience in town. Our restaurant offers a wide variety of delectable dishes, prepared with the freshest ingredients and served with impeccable service.</p>
        </div>
    </section>

    <section class="bg-light py-5">
        <div class="container">
            <h2 class="mb-4 scroll-animation">Our Story</h2>
            <p class="scroll-animation">Our restaurant has a rich history, dating back to the early 20th century. We've been serving the community with passion and dedication, always striving to provide an unforgettable dining experience.</p>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <h2 class="mb-4 scroll-animation">Our Menu</h2>
            <p class="scroll-animation">Explore our diverse menu, featuring a wide range of delectable dishes, from classic favorites to innovative creations. Our chefs use only the finest ingredients to ensure every bite is a delight.</p>
        </div>
    </section>

    <section class="bg-light py-5">
        <div class="container">
            <h2 class="mb-4 scroll-animation">About Us</h2>
            <p class="scroll-animation">At our restaurant, we are passionate about providing an exceptional dining experience. Our team of dedicated professionals is committed to delivering exceptional service and creating unforgettable memories for our guests.</p>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <h2 class="mb-4 scroll-animation">Contact Us</h2>
            <p class="scroll-animation">Get in touch with us to learn more about our restaurant or to make a reservation. We're always happy to assist you and answer any questions you may have.</p>
        </div>
    </section>

    <div class="container my-5">
        <h1 class="mb-4 scroll-animation">Restaurant List</h1>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach var="restaurant" items="${restaurants}" begin="0">
                <div class="col mb-4 animate__animated animate__fadeInUp">
                    <div class="card h-100">
                        <img src="${pageContext.request.contextPath}/resources/images/restaurants/<c:out value="${restaurant.restImg}"/>" class="card-img-top" alt="Restaurant Image">
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${restaurant.restName}"/></h5>
                            <p class="card-text"><c:out value="${restaurant.restDescription}"/></p>
                            <form action="${pageContext.request.contextPath}/getRestaurant" method="post">
                                <input type="hidden" name="restId" value="${restaurant.restId}">
                                <button type="submit" class="btn btn-primary">View Details</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <section class="bg-light py-5">
        <div class="container">
            <h2 class="mb-4 scroll-animation">Our Commitment</h2>
            <p class="scroll-animation">We are committed to providing a sustainable and eco-friendly dining experience. Our restaurant sources ingredients locally and minimizes waste to reduce our environmental impact.</p>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <h2 class="mb-4 scroll-animation">Join Our Team</h2>
            <p class="scroll-animation">If you're passionate about food and hospitality, we'd love to have you join our team. Check out our current job openings and apply today.</p>
        </div>
    </section>

    <section class="bg-light py-5">
        <div class="container">
            <h2 class="mb-4 scroll-animation">Contact Us</h2>
            <form class="scroll-animation">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter your name">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter your email">
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea class="form-control" id="message" rows="3" placeholder="Enter your message"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </section>

    <footer class="bg-dark text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>Restaurant Management</h5>
                    <p>&copy; 2023 Restaurant Management. All rights reserved.</p>
                </div>
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Home</a></li>
                        <li><a href="#" class="text-white">Restaurants</a></li>
                        <li><a href="profile" class="text-white">Profile</a></li>
                        <li><a href="#" class="text-white">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>Follow Us</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white"><i class="fab fa-facebook-f mr-2"></i>Facebook</a></li>
                        <li><a href="#" class="text-white"><i class="fab fa-twitter mr-2"></i>Twitter</a></li>
                        <li><a href="#" class="text-white"><i class="fab fa-instagram mr-2"></i>Instagram</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>

<div class="timeline-container">
    <div class="timeline-circle active"></div>
    <div class="timeline-line"></div>
    <div class="timeline-circle"></div>
    <div class="timeline-line"></div>
    <div class="timeline-circle"></div>
    <div class="timeline-line"></div>
    <div class="timeline-circle"></div>
    <div class="timeline-line"></div>
    <div class="timeline-circle"></div>
    <div class="timeline-line"></div>
    <div class="timeline-circle"></div>
    <div class="timeline-line"></div>
    <div class="timeline-circle"></div>
    <div class="timeline-line"></div>
    <div class="timeline-circle"></div>
</div>

<script>
    // Scroll animations
    window.addEventListener('scroll', () => {
        const scrollElements = document.querySelectorAll('.scroll-animation');

        scrollElements.forEach(element => {
            if (isElementInViewport(element)) {
                element.classList.add('animated');
            }
        });

        // Scrolling timeline animation
        const timelineCircles = document.querySelectorAll('.timeline-circle');
        const timelineLines = document.querySelectorAll('.timeline-line');
        const sections = document.querySelectorAll('section');

        sections.forEach((section, index) => {
            if (isElementInViewport(section)) {
                timelineCircles[index].classList.add('active');
                timelineLines[index].classList.add('active');
            } else {
                timelineCircles[index].classList.remove('active');
                timelineLines[index].classList.remove('active');
            }
        });
    });

    function isElementInViewport(el) {
        const rect = el.getBoundingClientRect();
        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }
</script>
</body>
</html>

