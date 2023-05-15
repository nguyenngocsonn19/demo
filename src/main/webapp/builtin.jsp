<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/10/2023
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3> JSP Built- IN Object</h3>
Request user a gent : <%= request.getHeader("User-Agent")%>

<br> <br>
Request language : <%= request.getLocale()%>
</body>
</html>
