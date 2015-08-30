<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Event</title>
<%@ include file="/templates/header.jsp"%>
</head>
	<body onLoad="GeoLocalizacao();">
		<%@ include file="/templates/menu.jsp"%>
			<div class="container">
				<div class="row">
					<div id="conteudo" class="col-md-9">
						<!-- div conteudo -->
						<div id="geo">
							<p id="status">Procurando sua localização...</p>
						</div>
						<div id="textDescr">
							<label>Sua localização:</label>
							<input type="text" id="Descr">
						</div>
					</div><!-- div conteudo -->

					<!-- Sidebar -->
					<div id="sidebar" class="col-md-3">
						<div class="widget">
							<h3>Newsletter</h3>
							<form class="form" role="form">
								<div class="form-group">
									<label class="sr-only" for="exampleInputEmail2">Entre com seu email</label>
									<input type="email" class="form-control" id="exampleInputEmail2" placeholder="Entre com seu email">
								</div>
								<button type="submit" class="btn btn-success">Cadastrar</button>
							</form>
						</div>
						<div class="widget">
							<h3>Parceiros</h3>
							<ul>
								<li><a href="">Parceiro 1</a></li>
								<li><a href="">Parceiro 2</a></li>
								<li><a href="">Parceiro 3</a></li>
								<li><a href="">Parceiro 4</a></li>
								<li><a href="">Parceiro 5</a></li>
							</ul>
						</div>
					</div>

				</div><!-- div row container -->
			</div><!-- div container -->
		<%@ include file="/templates/footer.jsp"%>	
	</body>
</html>