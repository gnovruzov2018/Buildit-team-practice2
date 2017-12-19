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
                    <td>Plant</td>
                    <td>Status</td>
                    <td>Site Engineer</td>
                    <td>Start Date</td>
                    <td>End Date</td>
                    <td>Update</td>
                    <td>Cancel</td>
                </tr>   
            </thead>
            <tbody>
                <c:forEach items="${planthirerequests}" var="temp">
                    <tr>
                        <td>${temp.plantHRef}</td>
                        <td>${temp.status}</td>
                        <td>${temp.siteEngineer}</td>
                        <td>${temp.startDate}</td>
                        <td>${temp.endDate}</td>
                        <c:if test="${temp.status == 'PENDING_CONFIRMATION'}">
                        <td><a href="/se/phrs/${temp.id }?form">Update</a></td>
                        </c:if>
                        <c:if test="${temp.status == 'ACCEPTED'}">
                        <td>Cannot be updated</td>
                        </c:if>
                        <td><a href="/se/phrs/cancel/${temp.id }">Cancel</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
</body>
</html>