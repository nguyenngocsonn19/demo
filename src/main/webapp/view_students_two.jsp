<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/24/2023
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>

    <style>
        table,td ,th {
            border: 1px solid;
        }

        table{
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<h2>Student Table Demo</h2>
<table>
    <tr>
        <th>First Name</th>
        <th>Class Name</th>
        <th>Age</th>
    </tr>
    <c:forEach var="tempStudent" items="${student_list}">


        <tr>
            <td>${tempStudent.firstName}</td>
            <td>${tempStudent.className}</td>
            <td>${tempStudent.age}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
