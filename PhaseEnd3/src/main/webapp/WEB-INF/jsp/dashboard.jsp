<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Manager Dashboard</title>
</head>
<body>
	<h1>Welcome to the To-do List Management System, ${name}</h1>
	<a href="/addTask">Add new task</a>
	<br>
	<table>
	<tr>
		<th>Task Name</th>
		<th>Start Date</th>
		<th>End Date</th>
		<th>Description</th>
		<th>Relevant Email</th>
		<th>Severity</th>
		<th></th>
	</tr>
	<c:if test = "${count eq 0}">
		<tr>
		<td colspan = "7">You have no current tasks.<td>
		</tr>
	</c:if>
	<c:if test = "${count ne 0}">
		<c:forEach items = "${tasks}" var = "task">
			<tr>
				<td><c:out value = "${task.taskName}"/></td>
				<td><c:out value = "${task.startDate}"/></td>
				<td><c:out value = "${task.endDate}"/></td>
				<td><c:out value = "${task.description}"/></td>
				<td><c:out value = "${task.emailAddress}"/></td>
				<td><c:out value = "${task.severity}"/></td>
				<td>
					<form id = "updateTask" action = "updateTask" method = "post">
						<input type = "hidden" name = "taskId" value = "${task.taskId}">
						<input type = "hidden" name = "taskName" value = "${task.taskName}">
						<input type = "hidden" name = "startDate" value = "${task.startDate}">
						<input type = "hidden" name = "endDate" value = "${task.endDate}">
						<input type = "hidden" name = "description" value = "${task.description}">
						<input type = "hidden" name = "emailAddress" value = "${task.emailAddress}">
						<input type = "hidden" name = "severity" value = "${task.severity}">
						<button type = "submit">Update</button>
					</form>
					<form id = "deleteTask" action = "deleteTask" method = "post">
						<input type = "hidden" name = "taskId" value = "${task.taskId}">
						<button type = "submit">Delete</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
	<a href = "/logout">Log Out</a>
</body>
</html>