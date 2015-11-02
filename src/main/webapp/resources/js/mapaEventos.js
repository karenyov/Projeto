var geocoder;
var map;
var marker;
var eventos = [];

var latlngGeoUsurario;

var idUser;


/*início código de geolocalização*/
function GeoLocalizacao() {
    if (navigator.geolocation){//verificando se há suporte para API de Geolocalização
        navigator.geolocation.getCurrentPosition(locSucesso, erro);
    } else {
        $('#status').text('Seu browser não suporta geolocalização!');
    }
}

function loadXMLDoc() {
	
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			//document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
			var myArr = JSON.parse(xmlhttp.responseText);
			
		    processList(myArr);
		}
	}
	xmlhttp.open("POST", "/fatec/eventJSON", true);
	xmlhttp.setRequestHeader('Content-Type',
			'application/x-www-form-urlencoded');
	xmlhttp.send(null);
}

function processList(arr) {
	var out = "";
	var i;

	//todos os eventos
	for (i = 0; i < arr.length; i++) {
		//cada evento em uma lista
		var evento = arr[i].split(",");
		//todos os eventos em uma lista
		eventos.push(evento);
	}
	//função que mostra os eventos	
	mostraEventos(eventos);
}

var infowindow = new google.maps.InfoWindow({  
	content: ''
});

function mostraEventos(eventos) {	
	for (i = 0; i < eventos.length; i++) { 
		
		var conteudo = eventos[i][0];
		var categoria = eventos[i][4];
		var descricao = eventos[i][5];
		var inicio = eventos[i][6];
		var termino = eventos[i][7];
		
		//id do usuário que cadastrou o evento
		var userEvent = eventos[i][8];
		
		var idEvent = eventos[i][9];
		
		var compartilhar = "<button type='submit' class='btn btn-primary'>" +
					"<span class='glyphicon glyphicon-thumbs-up'>" +
					"</span></button>" +
					"  " +
					"<button type='submit' class='btn btn-primary'>" +
					"<span class='glyphicon glyphicon-share-alt'>" +
					"</span></button>"
					;
		
		 //evento publico mostrar para todos
		if(eventos[i][3] == "PUBLICO"){
			var markerEvent = new google.maps.Marker({
			   position: new google.maps.LatLng(eventos[i][1], eventos[i][2]),
			   title: eventos[i][0],
			   map: map
			});	
			
			(function(markerEvent, conteudo,categoria,descricao,inicio,termino) {
			    google.maps.event.addListener(markerEvent, 'click', function() {
			     infowindow.setContent("<b>"+categoria+"</b>"+
			    		 "<br/>"+conteudo +"<br/>"+ descricao +"<br/>"+
			    		 "<br/>"+ "<b>Data do evento</b><br/>" +
			    		 "Data de início: "+inicio +"<br/>"+
			    		 "Data de término: "+termino+
			    		 "<br/><br/>" + compartilhar
			     );
			     infowindow.open(map, markerEvent);
			   });
			})(markerEvent, conteudo,categoria,descricao,inicio,termino);
//http://www.funcion13.com/google-maps-anadiendo-informacion-marcador-con-infowindows/
		    
			if(eventos[i][4] == "Esportes"){
				markerEvent.setIcon('resources/img/marcadores/green.png');
			}
			if(eventos[i][4] == "Festas"){
				markerEvent.setIcon('resources/img/marcadores/violet.png');
			}
			if(eventos[i][4] == "Musicas"){
				markerEvent.setIcon('resources/img/marcadores/orange.png');
			}
			if(eventos[i][4] == "Viagens"){
				markerEvent.setIcon('resources/img/marcadores/yellow.png');
			}	
		}
		//PRIVADO
	}	              
}


 
function locSucesso(position) {
	
	//chama a função que mostrará os eventos
	loadXMLDoc();
	
    var latlngGeo = new google.maps.LatLng(position.coords.latitude,position.coords.longitude); //pegando localização do usuário
    
    latlngGeoUsurario = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
    
    
    var myOptions = {//opções do mapa
        zoom: 15, //configuração da proximidade de visualização do mapa quando iniciado
        mapTypeId: google.maps.MapTypeId.ROADMAP, //tipo do mapa (ROADMAP --> normal, default 2D map)
        center: latlngGeo
    };
 
    map = new google.maps.Map(document.getElementById("mapa"), myOptions);
	geocoder = new google.maps.Geocoder();
	
	marker = new google.maps.Marker({
		map: map,
		draggable: true,
		title:"Você está aqui!" //texto quando usuário passar mouse por cima do marcador
	});
	marker.setPosition(latlngGeo);
	
	var infowindow = new google.maps.InfoWindow({
        content: 'Você está aqui!' //mostrar texto quando usuário clicar no marcador
    });
 
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
    });
	
	//google.maps.event.addListener(marker, 'drag', function () {
		geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {  
					$('#txtEndereco').val(results[0].formatted_address);
					$('#txtLatitude').val(marker.getPosition().lat());
					$('#txtLongitude').val(marker.getPosition().lng());
				}
			}
		});
	//});
		
		
	
	//atualizar o endereço ao movimentar o macador
	google.maps.event.addListener(marker, 'drag', function () {
		geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {  
					$('#txtEndereco').val(results[0].formatted_address);
					$('#txtLatitude').val(marker.getPosition().lat());
					$('#txtLongitude').val(marker.getPosition().lng());
				}
			}
		});
	});
}
 
function erro(error) {//se houver erro na geolocalização mostrar na tela
    $('#status').text(error == typeof msg == 'string' ? msg : "falha ao localizar");
    $('#status').css('background-color','#F00').css('padding','5px');
}
/*fim código de geolocalização*/

/*início código de busca apartir do endereço pesquisado*/
function initialize() {
	
	var latlng = new google.maps.LatLng(0, 0);
	var options = {
		zoom: 15,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	
	map = new google.maps.Map(document.getElementById("mapa"), options);
	
	geocoder = new google.maps.Geocoder();
	
	marker = new google.maps.Marker({
		map: map,
		draggable: true,
	});
	marker.setPosition(latlng);
	
}

$(document).ready(function () {
	GeoLocalizacao();
	initialize();

	function carregarNoMapa(endereco) {
		geocoder.geocode({ 'address': endereco + ', Brasil', 'region': 'BR' }, function (results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {
					var latitude = results[0].geometry.location.lat();
					var longitude = results[0].geometry.location.lng();
		
					$('#txtEndereco').val(results[0].formatted_address);
					$('#txtLatitude').val(latitude);
                   	$('#txtLongitude').val(longitude);
		
					var location = new google.maps.LatLng(latitude, longitude);
					marker.setPosition(location);
					map.setCenter(location);
					map.setZoom(15);
				}
			}
		})
	}
	
	$("#btnEndereco").click(function() {
		if($(this).val() != ""){
			carregarNoMapa($("#txtEndereco").val());
		}
		else{
			GeoLocalizacao();
		}
	})
	
	$("#txtEndereco").blur(function() {
		if($(this).val() != ""){
			carregarNoMapa($(this).val());
		}
		else{
			GeoLocalizacao();
		}
	})
	
	//google.maps.event.addListener(marker, 'drag', function () {
		geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {  
					$('#txtEndereco').val(results[0].formatted_address);
					$('#txtLatitude').val(marker.getPosition().lat());
					$('#txtLongitude').val(marker.getPosition().lng());
				}
			}
		});
	//});
	
	//atualizar o endereço ao movimentar o macador
	google.maps.event.addListener(marker, 'drag', function () {
		geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {  
					$('#txtEndereco').val(results[0].formatted_address);
					$('#txtLatitude').val(marker.getPosition().lat());
					$('#txtLongitude').val(marker.getPosition().lng());
					
				}
			}
		});
	});
	
	$("#txtEndereco").autocomplete({
		source: function (request, response) {
			geocoder.geocode({ 'address': request.term + ', Brasil', 'region': 'BR' }, function (results, status) {
				response($.map(results, function (item) {
					return {
						label: item.formatted_address,
						value: item.formatted_address,
						latitude: item.geometry.location.lat(),
          				longitude: item.geometry.location.lng()
					}
				}));
			})
		},
		select: function (event, ui) {
			$("#txtLatitude").val(ui.item.latitude);
    		$("#txtLongitude").val(ui.item.longitude);
			var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
			marker.setPosition(location);
			map.setCenter(location);
			map.setZoom(15);
		}
	});
});

/*fim código de busca apartir do endereço pesquisado */