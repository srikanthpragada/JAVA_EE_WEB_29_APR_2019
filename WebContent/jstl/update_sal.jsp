<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Salary</title>
</head>
<body>
	<h1>Update Salary</h1>
	<form action="update_sal.jsp">
		Employee id <br /> <input type="text" name="empid" value="${param.empid}" />
		<p />
		New salary<br /> <input type="text" name="salary" value="${param.salary}"  />
		<p />
		<input type="submit" value="Update Salary" />
	</form>


	<c:if test="${!empty param.empid}">
		<sql:setDataSource url="jdbc:oracle:thin:@localhost:1521:XE"
			var="oracle" driver="oracle.jdbc.driver.OracleDriver" user="hr"
			password="hr" />

		<sql:update dataSource="${oracle}" var="count">
           update employees set salary = ? where employee_id = ?
           <sql:param value="${param.salary}" />
			<sql:param value="${param.empid}" />
		</sql:update>

		<c:if test="${count == 1}">
			<h2>Updated Successfully!</h2>
		</c:if>

		<c:if test="${count == 0}">
			<h2>Sorry! Employee Id Not Found!</h2>
		</c:if>

	</c:if>


</body>
</html>