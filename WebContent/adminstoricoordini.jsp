<%@page import="dao.UtenteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="model.DB"%>
<%@page import="model.UserBean"%>
<%@page import="dao.UtenteDAO"%>

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
<link rel="stylesheet" href="css/mycss.css">
</head>
<body>
	<%
		if (session.getAttribute("admin") != null) {
	%>
	<%@ include file="navbaradmin.jsp"%>
	<div class=container>

		<h2 align="center">Elenco Clienti con relativi ordini</h2>
		<% UtenteDAO a  = new UtenteDAO();
	      ArrayList<UserBean> utenti = a.getAllUtenti();
	      for (int i = 0 ; i < utenti.size();i++){
	   %>
		<div>
		<div class="container">
			<div class="row">
				<h4>
					Nome :
					<%= utenti.get(i).getNome() %></h4></div>
				<div class="row">
				<h4>
					Cognome :
					<%= utenti.get(i).getCognome()%></h4> </div>
					<div class="row">
				<h4>
					Email :
					<%= utenti.get(i).getEmail()%></h4></div>
					<div class="row">
				<h4>
					Telefono :
					<%= utenti.get(i).getTelefono()%></h4></div>

				<span style="float: right"> <!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#myModal">
						<span class="glyphicon glyphicon-plus"></span> Vedi Ordini Cliente

					</button>
				</span>
				</div>


<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Ordini Cliente</h4>
						</div>
						<div class="modal-body">
							<div>
							 
								<div class="row">
                                   
									<div class="col-md-12">
									<%= utenti.get(i).getEmail() %></div>
								</div>
								

							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">Chiudi</button>
						</div>
					</div>
				</div>
			</div>
		
			</div>
			
			

		<% } %>
	
	<%
		} else {
	%><script>
		alert("ERRORE! STAI TENTANDO DI COMMETTERE UN ILLECITO")
	</script>

	<%
		}
	%>
	</div>

</body>
</html>