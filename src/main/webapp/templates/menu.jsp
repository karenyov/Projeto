
	<nav class="navbar navbar-default" id="corMenu" role="navigation">
			<div class="container">
				<div class="navbar-header ">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%= request.getContextPath() %>/">Meu Site</a>
				</div>
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<%= request.getContextPath() %>/"><b>H</b>ome</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>E</b>ventos<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<%= request.getContextPath() %>/event">Criar Evento</a></li>
								<li class="divider"></li>
								<li><a href="#">Tutoriais</a></li>
								<li class="divider"></li>
								<li><a href="#">Vídeo aulas</a></li>
							</ul>
						</li>
						<li><a href="<%= request.getContextPath() %>/empresa"><b>E</b>mpresa</a></li>
						<li><a href="<%= request.getContextPath() %>/contact"><b>C</b>ontato</a></li>
						<li>&nbsp;&nbsp;&nbsp;</li><li>&nbsp;&nbsp;&nbsp;</li>
						
						<c:if test="${!empty usuarioLogado.email}">
							<li><a href="<%= request.getContextPath() %>/loginHome"><b>${usuarioLogado.email}</b></a></li>
							<li><a href="<%= request.getContextPath() %>/logout"><b>S</b>air</a></li>
						</c:if>
						<c:if test="${empty usuarioLogado.email}">
							<li><a href="<%= request.getContextPath() %>/loginUser"><b>L</b>ogin</a></li>
						</c:if>
						
					</ul>
					<!--<form class="navbar-form navbar-right" role="search" action="C:/Users/Karen/Desktop/TG/Layout/tutwd-bootstrap-layout1/html/login/login.html">
						<button type="submit" class="btn btn-success">Entrar</button>
					</form>-->
				</div>
			</div>
		</nav> <!-- final do navbar -->