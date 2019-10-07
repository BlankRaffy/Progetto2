<script type="text/javascript">
	$(document).ready(function registerV() {
		$.ajax({
			type : "POST",
			url : "RegisterVolontarioServlet",
		});

	});
</script>
<div class="row">
	<a href="magazine.jsp"><img src="media\magazine.png"
		class="img-responsive" alt="Magazine"> </a>
</div>
<br>
<div class="row" align="center">
	<a href="register.jsp"><img src="media\diventavolontario.png"
		class="img-responsive" alt="Diventa Volontario" onclick="registerV()"></a>

</div>