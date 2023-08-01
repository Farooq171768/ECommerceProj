package cgg.ecommerce.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import cgg.ecommerce.entities.User;
import cgg.ecommerce.helpers.Helper;

public class UserDao {
	 private static final SessionFactory sessionFactory=Helper.getFactory();
	  
	 
	 
	  public int addUser(String userName, String userEmail, String userPassword, String userph, String useraddress,String userType) {
	        try (Session session = sessionFactory.openSession()) {
	            Transaction tx = session.beginTransaction();
	            User user = new User(userName, userEmail, userPassword, userph, useraddress, userType);
	            int id = (int) session.save(user);
	            tx.commit();
	            return id;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }
	  
	  public List<User> getAllUsers() {
	        try (Session session = sessionFactory.openSession()) {
	            return session.createQuery("from User", User.class).list();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	  
	  public User getUser(String email, String password) {
	        try (Session session = sessionFactory.openSession()) {
	            return session.createQuery("from User where userEmail = :email and userPassword = :password", User.class)
	                    .setParameter("email", email)
	                    .setParameter("password", password)
	                    .uniqueResult();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	  
	  public User getCurrentUser(String username) {
	        try (Session session = sessionFactory.openSession()) {
	            return session.createQuery("from User where userName = :username", User.class)
	                    .setParameter("username", username)
	                    .uniqueResult();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

}
