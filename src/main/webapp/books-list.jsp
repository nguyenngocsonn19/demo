<%@ page import="BookStore.Books" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/26/2023
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books List</title>

</head>

<body>
<style>
    body{
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    h1{
        color: red;
        text-align: center;
    }
    table{
        width: 100%;
        border-collapse: collapse;
    }

    th,td{
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ccc;

    }

    tr:nth-child(even){
        background-color: #f2f2f2;

    }
    tr:hover{
        background-color: #e0e0e0;
    }

    .button{
        display: inline-block;
        background-color: #4CAF50;
        color: white;
        padding: 8px 16px;
        text-decoration: none;
        border-radius: 4px;
        transition: background-color 0.3s;
    }
    .button-delete{
        display: inline-block;
        background-color: red;
        color: white;
        padding: 8px 16px;
        text-decoration: none;
        border-radius: 4px;
        transition: background-color 0.3s;
    }
    .button:hover{
        background-color: #45a049;
    }
    .add-button{
        margin-bottom: 10px;
    }

    .image{
        width: 200px;
        height: 200px;
        object-fit: cover;
        border: 1px solid #ccc;
        border-radius: 5px;
        overflow: hidden;

    }
    form{
        margin-left: 1150px;
    }
    p{
        margin-left: 1150px;
    }
    .input1{
        color: #cccccc;
        height: 35px;
        border-radius: 4px;
    }

</style>
<h1>Books List</h1>
<form action="books?action=searchByName" method="post">
    <input type="text" name="bookName" placeholder="Enter book name" class="input1">
    <button class="button" type="submit">Search</button>
</form>

<%
    List<Books> searchResult = (List<Books>) request.getAttribute("searchResult");

    if (searchResult != null && searchResult.size() > 0) {
%>
<table>
    <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Image</th>
    </tr>

    <% for(Books book : searchResult) { %>
    <tr>
        <td><%= book.getBookTitle() %></td>
        <td><%= book.getAuthor() %></td>
        <td><%= book.getBookPrice() %></td>
        <td><%= book.getQuantity() %></td>
        <td><img src="<%= book.getImg()%> " class="image"></td>
    </tr>
    <% } %>
</table>
<% } else { %>
<p>No search results found.</p>
<% } %>

<a class="button add-button" href="books?action=new">Add New Book</a>

<table>
    <tr>
        <th>ID</th>
        <th>BookTitle</th>
        <th>BookPrice</th>
        <th>Author</th>
        <th>Quantity</th>
        <th>Image</th>
    </tr>
    <c:forEach var="books" items="${booksList}">
        <tr>
            <td>${books.bookId}</td>
            <td>${books.bookTitle}</td>
            <td>${books.bookPrice}</td>
            <td>${books.author}</td>
            <td>${books.quantity}</td>
            <td><img src="${books.img}" alt="img" class="image"></td>
            <td>

                <a class="button" href="books?action=edit&bookId=${books.bookId}">Edit</a>
                <a class="button-delete"  href="books?action=delete&bookId=${books.bookId}" onclick="return confirm('Are you sure delete this book?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>



</body>
</html>
