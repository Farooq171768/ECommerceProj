package cgg.ecommerce.helpers;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Helper {
	private static SessionFactory factory;
	
	public static Session getSession() {
		try {
			if(factory==null) {
				factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return factory.openSession();
	}

}
