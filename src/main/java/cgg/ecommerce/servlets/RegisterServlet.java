package cgg.ecommerce.servlets;

import java.io.IOException;
import cgg.ecommerce.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 resp.setContentType("text/html");
		 //PrintWriter out = resp.getWriter();
		 
		 String name = req.getParameter("user_name");
		 String email = req.getParameter("user_email");
		 String password = req.getParameter("user_password");
		 String phno = req.getParameter("user_phonenumber");
		 String address = req.getParameter("user_address");
		 
		 String userType="admin";
		
		 
		 UserDao userDao = new UserDao();
		 
		 try {
				int c=userDao.addUser(name, email, password, phno, address,userType);
				System.out.println(c+" row(s) are inserted");
			    HttpSession session = req.getSession();
			    session.setAttribute("message", name+" You have registered successfully");
			    resp.sendRedirect("login.jsp");
			  } catch (Exception e) {
				e.printStackTrace();
			  }	
	}

}
