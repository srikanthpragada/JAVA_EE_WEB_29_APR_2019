<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Save Employee Id</h2>
	<form action="takeempid.jsp">
		Employee Id : <input type="text" name="empid" /> <input type="submit"
			value="Save" />
	</form>
	
	<%
       String empid = request.getParameter("empid");
	   if (empid != null)
	   {
		   Cookie c = new Cookie("empid", empid);
		   c.setMaxAge(7 * 24 * 60 * 60);
		   response.addCookie(c);
		   response.sendRedirect("empinfo.jsp");
	   }
	%>

</body>
</html>