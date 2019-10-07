
<%@page import="dao.UtenteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="model.DB"%>
<%@page import="model.UserBean"%>
<%@page import="dao.UtenteDAO"%>
<%@page import="dao.FatturaDAO"%>
<%@page import="model.RigaOrdineBean"%>
<%@page import="model.FatturaBean"%>
<%@page import="dao.ProdottoDAO"%>
<%@page import="dao.OrdinazioneDAO"%>
<%@page import="model.FatturaBean"%>
<%@page import="model.OrdinazioneBean"%>
<%@page import="dao.RigaOrdineDAO"%>




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
    <%
      UtenteDAO a = new UtenteDAO();
        ArrayList<UserBean> utenti = a.getAllUtenti();
        for (int i = 0; i < utenti.size(); i++) {
    %>
    <div>
      <div class="container">
        <div class="row">
          <h4>
            Nome :
            <%=utenti.get(i).getNome()%></h4>
        </div>
        <div class="row">
          <h4>
            Cognome :
            <%=utenti.get(i).getCognome()%></h4>
        </div>
        <div class="row">
          <h4>
            Email :
            <%=utenti.get(i).getEmail()%></h4>
        </div>
        <div class="row">
          <h4>
            Telefono :
            <%=utenti.get(i).getTelefono()%></h4>
        </div>

        <span style="float: right"> <!-- Trigger the modal with a button -->
          <button type="button" class="btn btn-success" data-toggle="modal"
            data-target="#<%=utenti.get(i).getNome()%>">
            <span class="glyphicon glyphicon-plus"></span> Vedi Ordini Cliente

          </button>
        </span>
      </div>


      <!-- Modal -->
      <div class="modal fade" id="<%=utenti.get(i).getNome()%>"
        role="dialog">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Ordini Cliente</h4>
            </div>
            <div class="modal-body">
              <div id="index" class=container>
                <%
                    String Email = utenti.get(i).getEmail();

                      FatturaDAO b = new FatturaDAO();
                      OrdinazioneDAO c = new OrdinazioneDAO();
                      int j;
                      int d = 0;

                      ArrayList<FatturaBean> fattura = b.getFattura(Email);
                      int counter = 0;
                      ArrayList<OrdinazioneBean> ordini = c.getOrdinazione(Email);
                %>
                <div class="row" align="left">
                  <h1>
                    
                    <%=utenti.get(i).getNome()%>
                    <%=utenti.get(i).getCognome()%></h1>
                </div>
                <%
                  for (int f = 0; f < ordini.size(); f++) {
                %>
                <div align="left" class="container">
                  <div class="row">
                    <h2>
                      Ordine numero :<%=ordini.get(f).getIdOrdine()%></h2>
                  </div>
                  <%
                    ArrayList<RigaOrdineBean> righe = new RigaOrdineDAO()
                              .getRigaOrdine(ordini.get(f).getIdOrdine());
                          int lenghtb = righe.size();
                          int n;
//stampa di tutte le righe d'ordine 
                          for (int k = 0; k < lenghtb; k++) {
                            n = righe.get(k).getIdProdotto();
                            ProdottoDAO prodotto = new ProdottoDAO();
                            String nome = prodotto.GetProdotto(n).getNome();
                  %>
                  <div class="row">
                    <div id="ordini" class="col-md-3">
                      <div class="row">
                        Nome :
                        <%=nome%>
                      </div>

                      <div class="row">
                        Quantità =
                        <%=righe.get(k).getQuantita()%>
                      </div>
                      <div class="row">
                        Prezzo :
                        <%=righe.get(k).getPrezzo()%>
                      </div>
                      <br>
                    </div>
                  </div>
                  <%
                    }
                  %>

                  <div align="left">
                    <div class="row">
                      <h4 id="ordinei">
                        Richiesto in data :
                        <%=ordini.get(i).getDate()%>
                      </h4>
                    </div>
                    <div class="row">
                      <h4 id="ordinei">
                        Totale speso in questo ordine :
                        <%=fattura.get(i).getImporto()%>
                      </h4>
                    </div>
                  </div>

                </div>
                <%
                  }
                %>

              </div>
              <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">Chiudi</button>
              </div>
            </div>
          </div>
        </div>

      </div>



      <%
        }
      %>

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