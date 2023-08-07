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
<title>All Products</title>
</head>
<body>
   <%@ include file="components/navbar.jsp"%>
         <div class="row m-2 admin">
             <div class="col">
               <div class="row row-cols-1 row-cols-md-3 g-4">
                <%
                   ProductDao pd=new ProductDao();
				   List<Products> pl=pd.getAllProducts();
				   for(Products c:pl){
                %>
                    <div class="col">
                     <div class="card h-100 dash-card">
                       <div class="card-title m-5">
                       <div class="container text-center">
                         <img src="images/products/<%= c.getProductPic() %>" class="card-img-top" style="max-width:200px;max-height:200px" alt="<%= c.getProductPic() %>">
                        </div>
                       </div>
                         <div class="card-body text-center">
                            <h6 class="card-title"><b>Product Id: </b> <small><%= c.getProductId() %></small></h6>
                              <h6 class="card-text"><b>Name: </b> <small><%= c.getProductName() %></small></h6>
                              <h6 class="card-text"><b>Description: </b><small><%= c.getProductDescription()%>/-</small></h6>
                              <h6 class="card-text"><b>Price: </b><small> &#8377;<%= c.getProductPrice()%></small></h6>
                              <h6 class="card-text"><b>Discount: </b><small> &#8377;<%= c.getProductDiscount() %></small></h6>
                              <h6 class="card-text"><b>Quantity: </b> <small><%= c.getProductQuantity() %></small></h6>
                              <h6 class="card-text"><b>Category: </b><small><%=  c.getProductCategory()%></small></h6>
                         </div>
                     </div>
                   </div>
       
              <% }
        
               %>
                 
                 </div>
               </div>
           </div>
</body>
</html>