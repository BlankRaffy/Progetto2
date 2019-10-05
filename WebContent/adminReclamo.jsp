<%@page import="dao.ReclamoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="dao.UtenteDAO"%>
<%@page import="model.DB"%>
<%@page import="java.util.*"%>
<%@page import="model.ReclamoBean"%>
<!DOCTYPE html>
<html>
<head>
<title>Special Children Farma & Volunteers</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/mycss.css">
</head>
<body>
	<%@ include file="navbaradmin.jsp"%>
	<div class=container>
		<!--  get all the images  -->
		<%
			ReclamoDAO a = new ReclamoDAO();
			ArrayList<ReclamoBean> b = a.GetReclami();
			int lenghtb = b.size();
		%>
		<br>
		<h3 align="center">Elenco Reclami</h3>
		<%
			for (int i = 0; i < lenghtb; i++) {
		%>
		<div class="row">
			<div class="col-md-4">
				<div class="row">
					<p align="left">
						<strong>Nome:</strong>
						<%=b.get(i).getNome()%>
				</div>
				<div class="row">
					<p align="left">
						<strong>Cognome:</strong>
						<%=b.get(i).getCognome()%>
					</p>
				</div>
				<div class="row">
					<p align="left">
						<strong>Telefono:</strong>
						<%=b.get(i).getTelefono()%>
					</p>
				</div>
				<div class="row">
					<p align="left">
						<strong>Email:</strong>
						<%=b.get(i).getEmail()%>
					</p>
				</div>

			</div>
			<div class="col-md-6">
				<p align="left">
					<strong>Commento:</strong>
				</p>
				<div class="panel panel-default">
					<div class="panel-body"><%=b.get(i).getCommento()%></div>
				</div>
			</div>
		</div>
		<br>
		<%
		
			}
		%>
	</div>
</body>
</html>