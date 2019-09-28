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
		var username = document.getElementById("username").value;
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var telefono = document.getElementById("telefono").value;
		var password = document.getElementById("password").value;
		var telformat = /^(\([0-9]{3}\)|[0-9]{3})[0-9]{3}[0-9]{4}$/;
		var check = 0;

		if (username.length < 1 || (username == "")) {
			document.getElementById("usernameChange").className = " col-md-12 form-group has-error has-feedback";
			document.getElementById("usernameSpan").textContent = " USERNAME NON VALIDO ";

		} else {
			document.getElementById("usernameSpan").textContent = " ";

		}

		if (cognome.length < 1 || (cognome == "")) {
			document.getElementById("cognomeChange").className = "col-md-12 form-group has-error has-feedback";
			document.getElementById("cognomeSpan").textContent = " COGNOME NON VALIDO ";
			check++;

		} else {
			document.getElementById("cognomeSpan").textContent = " ";

		}
		if (nome.length < 1 || (nome == "")) {
			document.getElementById("nameChange").className = "col-md-12 form-group has-error has-feedback";
			document.getElementById("nameSpan").textContent = " NOME NON VALIDA ";
			check++;

		} else {
			document.getElementById("nameSpan").textContent = " ";

		}

		if (!email.match(mailformat)) {
			document.getElementById("EmailChange").className = "col-md-12 form-group has-error has-feedback";
			document.getElementById("emailSpan").textContent = " EMAIL NON VALIDA ";
			check++;

		} else {
			document.getElementById("emailSpan").textContent = " ";

		}

		if (password.length < 6 || (password == "")
				|| (password == "undefined")) {
			document.getElementById("passwordChange").className = "col-md-12 form-group has-error has-feedback";
			document.getElementById("passwordSpan").textContent = " PASSWORD NON VALIDA ";

			check++;

		} else {
			document.getElementById("passwordSpan").textContent = " ";

		}

		if (!(telefono.match(telformat))) {
			document.getElementById("telChange").className = "col-md-12 form-group has-error has-feedback";
			document.getElementById("telSpan").textContent = " NUMERO  NON VALIDO ";

			check++;
		} else {
			document.getElementById("telSpan").textContent = " ";

		}
		if (check == 0)
			document.forms["registrazione"].submit();
	}
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
				<form method="get" action="RegisterServlet" id="registrazione">
					<div class="form-row">
						<input type="radio" name="modalità" value="cliente"
							required="required" checked="checked" onclick=""> cliente
					</div>
					<div class="form-row">
						<input type="radio" name="modalità" value="volontario">
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


						<div class="form-group col-md-12" id="usernameChange">
							<label for="inputuser">Username</label> <input type="text"
								class="form-control" name="username" id="username"
								placeholder="User" required> <span id="usernameSpan"></span>

						</div>
						<div class="form-group col-md-12" id="telChange">
							<label for="inputtel">Telefono</label> <input type="text"
								class="form-control" id="telefono" name="telefono"
								placeholder="Telefono"> <span id="telSpan"></span>



						</div> 
						<div class="form-group col-md-12" id="EmailChange">
							<label for="inputEmail4">Email</label> <input type="text"
								class="form-control" name="email" id="email" placeholder="Email"
								required> <span id="emailSpan"> </span>
						</div>




						<div class="form-group col-md-12" id="passwordChange">
							<label for="inputPassword4">Password</label> <input
								type="password" class="form-control" name="Password"
								id="password" placeholder="Password" required> <span
								id="passwordSpan"></span>
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

			</div>
		</div>
		<div class="login-help">
			<a href="login.jsp">Hai già un account?</a> - <a href="#">Password
				dimenticata?</a>
		</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>