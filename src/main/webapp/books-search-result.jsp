<%@ page import="BookStore.Books" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Book Search Results</title>
</head>
<body>
<h1>Book Search Results</h1>

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