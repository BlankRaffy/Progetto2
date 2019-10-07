<!DOCTYPE html>
<html lang="ita">
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
</head>
<body>
	<%@ include file="navbar.jsp"%>	
	<%
		if (request.getAttribute("recsended") != null) {
			boolean issended = (boolean) request.getAttribute("recsended");
			if (issended == true) {
	%>
	<div class="alert alert-success">
		<strong>RECLAMO MANDATO! </strong> Il Reclamo è stato inviato con
		successo.
	</div>
	<%
		} else {
	%>
	<div class="alert alert-danger">
		<strong>RECLAMO NON MANDATO! </strong> Il Reclamo non è stato inviato
		con successo.
	</div>
	<%
		}
		}
	%>

	<div id="index" class=container>
		<%@ include file="intestazione.jsp"%>
		<%@ include file="jumpotron.jsp"%>
		<%@ include file="content.jsp"%>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>
