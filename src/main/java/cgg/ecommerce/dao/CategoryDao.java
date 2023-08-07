package cgg.ecommerce.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import cgg.ecommerce.entities.Category;
import cgg.ecommerce.helpers.Helper;

public class CategoryDao {
	
    public int addCategory(String name, String description) {
        try (Session session = Helper.getSession()) {
            Transaction tx = session.beginTransaction();
            Category category = new Category(name, description);
            int id = (int) session.save(category);
            tx.commit();
            return id;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    
    public List<Category> getAllCategories() {
        try (Session session = Helper.getSession()) {
            return session.createQuery("from Category", Category.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
