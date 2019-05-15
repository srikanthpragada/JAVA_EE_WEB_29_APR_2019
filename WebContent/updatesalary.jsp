<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Salary</title>
</head>
<body>
	<h2>Update Salary</h2>
	<form action="updatesalary.jsp" method="post">
		Emplyee id <br/>
		<input type="number" name="id" value="${param.id}" />
		<p/> 
		New Salary<br/>
		<input type="number" name="salary" value="${param.salary}" />
		<p />
		<input type="submit" value="Update" />
	</form>
	<%
	  if (request.getParameter("id") == null)
		  return;
	%>

	<jsp:useBean class="beans.EmployeeBean" scope="page"
		id="empBean" />
	<jsp:setProperty property="*" name="empBean" />
	
	<%
        int resp = empBean.update();
	    if(resp == 1)
	    	out.println("Updated Successfully!");
	    else
	    	if(resp == 0)
	    		out.println("Employee Id Not Found!");
	    	else
	    		out.println("Sorry! Could not update due to error!");
	    		
	%>

</body>
</html>