package cgg.ecommerce.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import cgg.ecommerce.entities.Users;
import cgg.ecommerce.helpers.Helper;

public class UserDao {

	  public int addUser(String userName, String userEmail, String userPassword, String userph, String useraddress,String userType) {
	        try (Session session = Helper.getSession()) {
	            Transaction tx = session.beginTransaction();
	            Users user = new Users(userName, userEmail, userPassword, userph, useraddress, userType);
	            int id = (int) session.save(user);
	            tx.commit();
	            return id;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }
	  
	  public List<Users> getAllUsers() {
	        try (Session session = Helper.getSession()) {
	            return session.createQuery("from Users", Users.class).list();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	  
	  public Users getUser(String email, String password) {
	        try (Session session = Helper.getSession()) {
	            return session.createQuery("from Users where userEmail = :email and userPassword = :password", Users.class)
	                    .setParameter("email", email)
	                    .setParameter("password", password)
	                    .uniqueResult();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	  
	  public Users getCurrentUser(String username) {
	        try (Session session = Helper.getSession()) {
	            return session.createQuery("from Users where userName = :username", Users.class)
	                    .setParameter("username", username)
	                    .uniqueResult();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

}
