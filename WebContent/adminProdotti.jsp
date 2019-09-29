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

				if (request.getAttribute("CancellaProdotto") != null) {
					boolean isdeleted = (boolean) request.getAttribute("CancellaProdotto");
					if (isdeleted == true) {
		%>
		<div class="alert alert-success">
			<strong>Cancellato!</strong> Il Prodotto è stato cancellato con
			successo.
		</div>
		<%
			} else {
		%>
		<div class="alert alert-danger">
			<strong>Prodotto non cancellato!</strong> Il prodotto non è stato
			cancellato con successo.
		</div>
		<%
			}
				}
				if (request.getAttribute("AddProdotto") != null) {
					boolean isAdded = (boolean) request.getAttribute("AddProdotto");
					if (isAdded == true) {
		%>
		<div class="alert alert-success">
			<strong>Aggiunto!</strong> Il Prodotto è stato aggiunto con successo.
		</div>
		<%
			} else {
		%>
		<div class="alert alert-danger">
			<strong>Prodotto non aggiunto!</strong> Il prodotto non è stato
			aggiunto con successo.
		</div>
		<%
			}
				}

				ProdottoDAO a = new ProdottoDAO();
				ArrayList<ProdottoBean> b = a.GetAllProdtti();
				int lenghtb = b.size();
		%>
		<br>
		<div class="row">
			<h2 align="center">
				Catalogo Prodotti <span style="float: right"> <!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#myModal">
						<span class="glyphicon glyphicon-plus"></span> Aggiungi Nuovo
						Prodotto
					</button>
				</span>
			</h2>
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modal Header</h4>
						</div>
						<div class="modal-body">
							<p>This is a large modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

		</div>

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
						</div>
						<div class="row">
							<div class="btn-group">
								<a href="AdminModificaProdotti.jsp?id=<%=b.get(i).getCodice()%>"
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