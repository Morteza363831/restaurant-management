<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sign in</title>
</head>
<body>
    <div align="center">
        <form:form action="${pageContext.request.contextPath}/getUser" method="post" modelAttribute="user">
            <label>phone number :</label>
            <br>
            <form:input path="phone"></form:input>
            <br>
            <label>password :</label>
            <br>
            <form:input path="password"></form:input>
            <br>
            <input type="submit" value="SIGN IN">
        </form:form>
    </div>
</body>
</html>
