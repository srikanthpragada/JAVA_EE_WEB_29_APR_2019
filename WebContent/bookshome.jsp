<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<%@ include file="header.jsp"%>
<h2>List of Books</h2>

<sql:setDataSource url="jdbc:oracle:thin:@localhost:1521:XE"
	var="oracle" driver="oracle.jdbc.driver.OracleDriver" user="hr"
	password="hr" />

<sql:query var="books" dataSource="${oracle}">
		  select * from books order by title
</sql:query>

<table width="100%">
	<tr class="colhead">
		<th>Title</th>
		<th>Author</th>
		<th>Category</th>
		<th>No. Pages</th>
		<th>Actions</th>
	</tr>


	<c:forEach var="book" items="${books.rows}">
		<tr>
			<td>${book.title}</td>
			<td>${book.author}</td>
			<td>${book.category}</td>
			<td>${book.nopages}</td>
			<td><a href="booksedit.jsp?id=${book.id}">Edit</a> 
			<a onclick="return confirm('Do you really want to delete book?')"
			   href="booksdelete.jsp?id=${book.id}">Delete</a></td>
		</tr>
	</c:forEach>

</table>
</body>
</html>
</body>
</html>