<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Menu Usuário</title>
<script src="resources/js/validarCampos.js"></script>
<%@ include file="/templates/header.jsp"%>
</head>
<body>
	<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		
		<div class="container marketing">
			<c:if test="${usuarioLogado.email == 'admin@admin.com'}">
				<center><h2>Você é um administrador!</h2></center></br>
				<!-- Three columns of text below the carousel -->
				  <div class="row text-center">
					<div class="col-lg-4">
					  <a href="" >
					  	<img class="img-circle" src="resources/img/icon/icon-cadastro.png" alt="Generic placeholder image" width="140" height="140">
					  </a>	
					  <h2>Meu Cadastro</h2>
					  <p><a href="<%= request.getContextPath() %>/loginConf" >Atualizar cadastro </a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
					  <a href="" >
					  	<img class="img-circle" src="resources/img/icon/icon-email.png" alt="Generic placeholder image" width="140" height="140">
					  </a>
					  <h2>Email</h2>
					  <p><a href="#" >Verificar caixa de email </a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
					  <a href="<%= request.getContextPath() %>/listUser" >
					  	<img class="img-circle" src="resources/img/icon/icon-compartilhar.png" alt="Generic placeholder image" width="140" height="140">
					  </a>
					  <h2>Usuários</h2>
					  <p><a href="<%= request.getContextPath() %>/listUser" >Consultar Usuários</a></p>
					</div><!-- /.col-lg-4 -->
				  </div><!-- /.row -->
				  <!-- Three columns of text below the carousel -->
				  
				  
				  <div class="row text-center">
					<div class="col-lg-4">
					  <a href="<%= request.getContextPath() %>/homeCategory" >
					  	<img class="img-circle" src="resources/img/icon/icon-category.png" alt="Generic placeholder image" width="140" height="140">
					  </a>
					  <h2>Categorias</h2>
					  <p><a href="<%= request.getContextPath() %>/homeCategory" >Gerenciar categorias de eventos </a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
					  <a href="" >
					  	<img class="img-circle" src="resources/img/icon/icon-email.png" alt="Generic placeholder image" width="140" height="140">
					  </a>
					  <h2>Email</h2>
					  <p><a href="#" >Verificar caixa de email </a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
					  <a href="" >
					  	<img class="img-circle" src="resources/img/icon/icon-compartilhar.png" alt="Generic placeholder image" width="140" height="140">
					  </a>
					  <h2>Usuários</h2>
					  <p><a href="#" >Ler mais</a></p>
					</div><!-- /.col-lg-4 -->
				  </div><!-- /.row -->
			</c:if>
			<c:if test="${usuarioLogado.email != 'admin@admin.com'}">
				  <!-- Three columns of text below the carousel -->
				  <div class="row text-center">
					<div class="col-lg-4">
					  <img class="img-circle" src="resources/img/icon/icon-cadastro.png" alt="Generic placeholder image" width="140" height="140">
					  <h2>Meu Cadastro</h2>
					  <p><a href="<%= request.getContextPath() %>/loginConf" >Atualizar cadastro </a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
					  <img class="img-circle" src="resources/img/icon/icon-email.png" alt="Generic placeholder image" width="140" height="140">
					  <h2>Email</h2>
					  <p><a href="#" >Verificar caixa de email </a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
					  <img class="img-circle" src="resources/img/icon/icon-compartilhar.png" alt="Generic placeholder image" width="140" height="140">
					  <h2>Compartilhe</h2>
					  <p><a href="#" >Ler mais</a></p>
					</div><!-- /.col-lg-4 -->
				  </div><!-- /.row -->
			</c:if>
		</div><!-- /.container -->
		
	<%@ include file="/templates/footer.jsp"%>
</body>
</html>