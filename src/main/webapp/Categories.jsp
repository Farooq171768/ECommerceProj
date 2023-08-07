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
<title>All Categories</title>
</head>
<body>
   <%@ include file="components/navbar.jsp"%>
         <div class="row m-2 admin">
             <div class="col">
               <div class="row row-cols-1 row-cols-md-3 g-4">
                <%
                   CategoryDao cdo=new CategoryDao();
				   List<Category> clo=cdo.getAllCategories();
				   for(Category c:clo){
              %>
                    <div class="col">
                     <div class="card h-100 dash-card">
                         <div class="card-body text-center">
                            <h6 class="card-title"><b>Category Id:</b> <small><%= c.getCategoryId() %></small></h6>
                              <h6 class="card-text"><b>Category Name:</b> <small><%= c.getCategoryName() %></small></h6>
                              <h6 class="card-text"><b>Description:</b> <small><%= c.getCategoryDescription() %></small></h6>
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