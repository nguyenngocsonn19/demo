<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>

<c:set var="stuff" value="<%= new java.util.Date()%>" />
time on server is ${stuff}

<br><br>



<br>


<br/>
<a href="hello-servlet">Hello Servlet</a>
<a href="">Hello Servlet</a>
</body>
</html>