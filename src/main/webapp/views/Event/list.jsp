<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Listar Eventos</title>
<%@ include file="/templates/header.jsp"%>

</head>
	<body>
		<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		<div class="container">
			<div class="row">
				<div id="conteudo" class="col-md-12">
					<p><a href="<%= request.getContextPath() %>/loginHome" >&laquo; Voltar </a></p><br/>
					<h2>Eventos</h2><br/>
					<div class="input-group">	
						<input type="text" class="form-control" placeholder="Procurar por...">
							  			
						<span class="input-group-btn">
							<button class="btn btn-default" type="button"> OK</button>
						</span>
					</div><br/>
					
					<div class="panel panel-default">
					  <!-- Default panel contents -->
					  					  
					  <div id="corPadrao" class="panel-heading">Meus Eventos Cadastrados</div>
					  <!-- Table -->
					  <table class="table">
					  	<thead>
					  		<tr>
					  			<th>#</th>
					  			<th>Descrição</th>
					  		</tr>
					  	</thead>
					  	<tbody>
					  		<c:forEach var="event" items="${eventList}" varStatus="status">
					        	<tr>
					        		<th scope="row">${status.index + 1}</th>
									<td>${event.description}</td>
									<td>			
										<table border="0">
											<tr>
												<td>
													<form action="<%= request.getContextPath() %>/editEvent">
														<input type="hidden" name="id" value="${event.id}">
														<button type="submit" class="btn btn-primary">
														<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</form>
												</td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td>
													<form action="<%= request.getContextPath() %>/deleteEvent">
														<input type="hidden" name="id" value="${event.id}">
														<button type="submit" class="btn btn-danger">
														<span class="glyphicon glyphicon-trash"></span>
														</button>
													</form>
												</td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td>
													<form action="<%= request.getContextPath() %>/detalhesEvent">
														<input type="hidden" name="id" value="${event.id}">
														<button type="submit" class="btn btn-info">
														<span class="glyphicon glyphicon-search"></span>
														</button>
													</form>
												</td>
											</tr>
										</table>
									</td>
					        	</tr>
							</c:forEach>
					  	</tbody>
					  </table>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp"%>	
	</body>
</html>