<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Congratulations on Your Successful Purchase!</title>
</head>
<body>
    <h1>Success</h1>
    <p><%= request.getAttribute("successMessage") %></p>
    <form action="homePage.jsp">
        <input type="submit" value="Back to HomePage">
    </form>
</body>
</html>
