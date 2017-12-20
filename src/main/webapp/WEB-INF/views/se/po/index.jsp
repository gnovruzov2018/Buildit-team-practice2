<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h1>All Purchase Orders</h1>
<table class="table table-striped">
            <thead>
                <tr class="tr tr-success">
                	<td>ID</td>
                    <td>Ordered Plant</td>
                    <td>Total</td>
                    <td>Status</td>
                    <td>Action</td>
                </tr>   
            </thead>
            <tbody>
                <c:forEach items="${purchaseorders}" var="temp">
                    <tr>
                    	<td>${temp.id }</td>
                        <td>${temp.plant.name}</td>
                        <td>${temp.total}</td>
                        <td>${temp.status}</td>
                        <td><button type="button" onclick="cancelOrder(${temp.id})">Cancel Order</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <script>
        function cancelOrder(id){
        	alert(id);
        	$.ajax({
      	      type: "POST",
      	      contentType : 'application/json; charset=utf-8',
      	      dataType : 'json',
      	      url: "https://rentit-team-practice2.herokuapp.com/purchaseorders/delete/"+id,
      	    	 // Note it is important
      	      success :function(result) {
      	       console.log("success");
      	       
      	     }
      	  });
        	location.reload();
        }
        </script>
</body>
</html>