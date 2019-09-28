<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="dao.ProdottoDAO"%>
<%@page import="model.DB"%>
<%@page import="java.util.*"%>
<%@page import="model.ProdottoBean"%>
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
			
	%>
	<%@ include file="navbaradmin.jsp"%>
	<div class=container>
		<br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-6">
						<img alt="Prodotto">
					</div>
					<div class="col-md-6">

						<form action="AdminAddProdottiServlet">
							<div class="form-group">
								<label>Prezzo:</label> <input type="text" class="form-control"
									name="prezzo">
							</div>
							<div class="form-group">
								<label>Iva:</label> <input type="text" class="form-control"
									name="iva">
							</div>
							<div class="form-group">
								<label>Nome:</label> <input type="text" class="form-control"
									name="nome">
							</div>
							<div class="form-group">
								<label>Immagine:</label> <input type="text" class="form-control"
									name="immagine">
							</div>
							<div class="form-group">
								<label>Descrizione:</label> <input type="text"
									class="form-control" name="descrizione">
							</div>
							<div class="form-group">
								<label>PDisponibili:</label> <input type="number"
									class="form-control" name="Pdisponibili">
							</div>
							<button type="submit" class="btn btn-default">Aggiungi
								Prodotto</button>
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