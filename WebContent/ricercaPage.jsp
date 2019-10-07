<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="dao.UtenteDAO"%>
<%@page import="model.DB"%>
<%@page import="java.util.*"%>
<%@page import="model.ProdottoBean"%>
<%@page import="model.VolontarioBean"%>
<%@page import="dao.VolontarioDAO"%>
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

		<div class="row" align="left">
			<h2>
				Ricerca effettuata per:
				<%=session.getAttribute("String")%></h2>
		</div>
		<!--  get all the images Prodotti  -->
		<%
			ArrayList<ProdottoBean> b = (ArrayList<ProdottoBean>) session.getAttribute("Prodotti");

			int lenghtb = b.size();
			int c = 0;
		%>
		<br>
		<h2 align="center">Catalogo Prodotti</h2>

		<%
		if(lenghtb<=0){%>
		<div class="row" align="center"><h3>NESSUN PRODOTTO TROVATO</h3></div>

		<%} 
			for (int i = 0; i < (int) Math.ceil(lenghtb / 4.00); i++) {
		%>

		<div class="row">

			<%
				for (int j = 0; j <= 3 && c < lenghtb; j++) {
			%>
			<div class="col-md-3">
				<!-- Tutte le immagini con relativi prezzi  -->

				<img src=" <%=b.get(c).getImmagine()%>" class="img-responsive"
					alt="Image">
				<p align="left">
					<strong><%=b.get(c).getPrezzo()%> </strong>

				</p>
				<form action="CarrelloServlet">
					<input type="number" id="quantità" name="quantità"
						placeholder="quantità" onkeyup="number()" value="1"> <input
						type="hidden" name="id" value="<%=b.get(c).getCodice()%>">
					<button type="submit" class="btn btn-default btn-sm" id="action">
						<span class="glyphicon glyphicon-shopping-cart" id="quantSpan"></span>

					</button>
				</form>
			</div>

			<%
				c++;
					}
			%>
		</div>

		<%
			}
		%>
		<!--  get all the images Volontari  -->
		<%
			ArrayList<VolontarioBean> v = (ArrayList<VolontarioBean>) session.getAttribute("Volontari");

			int lenghtv = v.size();
		%>
		<br>
		<h2 align="center">Elenco Volontari</h2>

		<%
		if(lenghtv<=0){%>
		<div class="row" align="center"><h3>NESSUN VOLONTARIO TROVATO</h3></div>

		<%}
			for (int j = 0; j < lenghtv; j++) {
		%>
		<div class="row">

			<div class="col-md-4">

				<img src=" <%=v.get(j).getImmagine()%>" class="img-responsive"
					alt="Image">

			</div>

			<div id="volontariattr" class="col-md-4">
				<p align="left">
					<strong>Nome:</strong>
					<%=v.get(j).getNome()%>
					<br>
				<p align="left">
					<strong>Cognome:</strong>
					<%=v.get(j).getCognome()%>
				</p>

				<p align="left">
					<strong>Telefono:</strong>
					<%=v.get(j).getTelefono()%>
				</p>

				<p align="left">
					<strong>Disponibilità:</strong>
					<%=v.get(j).getOrario()%>
				</p>
			</div>
		</div>
		<br>
		<%
			}
		%>
	</div>
	<%@ include file="footer.jsp"%>