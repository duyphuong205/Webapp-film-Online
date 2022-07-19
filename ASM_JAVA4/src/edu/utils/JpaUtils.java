package edu.utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
	public static EntityManager getEntityManager() {
		EntityManagerFactory fac = Persistence.createEntityManagerFactory("ASM_JAVA4");
		return fac.createEntityManager();
	}
}
