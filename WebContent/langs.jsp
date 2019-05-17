<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.util.TreeSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Languages</title>
</head>
<body>

<h2>Languages</h2>
<form action="langs.jsp">
Language : <input type="text" name="lang" />
<input type="submit" value="Add" />
</form>
<p></p>
<%
   String lang = request.getParameter("lang");
   if(lang == null || lang.length() == 0)
	   return;
   
   // Take langs from session
   TreeSet<String> langs = (TreeSet<String>) application.getAttribute("langs");
   if (langs == null) {
	   langs = new TreeSet<String>();
	   application.setAttribute("langs",langs);
   }
   
   langs.add(lang);
   
   for(String s : langs)
	   out.println(s + "<br/>");
%>



</body>
</html>