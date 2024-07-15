<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>JSP start</title>
    </head>
  
    <body>
        <%-- 
            Redirect to /books page using JavaScript.
            This page automatically redirects the user to the /books page.
        --%>
        <script>
            window.location.href = "./books";
        </script>
    </body>
</html>
