<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Existing Task</title>
</head>
<body>
	<h1>Edit your task information in the form below:</h1>
	<br>
	<form id = "commitUpdate" action = "commitUpdate" method = "post">
		<input type = "hidden" name = "taskId" value = "${taskId}">
		<label for = "taskName">Task Name:</label>
		<input type = "text" name = "taskName" id = "taskName" value = "${taskName}">
		<br>
		<label for = "startDate">Start Date:</label>
		<input type = "date" name = "startDate" id = "startDate" value = "${startDate}">
		<br>
		<label for = "endDate">End Date:</label>
		<input type = "date" name = "endDate" id = "endDate" value = "${endDate}">
		<br>
		<label for = "description">Description:</label>
		<textarea rows = "6" cols = "50" name = "description" id = "description">${description}</textarea>
		<br>
		<label for = "emailAddress">Email Address:</label>
		<input type = "text" name = "emailAddress" id = "emailAddress" value = "${emailAddress}">
		<br>
		<label for = "severity">Severity:</label>
		<select name = "severity" id = "severity">
			<c:if test = "${severity == 'Low'}">
				<option value = "Low" selected>Low</option>
				<option value = "Medium">Medium</option>
				<option value = "High">High</option>
			</c:if>
			<c:if test = "${severity == 'Medium'}">
				<option value = "Low">Low</option>
				<option value = "Medium" selected>Medium</option>
				<option value = "High">High</option>
			</c:if>
			<c:if test = "${severity == 'High'}">
				<option value = "Low">Low</option>
				<option value = "Medium">Medium</option>
				<option value = "High" selected>High</option>
			</c:if>
		</select>
		<br>
		<button type = "submit">Update Task</button>
	</form>

</body>
</html>