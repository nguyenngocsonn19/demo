<html>
<head>
    <title>Student Registration</title>
</head>
<body>
The student is confirmed : ${param.firstName} ${param.lastName}
    <br/> <br/>
Favorite Programming Language : <br/>

<ul>
         <%
             String[] langs = request.getParameterValues("favoriteLanguage");
             for (String tempLang : langs){
                 out.println("<li>" + tempLang +"</li>");
             }

         %>
</ul>

</body>

</html>