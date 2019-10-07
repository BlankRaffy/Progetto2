<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Special Children Farma & Volunteers</title>
<meta charset="utf-8">
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
		<form method="post" action="SendReclamoServlet">
			<div class=row>
				<div class="form-group col-md-6">
					<label for="nome">Nome:</label> <input type="text"
						class="form-control" id="nome" name="nome">
				</div>
				<div class="form-group col-md-6">
					<label for="cognome">Cognome:</label> <input type="text"
						class="form-control" id="cognome " name="cognome">
				</div>
			</div>
			<div class=row>
				<div class="form-group col-md-6">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email">
				</div>
				<div class="form-group col-md-6">
					<label for="tel">Telefono:</label> <input type="tel"
						class="form-control" id="telefono" name="telefono">
				</div>
			</div>
			<div style="padding-right: 15px" class=row>
				<label for="comment">Commenti:</label>
				<textarea class="form-control" rows="5" id="comment" name="commenti"
					placeholder="Inserisci qui..."></textarea>
			</div>
			<br>
			<div style="padding-right: 15px" class=row align="right">
				<button type="submit" class="btn btn-default">Invia</button>
			</div>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>