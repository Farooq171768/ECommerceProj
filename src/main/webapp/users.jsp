<%@ page language="java" contentType="text/html"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="cgg.ecommerce.helpers.*, cgg.ecommerce.dao.*, cgg.ecommerce.entities.*,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="components/common_css_js.jsp"%>
<%@ page import="java.io.File.*" %>
<%@ page import="java.sql.*" %>
<meta>
<title>All Users</title>
</head>
<body>
   <%@ include file="components/navbar.jsp"%>
         <div class="row m-2 admin">
             <div class="col">
               <div class="row row-cols-1 row-cols-md-3 g-4">
                <%
                UserDao ud=new UserDao();
                  				   List<Users> ul=ud.getAllUsers();
                  				   for(Users u:ul){
                %>
                    <div class="col">
                     <div class="card h-100 dash-card">
                       <div class="card-title m-5">
                       <div class="container text-center">
                         <img src="images/user.png" class="card-img-top rounded-circle img-fluid" style="max-width:70px;max-height:60px" alt="user">
                        </div>
                       </div>
                         <div class="card-body text-center">
                            <h6 class="card-title"><b>User ID:</b> <small><%= u.getUserId() %></small></h6>
                              <h6 class="card-text"><b>Name:</b> <small><%= u.getUserName() %></small></h6>
                              <h6 class="card-text"><b>Email:</b> <small><%= u.getUserEmail() %></small></h6>
                              <h6 class="card-text"><b>Password:</b> <small><%= u.getUserPassword()%></small></h6>
                              <h6 class="card-text"><b>Phone Number:</b> <small><%= u.getUserph()%></small></h6>
                              <h6 class="card-text"><b>Address:</b> <small><%= u.getUseraddress()%></small></h6>
                              <h6 class="card-text"><b>Type:</b> <small><%= u.getUserType()%></small></h6>
                         </div>
                     </div>
                   </div>
       
              <%
  				   }
               %>
                   
                 </div>
               </div>
           </div>
</body>
</html>