<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h3>Search plant by id</h3>
	<div class="row">
	<div class="col-md-7">
		<input type="text" name="plantId" id="plantId"/> <button id="search">Search</button><br>
		</div>
		<div class="col-md-5">
		<div id="plantBody"></div>
		</div>
		</div>
		<script>
		$(document)
		.ready(
				function() {
					$('#search')
							.click(
									function() {
										var tr;
										$('#plantBody').empty();
										var plantid = $('#plantId').val();
										$
												.ajax({

													type : "GET",
													url : "http://localhost:8080/Rentit-Server/plants/json/"+plantid,
													success : function(
															result) {
														console
																.log(result);
															tr = "<h4>Name: "+result.name+"</h4><br><h4>Description: "+result.description+"</h4><br><h4>Price: "+result.price+"</h4>";
															$('#plantBody').append(tr);
													},
													error: function(){
														tr ="<h4>Plant not found</h4>";
														$('#plantBody').append(tr);
													}
												});
										
									});

				});
		</script>
</body>
</html>