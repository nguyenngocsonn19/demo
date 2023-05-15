<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/15/2023
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    The user is  : username : ${param.username}

                   password : ${param.password}
    <br/> <br/>
    <%
        //read form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //create the cookie
        Cookie theCookie = new Cookie("myApp.username", username);
        Cookie theCookie2 = new Cookie("myApp.password", password);

        //set the life span .... total number   of seconds(yuk!)
        theCookie.setMaxAge(60*60*24*365);      // <-- for one year
        theCookie2.setMaxAge(60*60*24*365);
        //send cookie to browser
        response.addCookie(theCookie);
        response.addCookie(theCookie2);
    %>



</body>
</html>
