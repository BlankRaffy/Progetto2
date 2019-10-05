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
	function number() {
		var z = document.getElementById("quantità").value;
		if (!z.match(/^\d+/))
			document.getElementById("quantSpan").textContent = " quantità non valida";
		else
			document.getElementById("quantSpan").textContent = "";

	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".animButton").hover(function() {
			$(this).css("opacity", "0.7");
		}, function() {
			$(this).css("opacity", "1");
		});
	});
	
	$(document).ready(function() {
		$(".carrelloButton").click(function() {
			var quantita = $(this).parent().parent().parent().find('input[name="quantita"]').val();
			var id = $(this).parent().parent().parent().find('input[name="id"]').val();
			
			var json =
				{
					"quantita":quantita,
	            	"id":id
				}
		
			
			 $.ajax({
		            type: "GET",
		            url: "CarrelloServlet",
		            contentType: "application/json",
		            data:{
		            	"json":JSON.stringify(json)
		            },
		            success: function(status){
		                console.log("Entered",status);
		            },
		            error: function(error){
		                console.log("error",error);
		            },
		            

		     });
			
		});
	});
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
				<img src=" <%=b.get(c).getImmagine()%>"
					class="img-responsive animButton" id="<%=b.get(c).getCodice()%>"
					alt="Image">

				<p align="left">
					<strong><%=b.get(c).getPrezzo()%> </strong>
				</p>


				<form id="myForm" class="prodottiForm" action="javascript:void(0);">
					<div class="row">
						<div class="col-xs-9">
							<input type="number" id="quantita" name="quantita"
								placeholder="quantità" onkeyup="number()" value="1"> 
								<input type="hidden" name="id" value="<%=b.get(c).getCodice()%>">
						</div>
						<div class="col-xs-3">
							<button type="submit" class="btn btn-default btn-sm carrelloButton">
								<span class="glyphicon glyphicon-shopping-cart" id="quantSpan"></span>
							</button>
						</div>
					</div>
				</form>
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