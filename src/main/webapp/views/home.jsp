<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@ include file="/templates/header.jsp"%>

<title>Página Principal</title>
</head>
	<body>
		<%@ include file="/templates/menu.jsp"%>
		
		<!-- Carousel
		================================================== -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner" role="listbox">
			<div class="item active">
			  <img class="first-slide" src="resources/img/carousel/imageCarousel.jpg" alt="First slide">
			  <div class="container">
				<div class="carousel-caption">
				  <h1>Divulgue seu evento.</h1>
				  <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
				  <p><a class="btn btn-lg btn-default" href="<%= request.getContextPath() %>/saibaMais" role="button"><b>L</b>er mais</a></p>
				</div>
			  </div>
			</div>
			<div class="item">
			  <img class="second-slide" src="resources/img/carousel/imageCarousel2.jpg" alt="Second slide">
			  <div class="container">
				<div class="carousel-caption">
				  <h1>Final de ano e não sabe pra onde ir?</h1>
				  <p>Nós ajudamos você! Sugerimos eventos de acordo com gostos selecionados.</p>
				  <p><a class="btn btn-lg btn-default" href="#" role="button"><b>L</b>er mais</a></p>
				</div>
			  </div>
			</div>
			<div class="item">
			  <img class="third-slide" src="resources/img/carousel/imageCarousel3.jpg" alt="Third slide">
			  <div class="container">
				<div class="carousel-caption">
				  <h1>Gerencie sua festa de aniversário.</h1>
				  <p>Aqui damos a possibilidade de gerenciar um evento privado. Onde você escolherá seus convidados e gerenciar seu próprio evento!</p>
				  <p><a class="btn btn-lg btn-default" href="#" role="button"><b>L</b>er mais</a></p>
				</div>
			  </div>
			</div>
		  </div>
		  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		  </a>
		</div><!-- /.carousel -->
		
		
		
		<div class="container text-center">
			<!-- começo conteúdo -->
			
			<hr>
			<h2>
				Eventos acontecendo na sua região  &nbsp;
				<a href="<%= request.getContextPath() %>/event"><img class="img-circle" src="resources/img/icon/icon-event2.jpg"/></a>
			</h2>
			<br/>
			<hr>
			<br/>
		</div>
		<!-- Marketing messaging and featurettes
		================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">

		  <!-- Three columns of text below the carousel -->
		  <div class="row text-center">
			<div class="col-lg-4">
			  <a href="<%= request.getContextPath() %>/pessoas" >
			  	<img class="img-circle" src="resources/img/icon/icon-chat.png" alt="Generic placeholder image" width="140" height="140">
			  </a>
			  <h2>Conheça outras pessoas</h2>
			  <p>Participe de eventos de diversas regiões do Brasil e conheça pessoas de diferentes culturas.</p>
			  <p><a href="<%= request.getContextPath() %>/pessoas" >Ler mais &raquo;</a></p>
			</div><!-- /.col-lg-4 -->
			<div class="col-lg-4">
			  <img class="img-circle" src="resources/img/icon/icon-email.png" alt="Generic placeholder image" width="140" height="140">
			  <h2>Receba por Email</h2>
			  <p>Receba por email eventos ou novidades de categorias relacionadas ao seus interesses.</p>
			  <p><a href="#" >Ler mais &raquo;</a></p>
			</div><!-- /.col-lg-4 -->
			<div class="col-lg-4">
			  <img class="img-circle" src="resources/img/icon/icon-compartilhar.png" alt="Generic placeholder image" width="140" height="140">
			  <h2>Compartilhe</h2>
			  <p>Divulgue seu evento, convide as pessoas e compartilhe em redes sociais.</p>
			  <p><a href="#" >Ler mais &raquo;</a></p>
			</div><!-- /.col-lg-4 -->
		  </div><!-- /.row -->


		  <!-- START THE FEATURETTES -->

		  <hr class="featurette-divider">

		  <div class="row featurette">
			<div class="col-md-7">
			  <h2 class="featurette-heading">Conheça novos sabores do Brasil. <span class="text-muted">Procure por eventos gastronômicos mais próximos.</span></h2>
			  <p class="lead">A culinária do Brasil é fruto de uma mistura de ingredientes europeus, indígenas e africanos. Toda essa cultura está espalhada no país todo. Venha conhecer eventos gastronômicos e experimente novos sabores!</p>
			</div>
			<div class="col-md-5">
			  <img class="featurette-image img-responsive center-block" src="resources/img/imageHome/gastronomia.png" alt="Generic placeholder image">
			</div>
		  </div>

		  <hr class="featurette-divider">

		  <div class="row featurette">
			<div class="col-md-7 col-md-push-5">
			  <h2 class="featurette-heading">Conheça novos Lugares. <span class="text-muted">Encontre eventos em diversos lugares do Brasil e conheça novas culturas.</span></h2>
			  <p class="lead">O Brasil é um país que tem diversos lugares paradisíacos. Faça passeios convencionais por lugares bem diferentes.</p>
			</div>
			<div class="col-md-5 col-md-pull-7">
			  <img class="featurette-image img-responsive center-block" src="resources/img/imageHome/lugares.jpg" alt="Generic placeholder image">
			</div>
		  </div>

		  <hr class="featurette-divider">

		  <div class="row featurette">
			<div class="col-md-7">
			  <h2 class="featurette-heading">Conheça novas culturas. <span class="text-muted">O cada região do Brasil possui uma cultura diferente.</span></h2>
			  <p class="lead">O Brasil é dividido em : Região Nordeste, Região Norte, Região Cento-Oeste, Região Sudeste, Região Sul, e cada uma tem sua peculiaridade. </p>
			</div>
			<div class="col-md-5">
			  <img class="featurette-image img-responsive center-block" src="resources/img/imageHome/culturas.jpg" alt="Generic placeholder image">
			</div>
		  </div>

		  <hr class="featurette-divider">
		  <!-- /END THE FEATURETTES -->

		</div><!-- /.container -->
		
		<%@ include file="/templates/footer.jsp"%>
	</body>
</html>