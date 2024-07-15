<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
</head>
<%@include file="/jsp/header.jsp" %>
<body bgcolor="white">
    <c:if test="${not empty result}">
        <h3>${result}</h3>
    </c:if>
    <%-- Invalidate session if needed --%>
    <%
        session.invalidate();
    %>
    <%@include file="/jsp/footer.jsp" %>
</body>
</html>
