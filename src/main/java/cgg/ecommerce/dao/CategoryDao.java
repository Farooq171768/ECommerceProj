package cgg.ecommerce.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import cgg.ecommerce.entities.Category;
import cgg.ecommerce.helpers.Helper;

public class CategoryDao {
	private static final SessionFactory sessionFactory=Helper.getFactory();
	
	
    public int addCategory(int categoryId,String name, String description) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            Category category = new Category(categoryId,name, description);
            int id = (int) session.save(category);
            tx.commit();
            return id;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    
    public List<Category> getAllCategories() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Category", Category.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
