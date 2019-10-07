<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import ="dao.UtenteDAO" %>
		<%@page import ="model.UserBean" %>
			<%@page import ="java.util.*" %>
		
	
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
		<br>
		<div class="row">
			<form action="adminstoricoordini.jsp">
				<h4>visualizza ordini per clienti</h4>
				<span style="float: right">
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-plus"></span> Vedi Ordini Cliente

					</button>
				</span>
			</form>
		</div>

		<div class="row">
			<form action="AdminRicercaDAta">
				<h4>visualizza ordini per data</h4>
				<input type="date" name="dataInizio"> 
				<input type="date"
					name="dataFine"> <span style="float: right">
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-plus"></span> Vedi ordini per
						data

					</button>
				</span>
			</form>
		</div>
		<div class="row">
			<form action="AdminRicercaUtenteData">
				<h4>visualizza ordini per data e per utente</h4>
				<input type="date" name=""> 
				<input type="date" name=""> <span style="float: right">
				<select name ="email">
				<%UtenteDAO alluser= new UtenteDAO();
				ArrayList<UserBean> a = alluser.getAllUtenti();
				for (int i = 0; i<a.size();i++){%>
				<option value="<%=a.get(i).getEmail() %>" > <%=a.get(i).getEmail() %>  </option>
				  
				<%} %>
				
				</select>
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-plus"></span> Vedi Risultati

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