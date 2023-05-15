<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/12/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h3>Training Portal</h3>
<!-- read the favorite programming language cookie -->
<%
    // the default ..... if there are no cookies
    String favLang = "JAVA";

    //get the cookies from the browser request
  Cookie[] theCookies = request.getCookies();

    //find our favorite language cookies
    if (theCookies != null){
      for (Cookie tempCookie : theCookies){
        if ("myApp.favoriteLanguage".equals(tempCookie.getName())){
          favLang = tempCookie.getValue();
          break;
        }
      }
    }
%>
  <!--- now show a personalize page ... use the "favLang" variable -->

<h4>New books for <%= favLang%></h4>
<ul>
  <li>blallasldlsadalsdnals</li>
  <li>blasllblalslfsal</li>
</ul>
<h4>Latest News Reports for <%= favLang%></h4>
<ul>
  <li>dasdkabdkskasdbkas</li>
  <li>daslndlaskndjasndjaks d</li>
</ul>

<h4>Latest News Reports for <%= favLang%></h4>
<ul>
  <li>dasdkabdkskasdbkas</li>
  <li>daslndlaskndjasndjaks d</li>
</ul>

<a href="cookies-personalize-form.html">Personalize Page</a>
</body>
</html>
