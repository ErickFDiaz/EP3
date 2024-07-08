<%@page import="model.Person"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Person List</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

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
				List<Person> persons = (List<Person>)request.getAttribute("persons");
			
				if(persons != null){
					for(Person person: persons){
			%>
				
					<tr>
						<td><%=person.getId()%></td>
						<td><%=person.getName()%></td>
						<td><%=person.getEmail()%></td>
						<td><%=person.getPhone()%></td>
						<td><%=person.getBirthDate()%></td>
						<td>
							<a href="PersonServlet?type=obtener&id=<%=person.getId()%>" class="btn btn-warning btn-sm">Editar</a>
							<a href="PersonaServlet?type=eliminar&id=<%=person.getId()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Está seguro?')">Eliminar</a>
						</td>
					</tr>
				<%	
					}
				} 
			%>
			</tbody>
		</table>
		<a href="index.jsp" class="btn btn-primary">Añadir una nueva persona</a>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</body>
</html>