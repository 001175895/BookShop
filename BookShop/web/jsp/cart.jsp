<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<html>
<head>
    <title>Shopping Cart</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%@include file="/jsp/header.jsp" %>
<body bgcolor="#FFFFFF" text="#000000">
<h2 align="center"><b>Items in Your Shopping Cart</b></h2>
<form name="form1" method="post" action="./books">
    <input type="hidden" name="action" value="update_cart">
    <table width="100%" border="1" cellspacing="0" cellpadding="3" height="98">
        <tr>
            <th width="13%" bgcolor="#CCCCCC">ISBN</th>
            <th width="34%" bgcolor="#CCCCCC">Title</th>
            <th width="13%" bgcolor="#CCCCCC">Price/unit</th>
            <th width="9%" bgcolor="#CCCCCC">Quantity</th>
            <th width="20%" bgcolor="#CCCCCC">Subtotal</th>
            <th width="11%" bgcolor="#CCCCCC">Remove</th>
        </tr>
        <c:forEach var="entry" items="${sessionScope.cart}">
            <c:set var="isbn" value="${entry.key}" />
            <c:set var="item" value="${entry.value}" />
            <c:set var="book" value="${item.book}" />
            <c:set var="quantity" value="${item.quantity}" />
            <c:set var="subtotal" value="${item.dollarOrderCost}" />
            <c:set var="totalCostOfOrder" value="${totalCostOfOrder + item.orderCost}" />
            <tr bgcolor="#F0F0F0">
                <td height="5">${isbn}</td>
                <td height="5">${book.title}</td>
                <td height="5">${book.dollarPrice}</td>
                <td height="5">
                    <input type="text" name="${isbn}" size="2" value="${quantity}" maxlength="4">
                </td>
                <td height="5" align="right"> <fmt:formatNumber value="${subtotal}" type="currency"/></td>
                <td height="5">
                    <div align="center">
                        <input type="checkbox" name="remove" value="${isbn}">
                    </div>
                </td>
            </tr>
        </c:forEach>
        <tr bgcolor="#E4E4E4">
            <td height="2" colspan="6">
                <input type="submit" name="Submit" value="Update Cart">
            </td>
        </tr>
        <tr bgcolor="#E4E4E4">
            <td height="2" colspan="6">
                <div align="right"><b>ORDER TOTAL <fmt:formatNumber value="${totalCostOfOrder}" type="currency"/></b></div>
            </td>
        </tr>
    </table>
</form>
<p><a href="./books?action=continue">Continue Shopping</a></p>
<p><a href="./books?action=checkout">Check Out</a></p>

<%@include file="/jsp/footer.jsp" %>
</body>
</html>
