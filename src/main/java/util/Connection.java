package util;

import javax.persistence.EntityManager;

public class Connection {
	public static void main(String[] args) {
		EntityManager entityManager = JPAUtil.getEntityManager();
		
		if(entityManager != null)
			System.out.println("Se realizó la conexión");
		else
			System.out.println("No se ha podido conectar");
	}
}
