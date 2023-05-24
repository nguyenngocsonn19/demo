<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/19/2023
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<%

        String[] cities = {"HaNOI" , "Singapo" , "Long don"};

        pageContext.setAttribute("mycities" , cities);
%>


<html>

<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="tempCity" items="${mycities}" >

    ${tempCity} <br/>

</c:forEach>

</body>
</html>
