<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/19/2023
  Time: 8:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="tagDemo.Customer" %>
<%@page import="java.util.*" %>

<%
  List<Customer> data = new ArrayList<>();
  data.add(new Customer("Son5" , "Son6" ,false));
  data.add(new Customer("son7", "son8", true));
  pageContext.setAttribute("myCM", data);

%>

<html>
<head>
    <title>Title</title>
  <style>
    table {
      border-collapse: collapse;
      border: 2px solid #eee;
      width: 100%;
      margin: 20px 0;
      font: 12px/20px sans-serif;
    }

    th,td {
      padding: 8px;

    }

    th {
      background: #eee;
      text-align: left;
      font-weight: bold;
    }

    td{
      background-color: white;
      text-align: center;
    }

    td.special {
      font-size: medium;
      color: black;
    }
  </style>

</head>

<body>
<table border="1">
  <tr>Firt NAme</tr>
  <tr>Last Name</tr>
  <tr>Gold Customer</tr>
  <c:forEach var="tempCustomer" items="${myCM}">
  <tr>
    <td>${tempCustomer.firtName}</td>
    <td>${tempCustomer.lastName}</td>
    <td>
      <c:choose>
        <c:when test="${tempCustomer.godCustomer}">
          Special dicount
        </c:when>
        <c:otherwise>
          No account validate
        </c:otherwise>
      </c:choose>
    </td>
  </tr>





</c:forEach>
</table>
</body>
</html>
