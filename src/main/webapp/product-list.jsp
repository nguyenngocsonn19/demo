<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/24/2023
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>

</head>
<body>
<h1>Product List</h1>
<a class="button add-button" href="products?action=new">Add new product</a>
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Price</th>
    <th>Image</th>
    <th>Order Status</th>
    <th>Action</th>
  </tr>

  <c:forEach var="product" items="${productList}">
    <tr>
      <td>${product.id}</td>
      <td>${product.nameProduct}</td>
      <td>${product.priceProduct}</td>
      <td>${product.image}</td>
      <td>${product.orderStatus}</td>
      <td>
        <a class="button" href="products?action=edit&id=${product.id}">Edit</a>
        <a class="button" href="products?action=delete&id=${product.id}" onclick="return confirm('Are you sure delete this product??')">Delete</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>