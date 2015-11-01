<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Pessoas</title>
<script src="resources/js/validarCampos.js"></script>
<%@ include file="/templates/header.jsp"%>
</head>
<body>
	<%@ include file="/templates/menu.jsp"%>
		<!-- SEU CONTEÚDO -->
		<center> 
			<h2>Conheça outras pessoas</h2> 
		</center><br/>
		<div class="[ container text-center ]">
		    <div class="[ row ]">
		        <div class="[ col-xs-12 ]" style="padding-bottom: 30px;">
		            <p>This is my attempt to make a wonderful snippet posted by <a target="_blank" href="http://www.bootsnipp.com/maridlcrmn">maridlcrmn</a> a little more responsive. You can find the orginal <a target="_parent" href="http://bootsnipp.com/maridlcrmn/snippets/QbEpr">here</a></p>
		        </div>
		    </div>
		</div>
		<div class="[ container text-center ]">
			<div class="[ row ]">
				<div class="[ col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 ]" role="tabpanel">
		            <div class="[ col-xs-4 col-sm-12 ]">
		                <!-- Nav tabs -->
		                <ul class="[ nav nav-justified ]" id="nav-tabs" role="tablist">
		                    <li role="presentation" class="active">
		                        <a href="#dustin" aria-controls="dustin" role="tab" data-toggle="tab">
		                            <img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dustinlamont/128.jpg" />
		                            <span class="quote"><i class="fa fa-quote-left"></i></span>
		                        </a>
		                    </li>
		                    <li role="presentation" class="">
		                        <a href="#daksh" aria-controls="daksh" role="tab" data-toggle="tab">
		                            <img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dakshbhagya/128.jpg" />
		                            <span class="quote"><i class="fa fa-quote-left"></i></span>
		                        </a>
		                    </li>
		                    <li role="presentation" class="">
		                        <a href="#anna" aria-controls="anna" role="tab" data-toggle="tab">
		                            <img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/annapickard/128.jpg" />
		                            <span class="quote"><i class="fa fa-quote-left"></i></span>
		                        </a>
		                    </li>
		                    <li role="presentation" class="">
		                        <a href="#wafer" aria-controls="wafer" role="tab" data-toggle="tab">
		                            <img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/waferbaby/128.jpg" />
		                            <span class="quote"><i class="fa fa-quote-left"></i></span>
		                        </a>
		                    </li>
		                </ul>
		            </div>
		            <div class="[ col-xs-8 col-sm-12 ]">
		                <!-- Tab panes -->
		                <div class="tab-content" id="tabs-collapse">            
		                    <div role="tabpanel" class="tab-pane fade in active" id="dustin">
		                        <div class="tab-inner">                    
		                            <p class="lead">Etiam tincidunt enim et pretium efficitur. Donec auctor leo sollicitudin eros iaculis sollicitudin.</p>
		                            <hr>
		                            <p><strong class="text-uppercase">Dustin Lamont</strong></p>
		                            <p><em class="text-capitalize"> Senior web developer</em> at <a href="#">Apple</a></p>                 
		                        </div>
		                    </div>
		                    
		                    <div role="tabpanel" class="tab-pane fade" id="daksh">
		                        <div class="tab-inner">
		                            <p class="lead">Suspendisse dictum gravida est, nec consequat tortor venenatis a. Suspendisse vitae venenatis sapien.</p>
		                            <hr>
		                            <p><strong class="text-uppercase">Daksh Bhagya</strong></p>
		                            <p><em class="text-capitalize"> UX designer</em> at <a href="#">Google</a></p>
		                        </div>
		                    </div>
		                    
		                    <div role="tabpanel" class="tab-pane fade" id="anna">
		                        <div class="tab-inner">
		                            <p class="lead">Nullam suscipit ante ac arcu placerat, nec sagittis quam volutpat. Vestibulum aliquam facilisis velit ut ultrices.</p>
		                            <hr>
		                            <p><strong class="text-uppercase">Anna Pickard</strong></p>
		                            <p><em class="text-capitalize"> Master web developer</em> at <a href="#">Intel</a></p>
		                        </div> 
		                    </div>
		                    
		                    <div role="tabpanel" class="tab-pane fade" id="wafer">
		                        <div class="tab-inner">
		                            <p class="lead"> Fusce erat libero, fermentum quis sollicitudin id, venenatis nec felis. Morbi sollicitudin gravida finibus.</p>
		                            <hr>
		                            <p><strong class="text-uppercase">Wafer Baby</strong></p>
		                            <p><em class="text-capitalize"> Web designer</em> at <a href="#">Microsoft</a></p>
		                        </div>
		                    </div>
		                </div>
		            </div>        
		        </div>
			</div>
		</div>
		
	<%@ include file="/templates/footer.jsp"%>
</body>
</html>