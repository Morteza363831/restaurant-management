<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Restaurant List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container my-5">
    <h1 class="mb-4">Restaurant List</h1>

    <div class="row">
        <sql:query var="restaurants" dataSource="jdbc/myDataSource">
            SELECT * FROM restaurants
        </sql:query>

        <c:forEach var="restaurant" items="${restaurants}">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img src="/resources/images/image1.jpg" class="card-img-top" alt="Restaurant Image">
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${restaurant.restName}"/></h5>
                        <p class="card-text"><c:out value="${restaurant.restDescription}"/></p>
                        <form action="${pageContext.request.contextPath}/getRestaurant" method="post">
                            <input type="hidden" name="restaurantId" value="${restaurant.restName}">
                            <button type="submit" class="btn btn-primary">View Details</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="navbar fixed-bottom bg-light py-3">
    <div class="container">
        <a href="profile.jsp" class="btn btn-outline-primary">Profile</a>
        <a href="#" class="btn btn-outline-primary">Link 1</a>
        <a href="#" class="btn btn-outline-primary">Link 2</a>
        <a href="#" class="btn btn-outline-primary">Link 3</a>
    </div>
</div>
</body>
</html>
