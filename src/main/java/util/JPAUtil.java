package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtil {
	private static final String PERSISTANCE_UNIT_NAME = "PERSISTANCE";
	
	private static EntityManagerFactory factory;
	
	static {
		try {
			factory = Persistence.createEntityManagerFactory(PERSISTANCE_UNIT_NAME);
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Error al inicializar el entity manager");
		}
	}
	
	public static EntityManager getEntityManager() {
		return factory.createEntityManager();
	}
	
	public static void close() {
		if(factory!= null)
			factory.close();
	}

}
