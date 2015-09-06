<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Cadastro de Usuário</title>

<%@ include file="/templates/header.jsp"%>
</head>
<body>
	<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		<div class="container">
			<div class="row">	
				<div class="alert alert-success" role="alert">
					Cadastro realizado com sucesso!
				</div>
				<b>Realizar login </b><a href="/loginUser">Clique aqui!</a>
			</div><!-- div row container -->
		</div><!-- div container --><br/>
	<%@ include file="/templates/footer.jsp"%>
</body>
</html>