<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Listar Categorias</title>
<%@ include file="/templates/header.jsp"%>

</head>
	<body>
		<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		<div class="container">
			<div class="row">
				<div id="conteudo" class="col-md-12">
					<div class="input-group">	
						<input type="text" class="form-control" placeholder="Procurar por...">
							  			
						<span class="input-group-btn">
							<button class="btn btn-default" type="button"> OK</button>
						</span>
					</div><br/>
					
					<div class="panel panel-default">
					  <!-- Default panel contents -->
					  					  
					  <div id="corPadrao" class="panel-heading">Categorias Cadastradas</div>

					  <!-- Table -->
					  <table class="table">
					  	<thead>
					  		<tr>
					  			<th>#</th>
					  			<th>Descrição</th>
					  		</tr>
					  	</thead>
					  	<tbody>
					  		<c:forEach var="user" items="${categoryList}" varStatus="status">
					        	<tr>
					        		<th scope="row">${status.index + 1}</th>
									<td>${user.description}</td>
									<td>			
										<table border="0">
											<tr>
												<td>
													<form action="<%= request.getContextPath() %>/editCategory">
														<input type="hidden" name="id" value="${user.id}">
														<button type="submit" class="btn btn-primary">
														<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</form>
												</td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td>
													<form action="<%= request.getContextPath() %>/deleteCategory">
														<input type="hidden" name="id" value="${user.id}">
														<button type="submit" class="btn btn-danger">
														<span class="glyphicon glyphicon-trash"></span>
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