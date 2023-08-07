package cgg.ecommerce.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import cgg.ecommerce.dao.CategoryDao;
import cgg.ecommerce.dao.ProductDao;
import cgg.ecommerce.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    @SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/html");
		String op = req.getParameter("operation");
		
		if(op.trim().equals("adduser")) {
			 
		    String name = req.getParameter("user_name");
		    String email = req.getParameter("user_email");
		    String password = req.getParameter("user_password");
		    String phno = req.getParameter("user_phonenumber");
		    String address = req.getParameter("user_address");
		    
		    String userType = "normal";
		    
		    UserDao userDao = new UserDao();
		    int co;
			try {
				co = userDao.addUser(name, email, password, phno, address,userType);
				System.out.println(co+" row(s) are inserted");
			    if(co>0) {
			    HttpSession session = req.getSession();
			    session.setAttribute("message","User"+ name+" added successfully");
			    resp.sendRedirect("admin.jsp");
			    }else {
			    	HttpSession session = req.getSession();
				    session.setAttribute("message","Something went wrong try again");
				    resp.sendRedirect("admin.jsp");
			    }
			} catch (Exception e) {
				e.printStackTrace();
			}
		   
		}
		else if(op.trim().equals("addcategory")) {
			String cname = req.getParameter("category_name");
			String cdescription = req.getParameter("category_description");
			
			CategoryDao categoryDao = new CategoryDao();
			    
			    int count;
				try {
					count = categoryDao.addCategory(cname, cdescription);
					 if(count>0) {
						    HttpSession session = req.getSession();
						    session.setAttribute("message","Category "+cname+" added successfully");
						    resp.sendRedirect("admin.jsp");
		                    }else {
		                    	 HttpSession session = req.getSession();
		     				    session.setAttribute("message","Something went wrong try again");
		     				    resp.sendRedirect("admin.jsp");
		                    }
				} catch (Exception e) {
					e.printStackTrace();
				}
	 		
		}
		else if(op.trim().equals("addproduct")){
			
			String pname = req.getParameter("product_name");
			String pdescription = req.getParameter("product_description");
            int pprice = Integer.parseInt(req.getParameter("product_price"));
			int pdiscount = Integer.parseInt(req.getParameter("product_discount"));
			int pquantity = Integer.parseInt(req.getParameter("product_quantity"));
			String pcategory = req.getParameter("product_category");
			Part part = req.getPart("product_image");
		
			    //uploading image
			    //get the path of the folder
				String path = req.getServletContext().getRealPath("images") + File.separator + "products" + File.separator + part.getSubmittedFileName();
			    //file upload code
			    FileOutputStream fos=new FileOutputStream(path);
			    //reading image file
			    InputStream is = part.getInputStream();
			    byte [] data=new byte[is.available()];
			    is.read(data);
			    //write image file
			    fos.write(data);
			    fos.close();
			    is.close();
			    
			    ProductDao pd=new ProductDao();
	     	    int count;
				try {
					count = pd.addProduct(pname, pdescription, pprice, pdiscount, pquantity, pcategory, part.getSubmittedFileName());
					if(count>0) {
					    HttpSession session = req.getSession();
					    session.setAttribute("message","Product "+pname+" added successfully");
					    resp.sendRedirect("admin.jsp");
					    }else {
					    	HttpSession session = req.getSession();
					    	session.setAttribute("message","Something went wrong try again");
						    resp.sendRedirect("admin.jsp");	
					    }
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
	}

}
