<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/24/2023
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product form</h1>
<c:choose >
    <c:when test="${empty product.id}">
        <form method="POST" action="products?action=create">
            <label for="nameProduct">Name: </label>
            <input type="text" id="nameProduct" name="nameProduct">
            <br> <br>
            <label for="priceProduct">Price:</label>
            <input type="text" id="priceProduct" name="priceProduct">
            <br><br>
            <label for="image">Image:</label>
            <input type="text" id="image" name="image">
            <br><br>
            <label for="orderStatus">Order Status:</label>
            <input type="text" id="orderStatus" name="orderStatus">
            <br><br>
            <input type="submit" value="Create">
            <a class="button" href="products">Cancel</a>
        </form>
    </c:when>

    <c:otherwise>
        <form method="POST" action="products?action=update">
            <input type="hidden" name="id" value="${product.id}">
            <label for="nameProduct">Name:</label>
            <input type="text" id="nameProduct" name="nameProduct" value="${product.nameProduct}">
            <br><br>

            <label for="priceProduct">Price:</label>
            <input type="text" id="priceProduct" name="priceProduct" value="${product.priceProduct}">
            <br> <br>
            <label for="image">Image:</label>
            <input type="text" id="image" name="image" value="${product.image}">
            <br><br>
            <label for="orderStatus">Order Status:</label>
            <input type="text" id="orderStatus" name="orderStatus" value="${product.orderStatus}">
            <br><br>
            <input type="submit" value="Update">
            <a class="button" href="products">Cancel</a>

        </form>
        <form method="POST" action="products?action=delete">
            <input type="hidden" name="id" value="${product.id}">
            <input class="button" type="submit" value="Delete">
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>