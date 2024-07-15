<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Footer Page</title>
</head>
<body>
    <footer>
        <div>
            <p>&copy; <fmt:formatDate value="${now}" pattern="yyyy"/> Online Bookstore. All rights reserved.</p>
        </div>
    </footer>

    <!-- JSTL scriptlet to set the current date -->
    <c:set var="now" value="<%= new java.util.Date() %>"/>
</body>
</html>
