<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Landing Page</title>
</head>
<body>
	<h1>Welcome to the To-do list Management System</h1>
	<c:if test = "${username ne null}">
		<h3>Registration successful for username: ${username}</h3>
	</c:if>
	<c:if test = "${loginFailedToken ne null}">
		<h3>Login failed.  Please try again.</h3>
	</c:if>
	<c:if test = "${logoutToken ne null}">
		<h3>You have been logged out.</h3>
	</c:if>
	<br>
	<form id = "login" action = "login" method = "post">
		<label>Username:</label>
		<input type = "text" name = "username">
		<br>
		<label>Password:</label>
		<input type = "text" name = "password">
		<br>
		<button type = "submit">Login</button>
	</form>
	<br>
	<hr width = "100%">
	<br>
	<form id = "registration" action = "registration" method = "post">
		<label>Username:</label>
		<input type = "text" name = "username">
		<br>
		<label>Password:</label>
		<input type = "text" name = "password">
		<br>
		<button type = "submit">Register</button>
	</form>
</body>
</html>