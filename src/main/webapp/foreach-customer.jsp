<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/19/2023
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="tagDemo.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    List<Customer> data = new ArrayList<>();
    data.add(new Customer("Son" , "Son2" , false));
    data.add(new Customer("Son3" , "Son4" , true));

    pageContext.setAttribute("myCM", data);

%>
<html>
<head>
    <title>Title</title>


</head>



<body>

<table border="1">
    <tr>Firt NAme</tr>
    <tr>Last Name</tr>
    <tr>Gold Customer</tr>
</table>

<c:forEach var="tempCustomer" items="${myCM}">
    <tr>
      <td>${tempCustomer.firtName}</td>
      <td>${tempCustomer.lastName}</td>
      <td>${tempCustomer.godCustomer}</td>
    </tr>


</c:forEach>

</body>
</html>
