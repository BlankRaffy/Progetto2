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
<link rel="stylesheet" href="css/resetmycss.css">
<link rel="stylesheet" href="css/mycss.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div id="index" class=container>
		<%@ include file="intestazione.jsp"%>
		<div  class=container>
			<div class="col-md-2"></div>
			<div class="col-md-8" id="uffa">
				<h1>Cose da fare</h1>
				<ol>
					<li>Una volta confermato l'ordine deve essere possibile
						visualizzare l'ordine nell'elenco degli ordini effettuati e va
						svuotato il carrello.</li>
					<li>Va prevista la figura dell'amministratore e delle pagine a
						lui dedicate, accessibili solo dopo autenticazione (vedere lezione
						su Security). Usare autenticazione programmata</li>
					<li>L'AMMINISTRATORE DEVE POTER INSERIRE, MODIFICARE,
						VISUALIZZARE E CANCELLARE ELEMENTI DEL CATALOGO, VISUALIZZARE GLI
						ORDINI COMPLESSIVI, DALLA DATA ALLA DATA E PER CLIENTE</li>
					<li>Il sito deve girare su Tomcat direttamente</li>
					<li>Il Model deve contenere i bean, il carrello e la logica
						dell’applicazione</li>
					<li>I form sono controllati con javascript. Il form viene
						inviato al server solo se corretto. Usare le espressioni regolari
						per validare i campi del form. Mettere il "focus" sul campo in cui
						l'utente sta scrivendo. Visualizzare le istruzioni di compilazione
						di ogni campo di input nel placeholder. Fornire i messaggi di
						errore quando l'utente preme il submit (evitare gli alert)</li>
					<li>Usare JQuery per modificare il DOM in qualche pagina</li>
					<li>Usare JQuery + AJAX per scambiare piccole informazioni con
						il server (in formato JSON)</li>
					<li>Gestire le sessioni per realizzare il carrello</li>
					<li>Usare JQUERY per animare le immagini al passaggio del
						mouse</li>
				</ol>
				<h1>Cose da chiedere :</h1>
				<ol>
					<li>registrazione dinamica utenti: se è volontario appare form per orario libero </li>
				</ol>
			</div>
			<div class="col-md-2"></div>

		</div>
	</div>
	<%@ include file="footer.jsp"%>


</body>
</html>
