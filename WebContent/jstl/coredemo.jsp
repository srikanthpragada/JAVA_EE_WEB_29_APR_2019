<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Core Tags Demo</title>
</head>
<body>

<h1>Testing</h1>

<c:out value="<h1>Testing</h1>" />
<p></p>

<c:forEach begin="1" end="10"  step="2" var="i">
  ${i}
  <br/>
</c:forEach>

</body>
</html>