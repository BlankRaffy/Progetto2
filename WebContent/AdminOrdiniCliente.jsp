<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ordini</title>
</head>
<body>
<% String email = (String)  request.getParameter("id");%>
<div><%=email %> </div>
</body>

</html>