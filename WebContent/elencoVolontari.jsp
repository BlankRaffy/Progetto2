<%@page import="dao.VolontarioDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="dao.UtenteDAO"%>
<%@page import="model.DB"%>
<%@page import="java.util.*"%>
<%@page import="model.VolontarioBean"%>
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
	<%@ include file="navbar.jsp"%>
	<div class=container>
		<!--  get all the images  -->
		<%
			VolontarioDAO a = new VolontarioDAO();
			ArrayList<VolontarioBean> b = a.GetVolontari();
			int lenghtb = b.size();
		%>

		<h2 align="center">Elenco Volontari</h2>
		<br>
		<%
			for (int i = 0; i < lenghtb; i++) {
		%>
		<div class="row">

			<div class="col-md-4">

				<img src=" <%=b.get(i).getImmagine()%>" class="img-responsive"
					alt="Image">

			</div>

			<div id="volontariattr" class="col-md-4">
				<p align="left">
					<strong>Nome:</strong>
					<%=b.get(i).getNome()%>
					<br>
				<p align="left">
					<strong>Cognome:</strong>
					<%=b.get(i).getCognome()%>
				</p>

				<p align="left">
					<strong>Telefono:</strong>
					<%=b.get(i).getTelefono()%>
				</p>

				<p align="left">
					<strong>Disponibilità:</strong>
					<%=b.get(i).getOrario()%>
				</p>
			</div>
		</div>
		<br>
		<%
			}
		
		%>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>