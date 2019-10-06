<!DOCTYPE html>
<%@page import="dao.OrdinazioneDAO"%>
<%@page import="model.OrdinazioneBean"%>
<%@page import="dao.FatturaDAO"%>
<%@page import="model.FatturaBean"%>
<%@page import="model.OrdinazioneBean"%>

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
				<% UserBean utente = (UserBean) session.getAttribute("utente");
				
				FatturaDAO a = new FatturaDAO();
				OrdinazioneDAO b =  new OrdinazioneDAO();
				ArrayList <FatturaBean> fattura = a.getFattura(utente.getEmail());
				ArrayList <OrdinazioneBean> ordini = b.getOrdinazione(utente.getEmail());
					
					
				
				%>
				<%    for(int i = 0 ; i<ordini.size();i++) {%>
				
				
						<h3 align="center">Ordine numero : <%=ordini.get(i).getIdOrdine()  %></h3>
						<h4 align="center"> Richiesto in data : <%=ordini.get(i).getDate() %>    </h4>
				
				
				<% } %>
				
	</div>
	<%@ include file="footer.jsp"%>  

</body>
</html>