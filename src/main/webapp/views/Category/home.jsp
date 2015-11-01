<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Categorias</title>
<%@ include file="/templates/header.jsp"%>
</head>
	<body>
		<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		<div class="container">
			<div class="row">
				<div id="conteudo" class="col-md-9">	
					<p><a href="<%= request.getContextPath() %>/loginHome" >&laquo; Voltar </a></p><br/>
					<h2>Categorias</h2><br/>	
					<ul>
						<li><a href="<%= request.getContextPath() %>/listCategory" ><span class="glyphicon glyphicon-list"></span> Listar Categorias </a></li>
						<li><a href="<%= request.getContextPath() %>/newCategory" > <span class="glyphicon glyphicon-plus"></span>Cadastrar nova Categoria </a></li>
					</ul>			
				</div><!-- div conteudo -->
			</div><!-- div row container -->
		</div><!-- div container --><br/>
		<%@ include file="/templates/footer.jsp"%>	
	</body>
</html>