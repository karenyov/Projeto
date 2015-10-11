<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Categorias</title>
<script src="resources/js/validarCampos.js"></script>
<%@ include file="/templates/header.jsp"%>
</head>
<body>
	<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		<div class="container">
			<div class="row">
				<div id="conteudo" class="col-md-9">
					<p><a href="<%= request.getContextPath() %>/homeCategory" >&laquo; Voltar </a></p><br/>
					<!-- div login -->
					<div class="container droppedHover">	
						<form:form action="saveCategory" name="f" method="post" modelAttribute="category" commandName="category" class="form-signin" role="form">
							<form:hidden path="id"/>
							<h2 class="form-signin-heading" contenteditable="false">Formulário de Categorias</h2><br/>
							<label class="">
								Descrição da Categoria
							</label><br/>
							<form:input path="description" class="form-control" placeholder="Descrição" required="true" autofocus="" contenteditable="false"/>
							<form:errors path="description" class="form-control alert-danger" role="alert" contenteditable="false"/><br/>
							<c:if test="${erroCategory =='sim'}">
								<div class="alert alert-danger" role="alert">
									Categoria já cadastrada!
								</div>
							</c:if>							
							<br/>
							<button id="corPadrao" class="btn btn-lg btn-default btn-block" type="submit">Enviar</button><br/>
						</form:form>
					</div><!-- fim div login -->	
				</div><!-- div conteudo -->
			</div><!-- div row container -->
		</div><!-- div container --><br/>
	<%@ include file="/templates/footer.jsp"%>
</body>
</html>