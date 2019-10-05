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
			int codice = Integer.parseInt(request.getParameter("id"));
			ProdottoDAO a = new ProdottoDAO();
			ProdottoBean prodotto = a.GetProdotto(codice);
	%>
	<%@ include file="navbaradmin.jsp"%>
	<div class=container>
		<br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-6">
						<img alt="Prodotto" src="<%=prodotto.getImmagine()%>">
					</div>
					<div class="col-md-6">

						<form action="AdminModificaProdottiServlet">
							<label>Vuoi metterlo in offerta?</label>
							<div class="form-row">
								<input type="radio" name="offerta" value="1" required="required"
									 id="btn1"> Si
							</div>
							<div class="form-row">
								<input type="radio" name="offerta" id="btn2" checked="checked" value="0">
								No
							</div>

							<div class="form-group">
								<label>Prezzo:</label> <input type="text" class="form-control"
									value="<%=prodotto.getPrezzo()%>" name="prezzo">
							</div>
							<div class="form-group">
								<label>Iva:</label> <input type="text" class="form-control"
									value="<%=prodotto.getIva()%>" name="iva">
							</div>
							<div class="form-group">
								<label>Nome:</label> <input type="text" class="form-control"
									value="<%=prodotto.getNome()%>" name="nome">
							</div>
							<div class="form-group">
								<label>Immagine:</label> <input type="text" class="form-control"
									value="<%=prodotto.getImmagine()%>" name="immagine">
							</div>
							<div class="form-group">
								<label>Descrizione:</label> <input type="text"
									class="form-control" value="<%=prodotto.getDescrizione()%>"
									name="descrizione">
							</div>
							<div class="form-group">
								<label>PDisponibili:</label> <input type="number"
									class="form-control" value="<%=prodotto.getPdisponibili()%>"
									name="Pdisponibili">
							</div>
							<div style="display: none" class="form-group col-md-12"
								id="DatainizioChange">
								<label for="inputDatainizio4">Data inizio:</label> <input
									type="text" class="form-control" name="datainizio"
									id="datainizio" placeholder="" required> <span
									id="datainizio"></span>
							</div>
							<div style="display: none" class="form-group col-md-12"
								id="DatafineChange">
								<label for="inputDatafine4">Data fine:</label> <input
									type="text" class="form-control" name="datafine" id="datafine"
									placeholder="" required> <span id="Datafinespan"></span>
							</div>
							<div style="display: none" class="form-group col-md-12"
								id="ScontoChange">
								<label for="inputSconto4">Sconto</label> <input type="text"
									class="form-control" name="sconto" id="sconto" placeholder=""
									required> <span id="ScontoSpan"></span>
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" value="<%=codice%>"
									name="IdCodice">
							</div>
							<button type="submit" class="btn btn-default">Modifica</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>

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