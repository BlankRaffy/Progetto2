<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<%
		if (session.getAttribute("admin") != null) {
	%>
	<%@ include file="navbaradmin.jsp"%>
	<div class=container>
		<div class="row">
		 <form action = "adminstoricoordini.jsp" > 
       <h4> visualizza ordini per  clienti </h4>
       <span style="float: right">
          <button type="submit" class="btn btn-success" >
            <span class="glyphicon glyphicon-plus"></span> Vedi Ordini Cliente

          </button>
        </span>
       </form>
       </div>
       
       <div class="row">
        <form action = "" > 
       <h4> visualizza ordini per data </h4>
       <input type="text">
       <span style="float: right">
          <button type="submit" class="btn btn-success" >
            <span class="glyphicon glyphicon-plus"></span> Vedi ordini per data 

          </button>
        </span>
       </form>
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