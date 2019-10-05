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
	<%
		if (session.getAttribute("admin") != null) {
	%>
	<%@ include file="navbaradmin.jsp"%>
	<div class=container>

		<%
			if (request.getAttribute("ModificaVolontario") != null) {
					boolean ischanged = (boolean) request.getAttribute("ModificaVolontario");
					if (ischanged == true) {
		%>
		<div class="alert alert-success">
			<strong>Modificato!</strong> Il Volontario è stato modificato con
			successo.
		</div>
		<%
			} else {
		%>
		<div class="alert alert-danger">
			<strong>Volontario non modificato!</strong> Il Volontario non è stato
			modificato con successo.
		</div>
		<%
			}
				}

				if (request.getAttribute("CancellaVolontario") != null) {
					boolean isdeleted = (boolean) request.getAttribute("CancellaVolontario");
					if (isdeleted == true) {
		%>
		<div class="alert alert-success">
			<strong>Cancellato!</strong> Il Volontario è stato cancellato con
			successo.
		</div>
		<%
			} else {
		%>
		<div class="alert alert-danger">
			<strong>Volontario non cancellato!</strong> Il Volontario non è stato
			cancellato con successo.
		</div>
		<%
			}
				}

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
				<!--  get all the images  -->
				<img src=" <%=b.get(i).getImmagine()%>" class="img-responsive"
					alt="Image">

			</div>

			<div id="volontariattr" class="col-md-4">
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
						<strong>Disponibilità:</strong>
						<%=b.get(i).getOrario()%>
					</p>
				</div>
				<div class="row">
					<div class="btn-group">
						<a
							href="AdminModificaVolontari.jsp?email=<%=b.get(i).getEmail()%>"
							class="btn btn-warning"> <span
							class="glyphicon glyphicon-cog"></span> Modifica
						</a> <a href="AdminDeleteVolontariServlet?email=<%=b.get(i).getEmail()%>"
							class="btn btn-danger"><span
							class="glyphicon glyphicon-trash"></span> Cancella</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<%
			}
		%>
	</div>
	<%
		} else {
	%>
	<script>
		alert("ERRORE! STAI TENTANDO DI COMMETTERE UN ILLECITO")
	</script>

	<%
		}
	%>
</body>
</html>