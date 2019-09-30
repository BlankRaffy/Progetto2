<%@page import="dao.ProdottoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="dao.UtenteDAO"%>
<%@page import="model.DB"%>
<%@page import="java.util.*"%>
<%@page import="model.ProdottoBean"%>
<%@page import="model.FatturaBean"%>

<!DOCTYPE html>
<html>
<head>
<title>Acqusito</title>
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
	<%@ include file="navbar.jsp"%>
	<div class=container>
		<!--  get all the images  -->

		<%
		    ArrayList <FatturaBean> fattura = (ArrayList <FatturaBean>) session.getAttribute("fattura") ;
	
			if (fattura == null){
			
		%>

		<br>
		<h3 align="center">Catalogo Vuoto</h3>
		<% }  else {%>
		<br>
		<h3 align="center">Catalogo Prodotti</h3>
		<%
		int lenghtb = fattura.size();
		int c = 0;
		int j;
		double totale= 0;
			for (int i = 0; i < (int) Math.ceil(lenghtb / 4.00); i++) {
		%>
		<div class="row">
			<%
				j = 0;
					while (j <= 3 && c < lenghtb) {
						 totale = totale + fattura.get(c).getImporto();
			%>
			<div class="col-md-3">
				<!-- Tutte le immagini con relativi prezzi  -->

				<img src="<%= fattura.get(c).getProdotto().getImmagine() %>"
					class="img-responsive" alt="Image">

				<div class= "row" align="left" >
					<strong> Nome : <%=fattura.get(c).getProdotto().getNome()%>
					</strong>
				</div>
				<div align="left">
					<strong> Prezzo : <%=fattura.get(c).getProdotto().getPrezzo()%>
					</strong>
				</div>
				<div align="left">
					<strong> Quantità : <%= fattura.get(c).getImporto() / fattura.get(c).getProdotto().getPrezzo() %>
					</strong>
				</div>
				<div align="left">
					<strong> Importo Parziale : <%= fattura.get(c).getImporto()%>
					</strong>
				</div>




			</div>
			<%
				c++;
						j++;
					}
			%>
		</div>
		<%
			} %>
			</div>
			<div class="row" align="center">
			<h3 >
				<strong> Totale = <%=totale %>
				</strong>
			</h3>
			<button 		class="btn btn-success"><span
											class="glyphicon glyphicon-euro" ></span> Acquista   </button>
			</div>
			<% 
		}
		%>



	<%@ include file="footer.jsp"%>

</body>
</html>