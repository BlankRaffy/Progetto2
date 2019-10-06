<%@page import="java.util.*"%>
<%@ page import="model.ProdottoBean"%>
<%@ page import="dao.ProdottoDAO"%>
<%
	ProdottoDAO p = new ProdottoDAO();
	ArrayList<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();
	prodotti = p.offerta();
	int lenghtp = prodotti.size();
%>
<div class="jumbotron">
	<h2 align="center">Prodotti in offerta</h2>
	<br>
	<div class="row">
		<div class="col-md-12">

			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<%
						for (int i = 0; i < lenghtp; i++) {
					%>
					<li data-target="#myCarousel" data-slide-to="<%=i%>" class="active"></li>
					<%
						}
					%>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<%
						for (int j = 0; j < lenghtp; j++) {
							if (j == 0) {
					%>
					<div class="item active">
						<img src="<%=prodotti.get(j).getImmagine()%>"
							class="img-responsive" style="width: 100%" alt="Prodotti">
					</div>
					<%
						} else {
					%>
					<div class="item">
						<img src="<%=prodotti.get(j).getImmagine()%>"
							class="img-responsive" style="width: 100%" alt="Prodotti">
					</div>
					<%
						}
					%>
					<%
						}
					%>
				</div>
				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<div class="col-md-0"></div>
		</div>
	</div>
</div>