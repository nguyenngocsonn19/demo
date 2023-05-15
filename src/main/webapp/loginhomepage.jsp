<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/15/2023
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  // the default ..... if there are no cookies
  String username = "login";

  //get the cookies from the browser request
  Cookie[] theCookies = request.getCookies();

  //find our favorite language cookies
  if (theCookies != null){
    for (Cookie tempCookie : theCookies){
      if ("myApp.login".equals(tempCookie.getName())){
        username = tempCookie.getValue();
        break;
      }
    }
  }
%>
</body>

</html>
