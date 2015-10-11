<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Event</title>

<%@ include file="/templates/header.jsp"%>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:600" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/mapa.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.custom.min.js"></script>

</head>
	<body>
		<%@ include file="/templates/menu.jsp"%>
			<div class="container">
				<div class="row"><center>
						<form class="form" role="form" action="<%= request.getContextPath() %>/newEvent" >
							<h2 class="form-signin-heading" contenteditable="false">Crie seu Evento</h2><br/>
							<label class="">
								Escolha a localização do seu evento:
								</label><br/>
							<input type="text" class="form-control" id="txtEndereco" name="txtEndereco" placeholder="Procurar por...">
							<br/>
							<input type="hidden" id="txtLatitude" name="txtLatitude" />
                    		<input type="hidden" id="txtLongitude" name="txtLongitude" />
						
							<!-- div conteudo -->
							<div id="mapa">
								<p id="status">Procurando sua localização...</p>
							</div><br/>
							<button id="corPadrao" class="btn btn-lg form-signin btn-default btn-block" type="submit">Próximo</button><br/>
						</form><br/>
					</center>

				</div><!-- div row container --><br/>
			</div><!-- div container -->
		<%@ include file="/templates/footer.jsp"%>	
	</body>
</html>