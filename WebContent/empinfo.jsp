<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Information</title>
</head>
<body>

	<%
		String empid = null;
		Cookie cookies[] = request.getCookies();

		if (cookies != null) {
			for (Cookie c : request.getCookies()) {
				if (c.getName().equals("empid")) {
					empid = c.getValue();
					break;
				}
			}
		}

		if (empid == null)
			response.sendRedirect("takeempid.jsp");
		else
			out.println("Details of Employee : " + empid);
	%>

</body>
</html>