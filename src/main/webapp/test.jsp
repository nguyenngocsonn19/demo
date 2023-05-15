<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/15/2023
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="test.jsp">

    Add new item : <input type="text" name="theItem">
    <input type="submit" value="submit">
</form>

<%
    List<String> items = (List<String>) session.getAttribute("test");

    if (items == null){
        items = new ArrayList<String>();
        session.setAttribute("test", items);
    }
    String theItem = request.getParameter("theItem");
    if (theItem != null){
        items.add(theItem);
    }
%>

<hr>
<b>To list items: <br/> <br/></b>
<ol>
    <%
    for (String temp :items){
        out.println("<li>" +temp+ "</li>");
    }

    %>
</ol>
</body>
</html>
