<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 8/1/2023
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search view</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="users?action=search">Search Users</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <input type="text" name="search" value="Enter country">
        <input type="submit" value="Search">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Search View
                </h2>
            </caption>
            <tr>
                <th>User ID:</th>
                <th>User Name:</th>
                <th>User Email:</th>
                <th>User Country:</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>
                            ${user.id}
                    </td>
                    <td>
                            ${user.name}
                    </td>
                    <td>
                            ${user.email}
                    </td>
                    <td>
                            ${user.country}
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
</body>
</html>
