<%--
  Created by IntelliJ IDEA.
  User: Notebook
  Date: 5/22/2024
  Time: 8:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>users</title>
</head>
<body>
<table border="1" cellpadding="5">
    <caption><h2>show users</h2></caption>
    <tr>
        <th>fname</th>
        <th>lname</th>
        <th>email<th/>
        <th>phone<th/>

        <c:forEach var="user" users="${userData.userData}">

    <tr>
        <td><c:out value="${user.fname}"></c:out></td>
        <td><c:out value="${user.lname}"></c:out></td>
        <td><c:out value="${user.email}"></c:out></td>
        <td><c:out value="${user.phone}"></c:out></td>
    </tr>
    </c:forEach>
    </tr>
</table>
</body>
</html>
