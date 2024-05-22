<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <title>show users</title>
</head>
<body>
<table border="1" cellpadding="5">
    <caption><h2>todo items</h2></caption>
    <tr>
        <th>fname</th>
        <th>lname</th>
        <th>password</th>
        <th>email</th>
        <th>phone</th>

    <c:forEach var="user" items="${users.userData}">

    <tr>
        <td><c:out value="${user.fname}"></c:out></td>
        <td><c:out value="${user.lname}"></c:out></td>
        <td><c:out value="${user.password}"></c:out></td>
        <td><c:out value="${user.email}"></c:out></td>
        <td><c:out value="${user.phone}"></c:out></td>
    </tr>
    </c:forEach>
    </tr>
</table>
</body>
</html>
