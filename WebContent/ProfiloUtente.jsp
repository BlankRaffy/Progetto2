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
			<div class="col-md-4">
				<div class="row">
					<h3><%=u.getNome()%></h3>
				</div>
				<div class="row">
					<h3><%=u.getCognome()%></h3>
				</div>
				<div class="row">
					<h3><%=u.getTelefono()%></h3>
				</div>
				<div class="row">
					<h3><%=u.getEmail()%></h3>
				</div>
				<div class="row">
					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#ModalPassword">
						<span class="glyphicon glyphicon-pencil"></span>Modifica Password
					</button>
				</div>
				<div class="modal fade" id="ModalPassword" role="dialog">
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

											<form id="myForm" action="UtenteCambioPasswordServlet">
												<div class="form-group">
													<label>Vecchia Password:</label> <input type="password"
														class="form-control" name="oldpass">
												</div>
												<div class="form-group">
													<label>Nuova Password:</label> <input type="password"
														class="form-control" name="newpass">
												</div>
												<div class="form-group">
													<label>Ripeti Nuova Password:</label> <input
														type="password" class="form-control" name="newpass2">
												</div>
												<button id="Button" class="btn btn-default">Cambia
													Password</button>
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
			<div class="col-md-4" style="text-align: right">
				<a href="StoricoOrdini.jsp"><button class="btn btn-success">
						<span class="glyphicon glyphicon-list-alt"></span> Storico Ordini
					</button></a>
			</div>
			<div class="col-md-4"></div>

		</div>

	</div>
	<%
		}
	%>
	<%@ include file="footer.jsp"%>

</body>
</html>