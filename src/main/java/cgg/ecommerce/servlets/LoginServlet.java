package cgg.ecommerce.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import cgg.ecommerce.dao.UserDao;
import cgg.ecommerce.entities.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String email =request.getParameter("useremail");
	    String password = request.getParameter("userpassword");
	    
		UserDao userDao = new UserDao();
		User u=userDao.getUser(email, password);
		
		if(u==null) {
			HttpSession session = request.getSession();
			session.setAttribute("message", "Please enter valid credentials");
			response.sendRedirect("login.jsp");
		}
		else {
			HttpSession  session=request.getSession();
		    session.setAttribute("current_user","Youre logged in");
				    
				     if(u.getUserType().equals("admin")){
                     session.setAttribute("current_user","admin");
                     session.setAttribute("username",u.getUserName());
                     session.setAttribute("message","Dear admin you are logged in successfully.Welcome to our website");
                     response.sendRedirect("admin.jsp");
				     }else if(u.getUserType().equals("normal")){
				    	 session.setAttribute("current_user","normal");
				    	 session.setAttribute("username",u.getUserName());
	                     session.setAttribute("message",u.getUserName()+" you are logged in successfully.Welcome to our website");
	                     response.sendRedirect("index.jsp");
				     }else {
				    	 out.println("<h1>Not a valid user id</h1>"); 
				     }
		}
		
	}

}
