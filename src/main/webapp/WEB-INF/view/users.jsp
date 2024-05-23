<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <title>show users</title>
</head>
<body>

<div align="center">

    <table border="1" cellpadding="5">
        <caption><h2>users</h2></caption>
        <tr>
            <th>fname</th>
            <th>lname</th>

            <c:forEach var="user" items="${users}">

                <tr>
                    <td><c:out value="${user.fname}"></c:out></td>
                    <td><c:out value="${user.lname}"></c:out></td>
                </tr>
            </c:forEach>
        </tr>
    </table>
</div>
</body>
</html>
