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
        <c:if test="${tempCustomer.godCustomer}">
          Special Discount
        </c:if>
        <c:if test="${not tempCustomer.godCustomer}">
          -----------
        </c:if>
      </td>
    </tr>


  </c:forEach>

</table>


</body>
</html>
