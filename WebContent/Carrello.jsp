<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.ProdottoBean"%>
<%@page import="java.util.*"%>


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
	function controllo( ){
		 var name = '<%=session.getAttribute("utente")%>
	'
		if (name.match("null")) {
<%session.setAttribute("LogNeedCart", 1);%>
	window.location.href = "login.jsp"
		} else
			document.forms["Fattura"].submit();
	}
</script>
<link rel="stylesheet" href="css/resetmycss.css">
<link rel="stylesheet" href="css/mycss.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class=container>
		<%
			ArrayList<ProdottoBean> b = (ArrayList<ProdottoBean>) session.getAttribute("carrello");
			if (b == null) {
				session.setAttribute("carrello", new ArrayList<ProdottoBean>());
				b = (ArrayList<ProdottoBean>) session.getAttribute("carrello");

			}
			int lenghtb = b.size();
			System.out.println(lenghtb);
		%>
		<br>
		<h3 align="center">Carrello</h3>
		<%
			for (int i = 0; i < lenghtb; i++) {
		%>
		<div class="row">

			<div class="col-md-4">
				<!-- Tutte le immagini con relativi prezzi  -->
				<img src=" <%=b.get(i).getImmagine()%>" class="img-responsive"
					alt="Image">
				<p align="left">
					<strong><%=b.get(i).getPrezzo()%> </strong>
				</p>
				<div class="row">
					<input type="number" id="quantità" name="quantita"
						placeholder="quantità" value="<%=b.get(i).getPdisponibili()%>">

					<a href="CarrelloDeleteServlet?id=<%=b.get(i).getCodice()%>"
						class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>
						Cancella </a>
				</div>
			</div>
		</div>
		<%
			}
		%>


		<%
			if (lenghtb > 0) {
		%>
		<a href="Prodotti.jsp"><button class="btn btn-success">
				<span class="glyphicon glyphicon-list-alt"></span>Ritorna al
				catalogo
			</button></a>
		<form name="Fattura" id="Fattura" action="AcquistoServlet"
			onclick="controllo()" class="btn btn-success">
			<span class="glyphicon glyphicon-ok"></span> Procedi al pagamento
		</form>
		<%
			}
		%>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>