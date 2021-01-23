<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Task</title>
</head>
<body>
	<h1>Insert your task information in the form below:</h1>
	<br>
	<form id = "commitAdd" action = "commitAdd" method = "post">
		<label for = "taskName">Task Name:</label>
		<input type = "text" name = "taskName" id = "taskName">
		<br>
		<label for = "startDate">Start Date:</label>
		<input type = "date" name = "startDate" id = "startDate">
		<br>
		<label for = "endDate">End Date:</label>
		<input type = "date" name = "endDate" id = "endDate">
		<br>
		<label for = "description">Description:</label>
		<textarea rows = "6" cols = "50" name = "description" id = "description"></textarea>
		<br>
		<label for = "emailAddress">Email Address:</label>
		<input type = "text" name = "emailAddress" id = "emailAddress">
		<br>
		<label for = "severity">Severity:</label>
		<select name = "severity" id = "severity">
			<option value = "Low">Low</option>
			<option value = "Medium">Medium</option>
			<option value = "High">High</option>
		</select>
		<br>
		<button type = "submit">Add Task</button>
	</form>
</body>
</html>