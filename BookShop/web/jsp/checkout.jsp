<%@ page import="model.CartItem" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // Retrieve the cart from session
    Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");

    // Initialize totalCostOfOrder as a double
    double totalCostOfOrder = 0.0;

    // Calculate total order cost
    if (cart != null) {
        for (Map.Entry<String, CartItem> entry : cart.entrySet()) {
            CartItem item = entry.getValue();
            totalCostOfOrder += item.getDollarOrderCost(); 
    // Assuming item.getDollarOrderCost() returns a double
        }
    }

    // Store totalCostOfOrder in session (optional)
    session.setAttribute("totalCostOfOrder", totalCostOfOrder);
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <%@include file="/jsp/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>Order</title>
</head>

<body>

<h1 class="bigFont" align="center"><font face="Georgia, Times New Roman, Times, serif">Shopping Cart Check Out</font></h1>

<form method="post" action="jsp/thankyou.jsp">
    <input type="hidden" name="action" value="validate_credit">
    <p style="font-weight: bold">&nbsp;</p>
    <table width="100%" border="0" cellspacing="1" cellpadding="1">
        <tr>
            <td bgcolor="#CCCCCC">
                <h3 align="left">You have selected to purchase the following Items</h3>
            </td>
        </tr>

        <!-- Iterate over cart items using JSTL -->
        <c:forEach var="entry" items="${sessionScope.cart}">
            <tr>
                <td bgcolor="#F0F0F0">${entry.value}</td>
            </tr>
        </c:forEach>
    </table>

    <p style="font-weight: bold">Please input the following information.</p>

    <!-- table of form elements -->
    <table>
        <!-- Personal Information -->
        <tr>
            <td class="right bold">First name:</td>
            <td>
                <input type="text" name="firstname" size="25"/>
            </td>
        </tr>
        <tr>
            <td class="right bold">Last name:</td>
            <td>
                <input type="text" name="lastname" size="25"/>
            </td>
        </tr>
        <tr>
            <td class="right bold">Street:</td>
            <td>
                <input type="text" name="street" size="25"/>
            </td>
        </tr>
        <tr>
            <td class="right bold">City:</td>
            <td>
                <input type="text" name="city" size="25"/>
            </td>
        </tr>
        <tr>
            <td class="right bold">State:</td>
            <td>
                <input type="text" name="state" size="2"/>
            </td>
        </tr>
        <tr>
            <td class="right bold">Zip code:</td>
            <td>
                <input type="text" name="zipcode" size="10"/>
            </td>
        </tr>
        <tr>
            <td class="right bold">Phone #:</td>
            <td>
                (<input type="text" name="phone" size="3"/>)
                <input type="text" name="phone2" size="3"/> -
                <input type="text" name="phone3" size="4"/>
            </td>
        </tr>

        <!-- Credit Card Information -->
        <tr>
            <td class="right bold">Credit Card #:</td>
            <td>
                <input type="text" name="card_num" size="25"/>
            </td>
        </tr>
        <tr>
            <td class="right bold">Expiration (mm/yy):</td>
            <td>
                <input type="text" name="expires" size="2"/> /
                <input type="text" name="expires2" size="2"/>
            </td>
        </tr>

        <!-- Order Summary -->
        <tr>
            <td class="right bold">Order Amount $</td>
            <td>
                <!-- Use fmt tag to format totalCostOfOrder -->
                <input type="text" name="amount" value="<fmt:formatNumber value='${totalCostOfOrder}' type='currency'/>"/>
            </td>
        </tr>
    </table>

    <!-- Submit Button -->
    <p><input type="submit" value="Submit"/></p>
</form>

<%@include file="/jsp/footer.jsp" %>
</body>
</html>
