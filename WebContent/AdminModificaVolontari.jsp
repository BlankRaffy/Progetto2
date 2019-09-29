<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="dao.VolontarioDAO"%>
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
<link rel="stylesheet" href="css/resetmycss.css">
<link rel="stylesheet" href="css/mycss.css">
</head>
<body>
	<%
		if (session.getAttribute("admin") != null) {
			String email = request.getParameter("email");
			VolontarioDAO a = new VolontarioDAO();
			VolontarioBean volontario = a.GetVolontario(email);
	%>
	<%@ include file="navbaradmin.jsp"%>
	<div class=container>
		<br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-6">
						<img alt="Prodotto" src="<%=volontario.getImmagine()%>">
					</div>
					<div class="col-md-6">

						<form action="AdminModificaVolontarioServlet">
							<div class="form-group">
								<label>Nome:</label> <input type="text" class="form-control"
									value="<%=volontario.getNome()%>" name="nome">
							</div>
							<div class="form-group">
								<label>Cognome:</label> <input type="text" class="form-control"
									value="<%=volontario.getCognome()%>" name="cognome">
							</div>
							<div class="form-group">
								<label>Telefono:</label> <input type="text" class="form-control"
									value="<%=volontario.getTelefono()%>" name="telefono">
							</div>
							<div class="form-group">
								<label>Orario:</label> <input type="text" class="form-control"
									value="<%=volontario.getOrario()%>" name="orario">
							</div>
							<div class="form-group">
								<label>Immagine:</label> <input type="text" class="form-control"
									value="<%=volontario.getImmagine()%>" name="immagine">
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control"
									value="<%=volontario.getPassword()%>" name="password">
							</div>

							<div class="form-group">
								<input type="hidden" class="form-control"
									value="<%=volontario.getEmail()%>" name="email">
							</div>
							<button type="submit" class="btn btn-default">Modifica</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>

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