<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Header Page</title>
</head>
<body>
    <img src="../images/online book store.jpg" width="225" height="125" alt="online book store"/>
    
    <c:if test="${not empty books}">
        <c:forEach var="book" items="${books}">
            <div>${book}</div>
        </c:forEach>
    </c:if>
</body>
</html>
