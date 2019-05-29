<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<%@ include file="header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function getBooks() {
		$.getJSON("http://localhost:8888/webdemo/searchbooks?title="
				+ $("#title").val(), null, showBooks);
	}

	function showBooks(response) {
		if (response.message) {
			$("#books").text(response.message)
			return;
		}

		books = response
		if (books.length == 0) {
			$("#books").html("Sorry! No book found!");
			return;
		}
		
		list = "<ul>";
		for (i = 0; i < books.length; i++) {
			list += "<li>" + books[i].title + " - " + books[i].author + "</li>";
		}
		list += "</ul>";

		$("#books").html(list)
	}
</script>
<h2>Search Book</h2>

Title :
<input type="text" id="title" />
<button onclick="getBooks()">Search</button>
<p></p>

<div id='books'></div>



</body>
</html>