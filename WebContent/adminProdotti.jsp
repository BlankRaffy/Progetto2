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
<link rel="stylesheet" href="css/mycss.css">

<script>
	$(document).ready(
			function() {
				$("#Button").click(
						function() {
							var prezzo = $('#myForm').find(
									'input[name="prezzo"]').val();
							var iva = $('#myForm').find('input[name="iva"]')
									.val();
							var nome = $('#myForm').find('input[name="nome"]')
									.val();
							//var descrizione = $('#myForm').find('input[name="descrizione"]').val();
							var descrizione = document.getElementById("provaDescrizione").value;
							//var pd = $('#myForm').find('input[name="PDisponibili"]').val();
							var pd = document.getElementById("provaPD").value;
							var offerta = $('#myForm').find(
									'input[name="offerta"]:checked').val();
							
							var immagine = "media/" + document.getElementById("InputFile").value.split('\\')[2];
							
							if (offerta == 0) {
								var json = {
									"prezzo" : prezzo,
									"iva" : iva,
									"nome" : nome,
									"immagine" : immagine,
									"descrizione" : descrizione,
									"pd" : pd,
									"offerta" : offerta
								}
								$.ajax({
									type : "GET",
									url : "AdminAddProdottiServlet",
									contentType : "application/json",
									data : {
										"json" : JSON.stringify(json)
									},
									success : function(status) {
										console.log("Entered", status);
										alert("Success!!!!!!!!");
										document.getElementById("ImageForm").submit();
									},
									error : function(error) {
										console.log("error", error);
										alert("ERROR");
									},

								});

							} else {
								var datainizio = $('#myForm').find(
										'input[name="Datainizio"]').val();
								var datafine = $('#myForm').find(
										'input[name="Datafine"]').val();
								var sconto = $('#myForm').find(
										'input[name="Sconto"]').val();

								var json = {
									"prezzo" : prezzo,
									"iva" : iva,
									"nome" : nome,
									"immagine" : immagine,
									"descrizione" : descrizione,
									"pd" : pd,
									"offerta" : offerta,
									"datainizio" : datainizio,
									"datafine" : datafine,
									"sconto" : sconto
								}

								$.ajax({
									type : "GET",
									url : "AdminAddProdottiServlet",
									contentType : "application/json",
									data : {
										"json" : JSON.stringify(json)
									},
									success : function(status) {
										console.log("Entered", status);
										alert("Success!!!!!!!!");
										document.getElementById("ImageForm").submit();
									},
									error : function(error) {
										console.log("error", error);
										alert("ERROR");
									},

								});
							}

						});
			});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {
			$("#DatainizioChange").css("display", "block");
			$("#DatafineChange").css("display", "block");
			$("#ScontoChange").css("display", "block");
		});
		$("#btn2").click(function() {
			$("#DatainizioChange").css("display", "none");
			$("#DatafineChange").css("display", "none");
			$("#ScontoChange").css("display", "none");
		});
	});
</script>

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
							<h4 class="modal-title">Aggiungi Prodotto</h4>
						</div>
						<div class="modal-body">
							<div>
								<div class="row">

									<div class="col-md-12">

										<form id="myForm" action="javascript:void(0);">
											<label>Vuoi metterlo in offerta?</label>
											<div class="form-row">
												<input type="radio" name="offerta" value="1" id="btn1">Si
											</div>
											<div class="form-row">
												<input type="radio" name="offerta" id="btn2"
													checked="checked" value="0"> No
											</div>
											<div class="form-group">
												<label>Prezzo:</label> <input type="text"
													class="form-control" name="prezzo">
											</div>
											<div class="form-group">
												<label>Iva:</label> <input type="text" class="form-control"
													name="iva">
											</div>
											<div class="form-group">
												<label>Nome:</label> <input type="text" class="form-control"
													name="nome">
											</div>
											<div class="form-group">
												<label>Immagine:</label> 
												
									                <input id="InputFile" type="file" name="file" form="ImageForm"/>
									             
											</div>
											<div class="form-group">
												<label>Descrizione:</label> <input id="provaDescrizione" type="text"
													class="form-control" name="descrizione">
											</div>
											<div class="form-group">
												<label>PDisponibili:</label> <input id="provaPD" type="number"
													class="form-control" name="PDisponibili">
											</div>
											<div style="display: none" class="form-group col-md-12"
												id="DatainizioChange">
												<label for="inputDatainizio4">Data inizio:</label> <input
													type="date" class="form-control" name="Datainizio"
													id="Datainizio" placeholder="" required> <span
													id="Datainizio"></span>
											</div>
											<div style="display: none" class="form-group col-md-12"
												id="DatafineChange">
												<label for="inputDatafine4">Data fine:</label> <input
													type="date" class="form-control" name="Datafine"
													id="Datafine" placeholder="" required> <span
													id="Datafinespan"></span>
											</div>
											<div style="display: none" class="form-group col-md-12"
												id="ScontoChange">
												<label for="inputSconto4">Sconto</label> <input type="text"
													class="form-control" name="Sconto" id="Sconto"
													placeholder="" required> <span id="ScontoSpan"></span>
											</div>
											<button id="Button" class="btn btn-default">Aggiungi
												Prodotto</button>
										</form>
										<form id="ImageForm" action="UploadImageServlet" method="POST" enctype="multipart/form-data">
										</form>
									</div>
								</div>

							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">Close</button>
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
							<strong>Offerta:</strong>
							<%
								if (b.get(i).getOfferta() == 1) {
							%>Scontato
							<%
								} else {
							%>
							Non Scontato<%
								}
							%>
						</div>
						<div class="row">
							<strong>Prezzo:</strong>
							<%if(b.get(i).getOfferta() == 1){%>
							<%=(b.get(i).getPrezzo()-((b.get(i).getPrezzo()*b.get(i).getSconto())/100))%>
							<%} else{%>
							<%= b.get(i).getPrezzo()%>
							<%} %>
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