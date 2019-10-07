<!DOCTYPE html>
<html lang="ita">
<head>
<title>Profilo Utente</title>
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
		var oldpass = document.getElementById("oldpass").value;
		var newpass = document.getElementById("newpass").value;
		var newpass2 = document.getElementById("newpass2").value;
		var check = 0;
		if (newpass.length < 6 || (newpass == "") || (newpass == "undefined")) {
			document.getElementById("newpasschange").className = " form-group has-error has-feedback";
			$("#newpassSpan").text("PASSWORD NON VALIDA");

			check++;

		} else {
			$("#newpassSpan").text("");

		}
		if (newpass2.match(newpass)) {
			document.getElementById("newpass2change").className = "form-group has-error has-feedback";
			$("#newpass2Span").text("LE PASSWORD NON CORRISPONDONO");

			check++;

		} else {
			$("#newpass2Span").text("");

		}
		if (check == 0) {
			document.forms["myForm"].submit();
		}
	}
</script>
<script>
	function modal() {
		$('#ModalPassword').modal('show');
	}
</script>
<script>
	$(document).ready(
			function oldpass() {
				if (
<%=request.getAttribute("Verificaoldpass")%>
	!= null) {
					$('#ModalPassword').modal('show');
					$("#oldpasschange").toggleClass(
							"form-group has-error has-feedback");
					$("#oldpassSpan").text("PASSWORD NON CORRETTA");
				}
			});
</script>
<link rel="stylesheet" href="css/mycss.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%
		if (u == null) {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else {

			if (request.getAttribute("Changepass") != null) {
				boolean ischanged = (boolean) request.getAttribute("Changepass");
				if (ischanged == true) {
	%>
	<div class="alert alert-success">
		<strong>Modificata!</strong> La password è stata modificata con
		successo.
	</div>
	<%
		} else {
	%>
	<div class="alert alert-danger">
		<strong>Password non modificata!</strong> La password non è stata
		modificata con successo.
	</div>
	<%
		}
			}
	%>
	<div id="index" class=container>
		<br>
		<div class="row">
			<div id="profilou"class="col-md-4">
				<div class="row">
					<h3>
						<strong>Nome: </strong>
					</h3>
				</div>
				<div class="row">
					<h4><%=u.getNome()%></h4>
				</div>
				<div class="row">
					<h3>
						<strong>Cognome: </strong>
					</h3>
				</div>
				<div class="row">
					<h4><%=u.getCognome()%></h4>
				</div>
				<div class="row">
					<h3>
						<strong>Telefono: </strong>
					</h3>
				</div>
				<div class="row">
					<h4><%=u.getTelefono()%></h4>
				</div>
				<div class="row">
					<h3>
						<strong>Email:</strong>
					</h3>
				</div>
				<div class="row">
					<h4><%=u.getEmail()%></h4>
				</div>
				<div class="row">
					<span><button type="button" class="btn btn-success"
							onclick="modal()" data-target="#ModalPassword">
							<span class="glyphicon glyphicon-pencil"></span>Modifica Password
						</button> </span><span><a href="StoricoOrdini.jsp"><button
								class="btn btn-success">
								<span class="glyphicon glyphicon-list-alt"></span> Storico
								Ordini
							</button></a></span>
				</div>
				<div class="modal fade" id="ModalPassword" role="dialog"
					style="show: false">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Modifica Password</h4>
							</div>
							<div class="modal-body">
								<div>
									<div class="row">

										<div class="col-md-12">

											<form method="post" id="myForm"
												action="UtenteCambioPasswordServlet">
												<div class="form-group" id="oldpasschange">
													<label>Vecchia Password:</label> <input type="password"
														class="form-control" id="oldpass" name="oldpass"><span
														id="oldpassSpan"></span>
												</div>
												<div class="form-group" id="newpasschange">
													<label>Nuova Password:</label> <input type="password"
														class="form-control" id="newpass" name="newpass"><span
														id="newpassSpan"></span>
												</div>
												<div class="form-group" id="newpass2change">
													<label>Ripeti Nuova Password:</label> <input
														type="password" class="form-control" id="newpass2"
														name="newpass2"><span id="newpass2Span"></span>
												</div>
												<button id="Button" class="btn btn-default"
													onclick="valida()">Cambia Password</button>
											</form>
										</div>
									</div>

								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>

		</div>

	</div>
	<%
		}
	%>
	<%@ include file="footer.jsp"%>

</body>
</html>