<script type="text/javascript">
	$(document).ready(function registerV() {
		$.ajax({
			type : "POST",
			url : "RegisterVolontarioServlet",
		});

	});
</script>
<br>
<div class="row">
<div class="col-md-12">

	<a href="magazine.jsp"><img src="media\magazine.png"
		class="img-responsive" alt="Magazine"> </a>
</div>
</div>
<br>
<div class="row" align="center">
<div class="col-md-12">
	<a href="register.jsp"><img style="width:100%" src="media\diventavolontario.png"
		class="img-responsive" alt="Diventa Volontario" onclick="registerV()"></a>

</div>
</div>