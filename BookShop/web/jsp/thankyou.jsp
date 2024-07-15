
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>Untitled Document</title>
</head>
<%@include file="/jsp/header.jsp" %>
<body>
    <h2 align="center">Thank You For Shopping at Admit Bookstore</h2>
    <hr>
    <h3 align="center">Your credit card details are being validated </h3>
    <c:remove var="cart" scope="session" />
    <%@include file="/jsp/footer.jsp" %>
</body>
</html>
