<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Date and Time</title>
</head>
<body>
<h1>
  <%
  
      out.println( java.time.LocalDateTime.now().toString());
  %>
</h1>


</body>
</html>