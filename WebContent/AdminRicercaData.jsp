<%@page import="dao.ProdottoDAO"%>
<%@page import="model.StoricoOrdiniBean"%>
<%@page import="java.util.ArrayList"%>
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
	<%
		if (session.getAttribute("admin") != null) {
	%>
	<%@ include file="navbaradmin.jsp"%>
	<div id="index" class=container>
		<h3 align="center">Ordini per l'intervallo di date selezionato</h3>
		<%
			ArrayList<StoricoOrdiniBean> storico = (ArrayList<StoricoOrdiniBean>) session.getAttribute("Storico");
				for (int i = 0; i < storico.size(); i++) {
					ProdottoDAO prodotto = new ProdottoDAO();
		%>

		<div class="container">
		<div class="col-md-5">
			<div class="row">
				<h4>
					<strong>Nome:</strong>
					<%=storico.get(i).getNome()%></h4>
			</div>
			<div class="row">
				<h4>
					<strong>Cognome:</strong>
					<%=storico.get(i).getCognome()%></h4>
			</div>
			<div class="row">
				<h4>
					<strong>Email:</strong>
					<%=storico.get(i).getEmail()%>
				</h4>
			</div>
			<div class="row">
				<h4>
					<strong> Prodotto: </strong><%=prodotto.GetProdotto(storico.get(i).getIdProdotto()).getNome()%></h4>
			</div>
			<div class="row">
				<h4>
					<strong>Prezzo :</strong>
					<%=storico.get(i).getPrezzo()%>
				</h4>
			</div>
			<div class="row">
				<h4>
					<strong>Quantità:</strong>
					<%=storico.get(i).getQuantita()%></h4>
			</div>
			<div class="row" style="margin-bottom:15px">
				<h4>
					<strong>Data:</strong>
					<%=storico.get(i).getData()%></h4>
			</div>
		</div>
		</div>
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