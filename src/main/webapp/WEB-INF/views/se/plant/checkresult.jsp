<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</head>
<body>
<%String id = request.getAttribute("plant_id").toString();
String sdate = request.getAttribute("sdate").toString();
String edate = request.getAttribute("edate").toString();

String driverName = "com.postgresql.jdbc.Driver";
String connectionUrl = "jdbc:postgresql://ec2-54-83-3-101.compute-1.amazonaws.com:5432/";
String dbName = "dfdiqvqj0n7jlc";
String userId = "teodqgkbhirlip";
String password = "9a8d13ac83be9e5e3a0b14b87da7e88c86c2d58dd2d3bfe26d5c737dfe78cdb7";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
ResultSet resultSet1 = null;

String result = "";
String result1 = "";
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT count(*) as ponum from purchaseorder";
String sql1 ="SELECT count(*) as ponum from purchaseorder where plant_id ="+id+"and ('"+edate+"' <= startdate or '"+sdate+"' >= enddate)";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){

 result = resultSet.getString("ponum"); 
 
}
resultSet1 = statement.executeQuery(sql1);
while(resultSet1.next()){

 result1 = resultSet1.getString("ponum"); 
 
}
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
<%
if(result1==result){
	%>
	<h1>Dear user, plant is available in selected time range</h1>
	<%
}else{
	%>
	<h1>Dear user, plant is reserved in selected time range</h1>
	<%
}
	%>
</html>