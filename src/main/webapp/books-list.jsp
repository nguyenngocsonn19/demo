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
    .image {
        width : 10% ;
        height : 10%;
    }
</style>
<h1>Books List</h1>
<a class="button add-button" href="books?action=new">Add New Book</a>

<table>
    <tr>
        <th>ID</th>
        <th>bookTitle</th>
        <th>bookPrice</th>
        <th>author</th>
        <th>quantity</th>
        <th>img</th>
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
                <a class="button" href="books?action=delete&bookId=${books.bookId}" onclick="return confirm('Are you sure delete this book?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<form action="books?action=searchByName" method="post">
    <input type="text" name="bookName" placeholder="Enter book name">
    <button type="submit">Search</button>
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
    </tr>

    <% for(Books book : searchResult) { %>
    <tr>
        <td><%= book.getBookTitle() %></td>
        <td><%= book.getAuthor() %></td>
        <td><%= book.getBookPrice() %></td>
        <td><%= book.getQuantity() %></td>
    </tr>
    <% } %>
</table>
<% } else { %>
<p>No search results found.</p>
<% } %>


</body>
</html>
