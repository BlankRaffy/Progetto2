<!DOCTYPE html>
<%@page import="dao.RigaOrdineDAO"%>
<%@page import="dao.OrdinazioneDAO"%>
<%@page import="model.OrdinazioneBean"%>
<%@page import="dao.FatturaDAO"%>
<%@page import="dao.ProdottoDAO"%>

<%@page import="model.FatturaBean"%>
<%@page import="model.OrdinazioneBean"%>
<%@page import="model.RigaOrdineBean"%>


<%@page import="java.util.*"%>

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

	<div id="index" class=container>
		<%
			UserBean utente = (UserBean) session.getAttribute("utente");

			FatturaDAO a = new FatturaDAO();
			OrdinazioneDAO b = new OrdinazioneDAO();
			int j;
			int c = 0;

			ArrayList<FatturaBean> fattura = a.getFattura(utente.getEmail());
			int counter = 0;
			ArrayList<OrdinazioneBean> ordini = b.getOrdinazione(utente.getEmail());
		%>
		<div class="row" align="center">
			<h1>
				Storico Ordini Cliente:
				<%=utente.getNome()%>
				<%=utente.getCognome()%></h1>
		</div>
		<%
			for (int i = 0; i < ordini.size(); i++) {
		%>
		<div align="left" class="container">
			<div class="row">
				<h2>
					Ordine numero :<%=ordini.get(i).getIdOrdine()%></h2>
			</div>
			<%
				ArrayList<RigaOrdineBean> righe = new RigaOrdineDAO().getRigaOrdine(ordini.get(i).getIdOrdine());
					int lenghtb = righe.size();
					int n;

					//stampa di tutte le righe d'ordine 
					for (int k = 0; k < lenghtb; k++) {
						n = righe.get(k).getIdProdotto();
						ProdottoDAO prodotto = new ProdottoDAO();
						String nome = prodotto.GetProdotto(n).getNome();
			%>
			<div class="row">
				<div id="ordini" class="col-md-3">
					<div class="row">
						Nome :
						<%=nome%>
					</div>

					<div class="row">
						Quantità =
						<%=righe.get(k).getQuantita()%>
					</div>
					<div class="row">
						Prezzo :
						<%=righe.get(k).getPrezzo()%>
					</div>
					<br>
				</div>
			</div>
			<%
				}
			%>

			<div align="left">
				<div class="row">
					<h4 id="ordinei">
						Richiesto in data :
						<%=ordini.get(i).getDate()%>
					</h4>
				</div>
				<div class="row">
					<h4 id="ordinei">
						Totale speso in questo ordine :
						<%=fattura.get(i).getImporto()%>
					</h4>
				</div>
			</div>

		</div>
		<%
			}
		%>

	</div>



	<%@ include file="footer.jsp"%>
</body>
</html>