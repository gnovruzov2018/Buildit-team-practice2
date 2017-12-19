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
</head>
<body>
	<h3>Plant availability</h3>
	<br>
	<form method="get" action="/se/plant/checkp">
		Plant id: <input type="number" name="plant_id" /><br>
		<br> Start date: <input type="date" name="sdate" /><br>
		<br> End date: <input type="date" name="edate" /><br>
		<br> <input type="submit" value="Check">
	</form>
</body>
</html>