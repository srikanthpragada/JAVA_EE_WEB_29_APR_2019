<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="oracle.jdbc.rowset.*,javax.sql.rowset.*"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employees By Department</title>
</head>
<body>
    <h2>Employees By Department</h2>
	<form action="deptemployees.jsp" method="post">
		Department Id : <input type="text" name="deptid"
		                       required="required"
		                       value="${param.deptid}" /> <input
			type="submit" value="Submit" />
	</form>
	
    <p></p>

    <%
       String deptid = request.getParameter("deptid");
       if(deptid == null || deptid.length() == 0) // no input, so do not display output 
          return;  // stop jsp 
    %>
	
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