package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.PersonService;
import model.Person;

public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PersonService personService = new PersonService();

	public PersonServlet() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");

		switch (type) {
		case "registrar":
			String id = request.getParameter("id");
			if (id != null && !id.isEmpty()) {
				editarPersona(request, response);
			} else {
				crearPersona(request, response);
			}
			break;
		case "listar":
			listarPersona(request, response);
			break;
		case "obtener":
			obtenerPersona(request, response);
			break;
		case "eliminar":
			eliminarPersona(request, response);
			break;
		default:
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no reconocida");
			break;
		}
	}

	private void eliminarPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		personService.delete(Long.parseLong(id));
		request.setAttribute("Se elimino", "eliminado");
		listarPersona(request, response);
	}

	private void obtenerPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		Person person = personService.find(Long.parseLong(id));

		if (person != null) {
			request.setAttribute("person", person);
			listarPersona(request, response);
		} else {
			request.getRequestDispatcher("Error.jsp").forward(request, response);
		}
	}

	private void listarPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Person> persons = personService.list();
		request.setAttribute("persons", persons);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void crearPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Person person = extractUserFromRequest(request);
		Long personId = personService.add(person);
		System.out.println(personId);
		if (personId != null) {
			request.setAttribute("message", "Person created successfully with ID: " + personId);
		} else {
			request.setAttribute("message", "Error creating person.");
		}
		listarPersona(request, response);
	}

	private void editarPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Person person = extractUserFromRequest(request);
		Long id = Long.parseLong(request.getParameter("id"));
		person.setId(id);
		Person updated = personService.update(person);
		System.out.println(updated);
		if (updated != null) {
			request.setAttribute("message", "Person was updated successfully with ID: " + updated.getId());
		} else {
			request.setAttribute("message", "Error creating person.");
		}
		listarPersona(request, response);
	}

	private Person extractUserFromRequest(HttpServletRequest request) {
		Person person = new Person();
		person.setName(request.getParameter("name"));
		person.setPassword(request.getParameter("password"));
		person.setPhone(request.getParameter("phone"));
		person.setEmail(request.getParameter("email"));
		person.setBirthDate(LocalDate.parse(request.getParameter("birthDate"), DateTimeFormatter.ISO_DATE));
		if(request.getParameter("suscribe") != null) {
			person.setSuscribe(true);
		}else {
			person.setSuscribe(false);
		}
		//person.setSuscribe(Boolean.parseBoolean(request.getParameter("suscribe")));
		person.setGender(request.getParameter("gender"));
		person.setCountry(request.getParameter("country"));
		person.setAddress(request.getParameter("address"));
		return person;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
