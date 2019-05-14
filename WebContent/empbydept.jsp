<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="oracle.jdbc.rowset.*,javax.sql.rowset.*"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employees By Dept</title>
</head>
<body>
    <%
       String deptid = request.getParameter("deptid");
    %>
	<h1>List Of Employee of Department [<%=deptid %>]</h1>
	<%
		CachedRowSet crs = new OracleCachedRowSet();
		crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
		crs.setUsername("hr");
		crs.setPassword("hr");
		crs.setCommand("select * from employees where department_id = ?");
		crs.setString(1, deptid);
		crs.execute();
		while (crs.next()) {
			out.println(crs.getString("first_name") + "<br/>");
		}
		crs.close();
	%>
</body>
</html>