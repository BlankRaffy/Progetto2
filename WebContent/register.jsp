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
<script type="text/javascript">
	function valida() {

		var nome = document.getElementById("nome").value;
		var cognome = document.getElementById("cognome").value;
		var email = document.getElementById("email").value;
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var telefono = document.getElementById("telefono").value;
		var password = document.getElementById("password").value;
		var telformat = /^(\([0-9]{3}\)|[0-9]{3})[0-9]{3}[0-9]{4}$/;
		var check = 0;

		if (cognome.length < 1 || (cognome == "")) {
			document.getElementById("cognomeChange").className = "col-md-12 form-group has-error has-feedback";

			$("#cognomeSpan").text("COGNOME NON VALIDO");
			check++;

		} else {
			$("#cognomeSpan").text("");

		}
		if (nome.length < 1 || (nome == "")) {
			document.getElementById("nameChange").className = "col-md-12 form-group has-error has-feedback";
			$("#nameSpan").text("NOME NON VALIDO");
			check++;

		} else {
			$("#nameSpan").text("");

		}

		if (!email.match(mailformat)) {
			document.getElementById("EmailChange").className = "col-md-12 form-group has-error has-feedback";
			$("#emailSpan").text("MAIL NON VALIDA");

			check++;

		} else {
			$("#emailSpan").text("");

		}

		if (password.length < 6 || (password == "")
				|| (password == "undefined")) {
			document.getElementById("passwordChange").className = "col-md-12 form-group has-error has-feedback";
			$("#passwordSpan").text("PASSWORD NON VALIDA");

			check++;

		} else {
			$("#passwordSpan").text("");

		}

		if (!(telefono.match(telformat))) {
			document.getElementById("telChange").className = "col-md-12 form-group has-error has-feedback";
			$("#telSpan").text("NUMERO  NON VALIDO");

			check++;
		} else {
			$("#telSpan").text("");

		}
		if (check == 0)
			document.forms["registrazione"].submit();
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn2").click(function() {
			$("#OrarioChange").css("display", "block");
			$("#ImmagineChange").css("display", "block");
		});
		$("#btn1").click(function() {
			$("#OrarioChange").css("display", "none");
			$("#ImmagineChange").css("display", "none");
		});
	});
</script>
<link rel="stylesheet" href="css/resetmycss.css">
<link rel="stylesheet" href="css/mycss.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class=container>
		<!-- stringa errore  -->
		<div class="row">
			<div class="col-sm-3" align="left">
				<h3 align="left">
					<strong>Benvenuto</strong>
				</h3>
				<h5 align="left">Compila i campi per registrati</h5>
				<form method="Post" action="RegisterServlet" id="registrazione">
					<div class="form-row">
						<input type="radio" name="tipo" value="cliente"
							required="required" checked="checked" id="btn1"> cliente
					</div>
					<div class="form-row">
						<input type="radio" name="tipo" id="btn2" value="volontario">
						volontario
					</div>
					<div class="form-row">
						<div class="form-group col-md-12" id="nameChange">
							<label for="inputnome">Nome</label> <input type="text"
								class="form-control" name="nome" id="nome" placeholder="Nome"
								required> <span id="nameSpan"></span>
						</div>
						<div class="form-group col-md-12" id="cognomeChange">
							<label for="inputcognome">Cognome</label> <input type="text"
								class="form-control" name="cognome" id="cognome"
								placeholder="Cognome" required> <span id="cognomeSpan"></span>

						</div>

						<div class="form-group col-md-12" id="telChange">
							<label for="inputtel">Telefono</label> <input type="text"
								class="form-control" id="telefono" name="telefono"
								placeholder="Inserire solo numeri"> <span id="telSpan"></span>
						</div>
						<div class="form-group col-md-12" id="EmailChange">
							<label for="inputEmail4">Email</label> <input type="text"
								class="form-control" name="email" id="email" placeholder="Email"
								required> <span id="emailSpan"> </span>
						</div>

						<div class="form-group col-md-12" id="passwordChange">
							<label for="inputPassword4">Password</label> <input
								type="password" class="form-control" name="Password"
								id="password" placeholder="Deve essere almeno 6 caratteri"
								required> <span id="passwordSpan"></span>
						</div>
						<div style="display: none" class="form-group col-md-12"
							id="OrarioChange">
							<label for="inputOrario4">Orario</label> <input type="text"
								class="form-control" name="Orario" id="orario"
								placeholder="hh:mm - hh:mm" required> <span
								id="OrarioSpan"></span>
						</div>
						<div style="display: none" class="form-group col-md-12"
							id="ImmagineChange">
							<label for="inputImmagine4">Immagine</label>
							<div class="form-row">
								<input type="radio" name="immagine"
									value="media/placeholdermale.png" required="required"
									checked="checked">Male
							</div>
							<div class="form-row">
								<input type="radio" name="immagine"
									value="media/placeholderfemale.png">Female
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck">Ricordami</label>
						</div>
					</div>
					<button type="button" class="btn btn-primary" name="Registrazione"
						class="login loginmodal-submit" onclick="valida()">Sign
						in</button>
				</form>
				<div class="login-help">
					<a href="login.jsp">Hai già un account?</a> - <a href="#">Password
						dimenticata?</a>
				</div>
				<%
					if (request.getAttribute("d") != null) {
						boolean islogged = (boolean) request.getAttribute("d");
						if (islogged == false) {
				%>
				<div class="alert alert-danger">
					<strong>Utente Non Registrato!</strong>Dati non conformi.
				</div>
				<%
					}
					}

					if (request.getAttribute("c") != null) {
						boolean isregister = (boolean) request.getAttribute("c");
						if (isregister == false) {
				%>
				<div class="alert alert-danger">
					<strong>Volontario Non Registrato!</strong> Dati non conformi.
				</div>
				<%
					}
					}
				%>




			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>