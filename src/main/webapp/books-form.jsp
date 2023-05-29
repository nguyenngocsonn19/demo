<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/26/2023
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>Book Form</h1>

<c:choose>
    <c:when test="${empty books.bookId}">
        <form method="POST" action="books?action=create">
            <label for="bookTitle">BookTitle:</label>
            <input type="text" id="bookTitle" name="bookTitle">
            <br> <br>
            <label for="bookPrice">BookPrice :</label>
            <input type="text" id="bookPrice" name="bookPrice">
            <br><br>
            <label for="author">Author:</label>
            <input type="text" id="author" name="author">
            <br> <br>
            <label for="quantity">Quantity :</label>
            <input type="text"  id="quantity" name="quantity">
            <br><br>
            <input type="submit" value="Create">
            <a class="button" href="books">Cancel</a>


        </form>



    </c:when>
    <c:otherwise>
        <form method="POST" action="books?action=update">
            <input type="hidden" name="bookId" value="${books.bookId}">
            <label for="bookTitle">BookTitle:</label>
            <input type="text" id="bookTitle" name="bookTitle" value="${books.bookTitle}">
            <br> <br>


            <label for="bookPrice">BookPrice:</label>
            <input type="text" id="bookPrice" name="bookPrice" value="${books.bookPrice}">
            <br><br>

            <label  for="author">Author</label>
            <input type="text" id="author" name="author" value="${books.author}">
            <br> <br>

            <label for="quantity">Quantity</label>
            <input type="text" id="quantity" name="quantity" value="${books.quantity}">
            <br><br>

            <input type="submit" value="Update">
            <a class="button" href="books">Cancel</a>
        </form>

        <form method="POST" action="books?action=delete">
            <input type="hidden" name="bookId" value="${books.bookId}">
            <input class="button" type="submit" value="Delete">

        </form>
    </c:otherwise>


</c:choose>
</body>
</html>
