<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pkg.domain.PlantHireRequest" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <%@ page isELIgnored="false" %>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h1> ${phrs_id } </h1>
<% String id = request.getAttribute("phrs_id").toString();

String driverName = "com.postgresql.jdbc.Driver";
String connectionUrl = "jdbc:postgresql://ec2-23-21-236-249.compute-1.amazonaws.com:5432/";
String dbName = "d2id56oskru8dr";
String userId = "vciefrjflruhsm";
String password = "f42249fd6b886266136032177e3e0b85368057117b7b48a7cf29a6420a311d9b";
String driverName1 = "com.postgresql.jdbc.Driver";
String connectionUrl1 = "jdbc:postgresql://ec2-54-83-3-101.compute-1.amazonaws.com:5432/";
String dbName1 = "dfdiqvqj0n7jlc";
String userId1 = "teodqgkbhirlip";
String password1 = "9a8d13ac83be9e5e3a0b14b87da7e88c86c2d58dd2d3bfe26d5c737dfe78cdb7";


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
Connection connection1 = null;
Statement statement1 = null;
ResultSet resultSet1 = null;
String enddate = "";
String startdate = "";
String plantname = "";
String plantdesc = "";
String plantid = "";
String plantprice = "";
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
connection1 = DriverManager.getConnection(connectionUrl1+dbName1, userId1, password1);
statement=connection.createStatement();
statement1=connection1.createStatement();
String sql ="SELECT * FROM planthirerequest where id ="+id;

resultSet = statement.executeQuery(sql);
while(resultSet.next()){

 enddate = resultSet.getString("enddate"); 
 startdate = resultSet.getString("startdate"); 
 plantname = resultSet.getString("planthref"); 

}
String sql1 ="SELECT * FROM plant where name ='"+plantname+"'";

resultSet1 = statement1.executeQuery(sql1);
while(resultSet1.next()){
 plantid = resultSet1.getString("id");
 plantprice = resultSet1.getString("price");
 //plantdesc = resultSet1.getString("description");
}
} catch (Exception e) {
e.printStackTrace();
}
%>
<input type="hidden" id="sdate" value="<%=startdate %>" />
<input type="hidden" id="edate" value="<%=enddate %>" />
<input type="hidden" id="pid" value="<%=plantid %>" />
<input type="hidden" id="price" value="<%=plantprice %>" />
<input type="hidden" id="pdesc" value="<%=plantdesc %>" />
<input type="hidden" id="pname" value="<%=plantname %>" />
<script>

var startdate = new Date($('#sdate').val()); 
var enddate = new Date($('#edate').val()); 
var pid = $('#pid').val(); 
var pname = $('#pname').val(); 
var total = $('#price').val();
var pdesc = $('#pdesc').val();
var plant = {id:pid,name:pname, description:pdesc, price:total};
var purchaseorder = {
		  "startDate" : startdate,
		  "endDate" : enddate,
	      "total" : total,
	      "status" : 1,
	      "plant" : plant
	   }
	   console.log(purchaseorder);
	   $.ajax({
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      url: "https://rentit-team-practice2.herokuapp.com/purchaseorders/postpo",
	      data: JSON.stringify(purchaseorder), // Note it is important
	      success :function(result) {
	       console.log("success");
	     }
	  });
</script>
<h3>Purchase Order Created Successfully!</h3><br>
<h4>Plant: <%=plantname %></h4><br>
<h4>Start Date: <%=startdate %></h4><br>
<h4>End Date: <%=enddate %></h4><br>
<h4>Total: <%=plantprice %>$</h4>
</body>
</html>