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

		<%
			if (request.getAttribute("ModificaProdotto") != null) {
					boolean ischanged = (boolean) request.getAttribute("ModificaProdotto");
					if (ischanged == true) {
		%>
		<div class="alert alert-success">
			<strong>Modificato!</strong> Il Prodotto è stato modificato con
			successo.
		</div>
		<%
			} else {
		%>
		<div class="alert alert-danger">
			<strong>Prodotto non modificato!</strong> Il prodotto non è stato
			modificato con successo.
		</div>
		<%
			}
				}

				ProdottoDAO a = new ProdottoDAO();
				ArrayList<ProdottoBean> b = a.GetAllProdtti();
				int lenghtb = b.size();
		%>
		<br>
		<h2 align="center">Catalogo Prodotti</h2>
		<!--  get all the images  -->
		<%
			for (int i = 0; i < lenghtb; i++) {
		%>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-6">
						<!-- Tutte le immagini con relativi prezzi  -->
						<img src=" <%=b.get(i).getImmagine()%>" class="img-responsive"
							alt="Image" width=100% height=100%>
					</div>
					<div align="left" id="prezziadmincatalogo" class="col-md-6">
						<div class="row">
							<strong>Nome:</strong>
							<%=b.get(i).getNome()%>
						</div>
						<div class="row">
							<strong>Prezzo:</strong>
							<%=b.get(i).getPrezzo()%>
						</div>
						<div class="row">
							<strong>Quantità:</strong>
							<%=b.get(i).getPdisponibili()%>
							pz.
							<div class="row">
								<div class="btn-group">
									<a
										href="AdminModificaProdotti.jsp?id=<%=b.get(i).getCodice()%>"
										class="btn btn-warning"> <span
										class="glyphicon glyphicon-cog"></span> Modifica
									</a> <a
										href="AdminDeleteProdottiServlet?id=<%=b.get(i).getCodice()%>"
										class="btn btn-danger"><span
										class="glyphicon glyphicon-trash"></span> Cancella</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<br>
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