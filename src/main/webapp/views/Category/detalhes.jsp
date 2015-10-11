<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Categoria</title>
<%@ include file="/templates/header.jsp"%>
</head>
<body>
	<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		<div class="container">
			<div class="row">
				<div id="conteudo" class="col-md-9">
					<!-- div login -->
					<p><a href="<%= request.getContextPath() %>/listCategory" >&laquo; Voltar </a></p><br/>
					<div class="container droppedHover">	
						<form:form action="" name="f" method="post" modelAttribute="category" commandName="category" class="form-signin" role="form">
							<form:hidden path="id"/>
							<h2 class="form-signin-heading" contenteditable="false">Categoria Detalhes</h2><br/>
							<label class="">
								Código da Categoria:
							</label>  ${category.id} <br/>
							<label class="">
								Descrição da Categoria:
							</label>  ${category.description} 				
							<br/>
						</form:form>
					</div><!-- fim div login -->
				</div><!-- div conteudo -->
			</div><!-- div row container -->
		</div><!-- div container --><br/>
	<%@ include file="/templates/footer.jsp"%>
</body>
</html>