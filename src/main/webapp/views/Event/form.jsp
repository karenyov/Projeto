<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Evento</title>
<%@ include file="/templates/header.jsp"%>
</head>
<body>
	<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		<div class="container">
			<div class="row">
				<div id="conteudo" class="col-md-9">
					<!-- div login -->
					<p><a href="<%= request.getContextPath() %>/eventMap" >&laquo; Voltar </a></p><br/>
					<div class="container droppedHover">	
						<form:form action="saveEvent" name="f" method="post" modelAttribute="event" commandName="event" class="form-signin" role="form">
							<form:hidden  path="id"/>
							<form:hidden path="user_id" value="${usuarioLogado.id}"/>
							<h2 class="form-signin-heading" contenteditable="false">Formulário de Eventos</h2><br/>
							<label class="">
								Dados do Evento
							</label><br/>
							<form:input path="title" class="form-control" placeholder="Título" required="true" autofocus="" contenteditable="false"/>
							<form:input path="description" class="form-control" placeholder="Descrição" required="true" autofocus="" contenteditable="false" />
							<br/>
							<label class="">
								Privacidade do Evento
							</label><br/>
						    <form:select path="option" class="form-control">
								<form:option value="PUBLICO" label="Público"/>
								<form:option value="PRIVADO" label="Privado"/>
							</form:select>
							<br/>
							<label class="">
								Categoria do Evento
							</label><br/>
						    <form:select path="category" class="form-control">
								<c:forEach var="category" items="${categoryList}" varStatus="status">
									<form:option value="${category.id}" label="${category.description}"/>
								</c:forEach>
							</form:select>
							<br/>
							
							<label class="">
								Data de Início
							</label><br/>
							<form:input type="date" path="data_inicio" class="form-control"/>

							<label class="">
								Data de Término
							</label><br/>
							<form:input type="date" path="data_termino" class="form-control"/>
							
							<c:if test="${erroData1 =='sim'}">
								<div class="alert alert-danger" role="alert">
									Data de ínicio deve ser inferior a data de término!
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