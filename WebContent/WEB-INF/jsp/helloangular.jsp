<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Angular</title>
<link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style type="text/css">
div#map_container{
	width:100%;
	height:350px;
}
</style>
<script type="text/javascript" 
   src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	

<script type="text/javascript">
  function loadMap() {
    var latlng = new google.maps.LatLng(0,0);
    var myOptions = {
      zoom: 6,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_container"),myOptions);
	
    var marker = new google.maps.Marker({
      position: latlng, 
      map: map, 
      title:"my hometown, Malim Nawar!"
    }); 
  
  }
  
  function submitForm(){
	  var form = $('#myForm');
	  var formData = form.serializeArray();
	  
	  $.post("hi.html",formData, function(data){
		  $('#generalStatus').html(data).show();
	  })
  }
</script>
</head>
<body onload="loadMap()">
	<div class="container">
		<div class="jumbotron"><h1>Hello AngularJS!</h1>
		</div>
		
		<div ng-app>
			<div id="generalStatus" ng-hide="true"></div>
			<form:form id="myForm" name="myForm" method="POST" commandName="user" action="hi.html" novalidate="true">
				
				<form:label path="name">Name: 
					<form:input path="name" ng-model="name" required="true"/>
				</form:label>
				<span style="color:red" ng-show="myForm.name.$error.required && myForm.name.$dirty">
					Username is required.
				</span>
				<br/>
				<form:button id="submitButton" type="submit" onSubmit="submitForm()" ng-disabled="myForm.name.$error.required">Submit</form:button>
				
			</form:form>
			<h1>HELLO {{name}}</h1>
		</div>
		
		<div id="map_container"></div>
		<br>
	</div>
	
	
	<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</body>
</html>

