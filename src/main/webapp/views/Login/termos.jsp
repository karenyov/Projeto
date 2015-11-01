<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Termos e Condições</title>
<%@ include file="/templates/header.jsp"%>
</head>
	<body>
		<%@ include file="/templates/menu.jsp"%>
		<div class="container">
			<div class="row">
				<div id="conteudo" class="col-md-9">	
							
					<div class="container droppedHover">
						<div class="col-md-6">
							<h2>Terms and Conditions</h2>
							<p>
								By clicking on "Register" you agree to The Company's' Terms and Conditions
							</p>
							<p>
								While rare, prices are subject to change based on exchange rate fluctuations - 
								should such a fluctuation happen, we may request an additional payment. You have the option to request a full refund or to pay the new price. (Paragraph 13.5.8)
							</p>
							<p>
								Should there be an error in the description or pricing of a product, we will provide you with a full refund (Paragraph 13.5.6)
							</p>
							<p>
								Acceptance of an order by us is dependent on our suppliers ability to provide the product. (Paragraph 13.5.6)
							</p>
							<br/>
							<a href="<%= request.getContextPath() %>/newUser">
								<button id="corPadrao" type="submit" class="btn btn-default">Concordo</button>
							</a>
						</div>
					</div><!-- fim div login -->
				</div><!-- div conteudo -->
			</div><!-- div row container -->
		</div><!-- div container --><br/>
		<%@ include file="/templates/footer.jsp"%>	
	</body>
</html>