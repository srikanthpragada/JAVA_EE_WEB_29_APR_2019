<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Discount</title>
</head>
<body>
	<h2>Discount Calculation</h2>
	<form action="discount.jsp" method="post">
		Amount :<input type="text" name="amount" value="${param.amount}" /> Rate :<input
			type="text" name="rate" value="${param.rate}" />
		<p />
		<input type="submit" value="Calculate" />
	</form>
	<%
	  if (request.getParameter("amount") == null)
		  return;
	%>

	<jsp:useBean class="shopping.DiscountBean" scope="page"
		id="discountBean" />
	<jsp:setProperty property="*" name="discountBean" />
	<p />
	Discount = ${discountBean.discount}


</body>
</html>