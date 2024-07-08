package service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import model.Person;
import util.JPAUtil;

public class PersonService {
	EntityManager entityManager = JPAUtil.getEntityManager();

	public Long add(Person p) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(p);
			entityManager.getTransaction().commit();
			return p.getId();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public Person update(Person p) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(p);
			entityManager.getTransaction().commit();
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Person find(long id) {
		try {
			Person p = entityManager.find(Person.class, id);
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void delete(long id) {
		try {
			Person p = entityManager.find(Person.class, id);
			entityManager.getTransaction().begin();
			entityManager.remove(p);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Person> list() {
		try {
			List<Person> people = new ArrayList<>();
			Query q = entityManager.createQuery("Select p from Person p");
			people = q.getResultList();
			return people;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}