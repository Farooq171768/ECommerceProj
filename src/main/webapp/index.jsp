<html>
<head>
<%@ include file="components/common_css_js.jsp"%>
<%@ page import="cgg.ecommerce.helpers.*, cgg.ecommerce.dao.CategoryDao,cgg.ecommerce.dao.ProductDao, cgg.ecommerce.entities.*,java.util.List" %>
<%@ page import="java.io.File.*" %>
<title>Home</title>
</head>
<body>
<%@ include file="/components/navbar.jsp" %>
<%@ include file="components/message.jsp" %>
  <div class="container-fluid"> 
         <div class="row mt-4">
         <div class="col-md-2">
             <div class="list-group " id="it">
             <a href="index.jsp?category=all" class="list-group-item active" aria-current="true">All Products</a>
               <% 
				   CategoryDao cd2=new CategoryDao();
				   List<Category> cl2=cd2.getAllCategories();
				   for(Category c:cl2){
					   
              %>
              <a class="list-group-item" href="index.jsp?category=<%= c.getCategoryName()%>" class="">
              <%= c.getCategoryName()%>
              </a>
              <% 
				   }
               %>
             </div>
         </div>
              <div class="col-md-10">
               <div class="row row-cols-1 row-cols-md-3 g-4">
                <% 
                      String cat=(String)request.getParameter("category");
                      ProductDao pd=new ProductDao();
                      List<Products> listprod=null;
                      if(cat==null || cat.trim().equals("all")){
                    	  listprod= pd.getAllProducts();}
                      else{
                    	 listprod= pd.getProductByName(cat.trim());
                      }
                      
                      for(Products p:listprod){	  
              %>
                    <div class="col admin">
                     <div class="card h-100 dash-card">
                        <div class="text-center">
                         <img src="images/products/<%=p.getProductPic() %>" style="max-width:200px;max-height:200px" class="card-img-top" alt="<%= p.getProductPic() %>">
                        </div>
                         <div class="card-body">
                            <h4 class="card-title"><%= p.getProductName() %></h4>
                              <h5 class="card-text">Price: &#8377;<%=p.getPriceAfterApplyingDiscount()%>/- <span class="discount">
                               &#8377;<%=p.getProductPrice() %>
                              </span>
                              <span class="discount1">
                               (<%=p.getProductDiscount()%>% off)
                              </span></h5>
                              <p class="card-text"><%=DescriptionHelper.getDescription(p.getProductDescription()) %></p>
                         </div>
                         <div class="card-footer text-center">
                           <button class="btn btn-success btn-outline-warning" onClick="add_to_cart(<%=p.getProductId()%>,'<%= p.getProductName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add to cart</button>
                         </div>
                     </div>
                   </div>
       
              <%
                      }
                      if(listprod.size()==0){
                    	  out.println(" <h3>No item available </h3> ");
                      }
              %>
                 
                 </div>
               </div>
           </div>
   </div>  
</body>
</html>
