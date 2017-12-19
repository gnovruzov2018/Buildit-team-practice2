<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <table class="table table-striped">
            <thead>
                <tr class="tr tr-success">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Price</td>
                </tr>   
            </thead>
            <tbody>
                <c:forEach items="${plants}" var="temp">
                    <tr>
                        <td>${temp.name}</td>
                        <td>${temp.description}</td>
                        <td>${temp.price}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/se/plant/search">Search plant by id</a><br>
        <a href="/se/plant/checkplant">Check plant availability</a>
</body>
</html>