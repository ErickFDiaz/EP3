<%@page import="model.Person"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

	<div class="container mt-5">
		<h1>Registration Form</h1>
		<form action="PersonServlet?type=registrar" method="post">
			<input type="hidden" name="type" value="registrar">
			<div class="mb-3">
				<label for="name" class="form-label">Id</label> <input type="text"
					class="form-control" id="id" name="id" value="${person.id}"
					readonly="readonly">
			</div>
			<!-- Full Name input -->
			<div class="mb-3">
				<label for="name" class="form-label">Full Name</label> <input
					type="text" class="form-control" id="name" name="name" value="${person.name}"
					placeholder="Enter your full name">
			</div>

			<!-- Email input -->
			<div class="mb-3">
				<label for="email" class="form-label">Email address</label> <input
					type="email" class="form-control" id="email" name="email" value="${person.email}"
					placeholder="name@example.com">
			</div>

			<!-- Password input -->
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password" value="${person.password}"
					placeholder="Enter your password">
			</div>

			<!-- Phone number input -->
			<div class="mb-3">
				<label for="phone" class="form-label">Phone Number</label> <input
					type="tel" class="form-control" id="phone" name="phone" value="${person.phone}"
					placeholder="123-456-7890">
			</div>

			<!-- Date of Birth input -->
			<div class="mb-3">
				<label for="birthDate" class="form-label">Date of Birth</label> <input
					type="date" class="form-control" id="birthDate" name="birthDate" value="${person.birthDate}">
			</div>

			<!-- Checkbox input -->
			<div class="form-check mb-3">
				<input class="form-check-input" type="checkbox" id="suscribe" name="suscribe" <c:if test="${person.suscribe}">checked</c:if>>
				<label class="form-check-label" for="suscribe"> Subscribe to newsletter </label>
			</div>

			<!-- Radio input -->
			<div class="mb-3">
				<label class="form-label">Gender</label><br>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" id="male" value="M" <c:if test="${person.gender eq 'M'}">checked</c:if>>
					<label class="form-check-label" for="male">Male</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" id="female" value="F" <c:if test="${person.gender eq 'F'}">checked</c:if>>
					<label class="form-check-label" for="female">Female</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" id="other" value="O" <c:if test="${person.gender eq 'O'}">checked</c:if>>
					<label class="form-check-label" for="other">Other</label>
				</div>
			</div>

			<!-- Select input -->
			<div class="mb-3">
				<label for="country" class="form-label">Country</label>
				<select class="form-select" id="country" name="country">
					<option value="US" <c:if test="${person.country eq 'US'}">selected</c:if>>United States</option>
					<option value="CA" <c:if test="${person.country eq 'CA'}">selected</c:if>>Canada</option>
					<option value="UK" <c:if test="${person.country eq 'UK'}">selected</c:if>>United Kingdom</option>
				</select>
			</div>

			<!-- Textarea input -->
			<div class="mb-3">
				<label for="address" class="form-label">Address</label>
				<textarea class="form-control" id="address" name="address" rows="3">${person.address}</textarea>
			</div>

			<!-- Submit button -->
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

	<div class="container mt-5">
		<h1>Personas Registradas</h1>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Birth Date</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Person> persons = (List<Person>) request.getAttribute("persons");

				if (persons != null) {
					for (Person person : persons) {
				%>

				<tr>
					<td><%=person.getId()%></td>
					<td><%=person.getName()%></td>
					<td><%=person.getEmail()%></td>
					<td><%=person.getPhone()%></td>
					<td><%=person.getBirthDate()%></td>
					<td><a
						href="PersonServlet?type=obtener&id=<%=person.getId()%>"
						class="btn btn-warning btn-sm">Editar</a> <a
						href="PersonServlet?type=eliminar&id=<%=person.getId()%>"
						class="btn btn-danger btn-sm"
						onclick="return confirm('¿Está seguro?')">Eliminar</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
		<a href="index.jsp" class="btn btn-primary">Añadir una nueva
			persona</a>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</body>
</html>
