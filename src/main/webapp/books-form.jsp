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
    <style>
        body{
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }

        form {
            width: 300px;
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"]{
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"],a.button{
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;

        }
        input[type="submit"]:hover, a.button:hover{
            background-color: #45a049;
        }
        a.button{
            margin-left: 5px;
        }
    </style>
</head>
<body>
<h1>Book Form</h1>

<c:choose>
    <c:when test="${empty books.bookId}">
        <form method="POST" action="books?action=create"  enctype="multipart/form-data">
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
            <lable for="img" >Img</lable>
            <input type="file" id="img" name="img">
            <br> <br>
            <input type="submit" value="Create">
            <a class="button" href="books">Cancel</a>



        </form>



    </c:when>
    <c:otherwise>
        <form method="POST" action="books?action=update"  enctype="multipart/form-data">
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

            <lable for="img" >Img</lable>
            <input type="file" id="img" name="img">
            <br> <br>

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
