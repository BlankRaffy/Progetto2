<%@page import="dao.ProdottoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="dao.UtenteDAO"%>
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






<script type="text/javascript">
	function number(){
		var z = document.getElementById("quantità").value;
		if(!z.match(/^\d+/))
			document.getElementById("quantSpan").textContent = " quantità non valida";
		else 
			document.getElementById("quantSpan").textContent = "";
		    
	}

	function funzioneGay(codice)
	{
		var quant = document.getElementById(""+codice);
		alert(quant);
	}
	
	</script>
	
	

		

<link rel="stylesheet" href="css/resetmycss.css">
<link rel="stylesheet" href="css/mycss.css">

</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class=container>
		<!--  get all the images  -->

		<%
			ProdottoDAO a = new ProdottoDAO();
			ArrayList<ProdottoBean> b = a.GetAllProdtti();
			int lenghtb = b.size();
			int c = 0;
			int j;
		%>
		<br>
		<h3 align="center">Catalogo Prodotti</h3>
		<%
			for (int i = 0; i < (int) Math.ceil(lenghtb / 4.00); i++) {
		%>
		<div class="row">
			<%
				j = 0;
					while (j <= 3 && c < lenghtb) {
			%>
			<div class="col-md-3">
				<!-- Tutte le immagini con relativi prezzi  -->
				<img src=" <%=b.get(c).getImmagine()%>" class="img-responsive"
					alt="Image">
				<p align="left">
					<strong><%=b.get(c).getPrezzo()%> </strong>
				</p>
				
				<!-- Pezzo scritto da Gian -->
				
				<input type="number" id="<%= b.get(c).getCodice() %>" placeholder="quantità">
				<button onclick="funzioneGay(<%= b.get(c).getCodice() %>)"></button>
				 
				
				<!-- Pezzo scritto da Raf 
				<form action="CarrelloServlet">
 					<input type="number" id="quantità" name="quantità"
						placeholder="quantità" onkeyup="number()">
	                 
	                 <input type="hidden" name = "id" value ="<%= b.get(c).getCodice() %>" >
					<button  type ="submit" class="btn btn-default btn-sm"  id="action" >
						<span class="glyphicon glyphicon-shopping-cart" id="quantSpan"></span>
						  
						  </button>
					</form>
              -->
			</div>
			<%
				c++;
						j++;
					}
			%>
		</div>
		<%
			}
		%>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>