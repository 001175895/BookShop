<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<%@include file="/jsp/header.jsp" %>
<body bgcolor="#FFFFFF" text="#000000">

<h2 align="center"><font color="#003333">ADMIT ONLINE BOOKSTORE</font></h2>
<hr>
<h3><font face="Georgia, Times New Roman, Times, serif">Thank you for shopping with us.</font></h3>
<p>&nbsp;</p>

<c:if test="${not empty result}">
    <table width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr>
            <td bgcolor="#FFFFD7">${result}</td>
        </tr>
    </table>
</c:if>
<p>&nbsp;</p>

<c:remove var="result" scope="session" /> <!-- Clears the 'result' attribute from session -->
<%@include file="/jsp/footer.jsp" %>
</body>
</html>
