<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<%@ include file="header.jsp"%>
<h2>Edit Book</h2>

<%
	String id = request.getParameter("id");
	if (id == null)
		return;
%>


<sql:setDataSource url="jdbc:oracle:thin:@localhost:1521:XE"
	var="oracle" driver="oracle.jdbc.driver.OracleDriver" user="hr"
	password="hr" />

<sql:query dataSource="${oracle}" var="books">
    select * from books where id = ? 
    <sql:param value="${param.id}" />
</sql:query>


<c:set var="book" value="${books.rows[0]}" />

<form action="booksupdate.jsp" method="post">
    <input type="hidden" name="id" value="${param.id}" />
	Title <br /> <input type="text" name="title" size="50" value="${book.title}" />
	<p></p>
	Author <br /> <input type="text" name="author" size="50" value="${book.author}" />
	<p></p>
	Category <br /> <select name="category">
		<option value="n" 
		  <c:if test='${book.category == "n"}'>SELECTED </c:if>>
		  Non Fiction</option>
		<option value="f"
		  <c:if test='${book.category == "f"}'>SELECTED </c:if>>
		  Fiction</option>
		<option value="t"
		  <c:if test='${book.category == "t"}'>SELECTED </c:if>>
		  Text Book</option>
	</select>
	<p></p>
	No. of Pages <br /> <input type="number" name="nopages" value="${book.nopages}" size="5" />
	<p></p>
	<input type="submit" value="Save Book" />
</form>


</body>
</html>