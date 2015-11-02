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
<script type="text/javascript" src="resources/js/mapaEventos.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.custom.min.js"></script>

</head>
	<body>
		<%@ include file="/templates/menu.jsp"%>
			<div class="container">
				<div class="row">
					<div id="conteudo" class="col-md-9">
					
						<div id="editar">
						
						</div>
					
						<form class="form" role="form" method="post" action="<%= request.getContextPath() %>/event" >
						
							<input type ="hidden" name="user_id" id="user_id" value="${usuarioLogado.id}"/>
							<div class="input-group">	
								<input type="text" class="form-control" id="txtEndereco" name="txtEndereco" placeholder="Procurar por...">
									  			
								<span class="input-group-btn">
									<button class="btn btn-default" id="btnEndereco" name="btnEndereco" type="button">Procurar</button>
								</span>
							</div><br/>
							<input type="hidden" id="txtLatitude" name="txtLatitude" />
                    		<input type="hidden" id="txtLongitude" name="txtLongitude" />
						
							<!-- div conteudo -->
							<div id="mapa">
								<p id="status">Procurando sua localização...</p>
							</div>
						</form><br/>
					</div><!-- div conteudo -->
					<!-- Sidebar -->
					<div id="sidebar" class="col-md-3">
						<div class="widget">
							<br/><p/><br/><p/>
							<h2>Evento</h2>
							<ul>
								<li><a href="<%= request.getContextPath() %>/eventMap">Criar evento</a></li>
								<c:if test="${!empty usuarioLogado.email}">
									<li>
										<form action="<%= request.getContextPath() %>/listEvent">
												<input type="hidden" name="idUser" value="${usuarioLogado.id}">
												<button type="submit" class="btn btn-default">
												Meus Eventos
											</button>
										</form>
									</li> 
								</c:if>

								<li><a href="">Parceiro 3</a></li>
								<li><a href="">Parceiro 4</a></li>
								<li><a href="">Parceiro 5</a></li>
							</ul>
						</div><br/>
						<h2>Legenda</h2>
						<img class="img-circle" src="resources/img/legenda/violet.png" alt="Generic placeholder image" width="20" height="20"> Festas<br/><br/>
						<img class="img-circle" src="resources/img/legenda/green.png" alt="Generic placeholder image" width="20" height="20"> Esportes<br/><br/>
						<img class="img-circle" src="resources/img/legenda/yellow.png" alt="Generic placeholder image" width="20" height="20"> Viagens<br/><br/>
						<img class="img-circle" src="resources/img/legenda/orange.png" alt="Generic placeholder image" width="20" height="20"> Músicas<br/><br/>
					</div>

				</div><!-- div row container --><br/>
			</div><!-- div container -->
		<%@ include file="/templates/footer.jsp"%>	
	</body>
</html>