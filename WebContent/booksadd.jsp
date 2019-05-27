<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<%@ include file="header.jsp"%>
<h2>Add Book</h2>

<form action="booksadd.jsp" method="post">
	Title <br /> <input type="text" name="title" size="50" />
	<p></p>
	Author <br /> <input type="text" name="author" size="50" />
	<p></p>
	Category <br /> <select name="category">
		<option value="n">Non Fiction</option>
		<option value="f">Fiction</option>
		<option value="t">Text Book</option>
	</select>
	<p></p>
	No. of Pages <br /> <input type="number" name="nopages" size="5" />
	<p></p>
	<input type="submit" value="Add Book" />
</form>

<%
	String title = request.getParameter("title");
	if (title == null)
		return;
%>


<sql:setDataSource url="jdbc:oracle:thin:@localhost:1521:XE"
	var="oracle" driver="oracle.jdbc.driver.OracleDriver" user="hr"
	password="hr" />

<sql:update dataSource="${oracle}" var="count">
    insert into books values(book_id_seq.nextval,?,?,?,?) 
    <sql:param value="${param.title}" />
	<sql:param value="${param.author}" />
	<sql:param value="${param.category}" />
	<sql:param value="${param.nopages}" />
</sql:update>

<c:if test="${count == 1}">
	<h4>Book has been added successfully!</h4>
</c:if>




</body>
</html>