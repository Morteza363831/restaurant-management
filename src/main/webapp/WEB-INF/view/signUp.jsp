<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>signUp</title>
</head>

    <body>
        <h1 align="center">sign up</h1>
        <br>
        <br>
        <div align="center">

            <form:form action="${pageContext.request.contextPath}/addUser" method="post" modelAttribute="user">
                <label>first name :</label>
                <br>
                <form:input path="fname"></form:input>
                <br>
                <label>last name :</label>
                <br>
                <form:input path="lname"></form:input>
                <br>
                <label>password :</label>
                <br>
                <form:input path="password"></form:input>
                <br>
                <label>email :</label>
                <br>
                <form:input path="email"></form:input>
                <br>
                <label>phone number :</label>
                <br>
                <form:input path="phone"></form:input>
                <br>
                <input type="submit" value="SIGN UP">
            </form:form>

        </div>

    </body>

</html>
