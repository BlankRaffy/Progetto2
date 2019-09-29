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
<link rel="stylesheet" href="css/resetmycss.css">
<link rel="stylesheet" href="css/mycss.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class=container></div>
	<%    
	ArrayList <ProdottoBean> b = (ArrayList <ProdottoBean>) session.getAttribute("carrello");
	if (b==null){
		session.setAttribute("carrello", new ArrayList<ProdottoBean>());
		b = (ArrayList <ProdottoBean>) session.getAttribute("carrello");
		 
	}
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
				<input type="number" id="quantità" name="quantità"
						placeholder="quantità" value = "<%= b.get(c).getPdisponibili()  %>">
				 <a
									href="CarrelloDeleteServlet?id=<%=b.get(i).getCodice()%>"
									class="btn btn-danger"><span
									class="glyphicon glyphicon-trash"></span> Cancella</a>
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
	
	
	
	<%@ include file="footer.jsp"%>

</body>
</html>