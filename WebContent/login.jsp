<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<%
			if (request.getAttribute("d") != null) {
				boolean islogged = (boolean) request.getAttribute("d");
				if (islogged == true) {
		%>
		<div class="alert alert-success">
			<strong>Utente Registrato! </strong> Utente Registrato con successo.
		</div>
		<%
			}
			}
		%>
		<%
			if (request.getAttribute("c") != null) {
				boolean islogged = (boolean) request.getAttribute("c");
				if (islogged == true) {
		%>
		<div class="alert alert-success">
			<strong>Volontario Registrato!</strong> Volontario Registrato con
			successo.
		</div>
		<%
			}
			}
		%>

		<%
			if (session.getAttribute("LogNeedCart") != null) {
		%>
		<div class="alert alert-danger">
			<strong>Registrati o Accedi per completare l'acquisto!</strong> Devi
			essere nostro cliente per completare l'acquisto.
		</div>
		<%
			}
		session.removeAttribute("LogNeedCart");
		%>
		<div class="row">
			<div class=col-sm-6 align=left>
				<h3>
					<strong>Nuovo Cliente? Crea un Account</strong>
				</h3>
				<h5>Creando il tuo account potrai:</h5>
				<ul>
					<li class="bullet">Comprare i nostri prodotti</li>
					<li class="bullet">Prenotare servizi dei nostri volontari</li>
					<li class="bullet">Parlare con i nostri specialisti</li>
					<li class="bullet">Usufruire delle nostre letture</li>
				</ul>
				<a href="register.jsp" class="btn btn-success" role="button">Registrati</a>
			</div>
			<div class=col-sm-6>
				<h3 align="left">
					<strong>Benvenuto</strong>
				</h3>
				<h5 align="left">Compila i campi per accedere al tuo account</h5>
				<form method="post" action="LoginServlet">

					<div class="form-group">
						<label for="email">Email </label> <input id="email" type="email"
							name="email" class="form-control" placeholder="Email">
					</div>
					<div class="form-group">
						<label for="pwd">Password </label> <input type="password"
							name="pass" class="form-control" placeholder="Password">
					</div>
					<%
						if (request.getAttribute("LoginCliente") != null) {
							boolean iscliente = (boolean) request.getAttribute("LoginCliente");
							if (iscliente == false) {
					%>
					<div class="alert alert-danger">
						<strong>Dati inseriti non corretti!</strong> Verificare le
						credenziali di accesso inserite.
					</div>
					<%
						}
						}
					%>
					<div class="row material-row">
					
					<button type="submit" class="btn btn-success">Accedi</button>
					<a href="#">Password dimenticata?</a></div>
				</form>

			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>