<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="admin.jsp">Home</a></li>
					<li><a href="adminProdotti.jsp">Elenco Prodotti</a></li>
					<li><a href="adminelencoVolontari.jsp"> Elenco Volontari</a></li>
					<li><a href="adminReclamo.jsp">Elenco Reclami</a></li>
					<li><a href="AdminRicerca.jsp">Storico Ordini</a></li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right navbar-brand">
					<li id="adminW"> Benvenuto, Admin</li>
				<li ><form action="LogOutServlet">
						<button id="logout" class="btn btn-success btn-xs" type="submit">Log
							out</button>
					</form></li>
			</ul>
					
				

			</div>
		</div>
	</nav>