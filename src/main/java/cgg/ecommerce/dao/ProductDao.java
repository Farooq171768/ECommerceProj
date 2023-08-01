package cgg.ecommerce.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import cgg.ecommerce.entities.Products;
import cgg.ecommerce.helpers.Helper;

public class ProductDao {
	
	private static final SessionFactory sessionFactory=Helper.getFactory();
	
	
	 public int addProduct(int pId,String pname, String pdescription, int pprice, int pdiscount, int pquantity, String pCategory, String pimage) {
	        try (Session session = sessionFactory.openSession()) {
	            Transaction tx = session.beginTransaction();
	            Products product = new Products(pId,pname, pdescription, pprice, pdiscount, pquantity, pCategory, pimage);
	            int id = (int) session.save(product);
	            tx.commit();
	            return id;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }
	 
	 public List<Products> getAllProducts() {
	        try (Session session = sessionFactory.openSession()) {
	            return session.createQuery("from Products", Products.class).list();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	 public List<Products> getProductByName(String name) {
	        try (Session session = sessionFactory.openSession()) {
	            return session.createQuery("from Products where productCategory = :name", Products.class)
	                    .setParameter("name", name)
	                    .list();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

}
