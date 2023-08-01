<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>   
 <%@ page import="cgg.ecommerce.helpers.*, cgg.ecommerce.dao.CategoryDao,cgg.ecommerce.dao.UserDao,cgg.ecommerce.dao.ProductDao, cgg.ecommerce.entities.*,java.util.List" %>
 <%     String user=(String)session.getAttribute("current_user");
       if(user==null){
    	   session.setAttribute("message","Youre not logged in login first");
    	   response.sendRedirect("login.jsp");
    	   return;
       }else if(user.equals("normal")){
    	   session.setAttribute("message","Youre not an admin,You can't access this page");
    	   response.sendRedirect("login.jsp");
    	   return;
       }
       %>
<!DOCTYPE html>
<html>
<head>
<meta >
<%@ include file="components/common_css_js.jsp"  %>
<title>Admin</title>
</head>
<body>
	<%@ include file="components/navbar.jsp" %>
    <div class="container admin">
    <div class="container-fluid mt-3">
       <%@ include file="components/message.jsp" %>
    </div>
        <div class="row mt-4">
           <div class="col-md-4">
                <div class="card dash-card">
                  <div class="card-title m-5">
                    <div class="container text-center">
                       <img style="max-width:70px;max-height:60px" class="rounded-circle img-fluid" src="images/users.png" alt="users">
                   </div>
                   </div>
                   <div class="card-body text-center">
                        <h2><a href="users.jsp">Users</a></h2>
              <% 
			    	UserDao ud=new UserDao();
                    List<User> ul=ud.getAllUsers();
                    int i=ul.size();
                    /* int i=0;
                    for(User c:ul){
                    	i++;
                    } */
              %>
                    <h2><a href="users.jsp"><%= i %></a></h2>
              <% 
               %>
                   </div>
                </div>
           </div>
           <div class="col-md-4 mb-3">
                <div class="card dash-card">
                   <div class="card-title m-5">
                     <div class="container text-center rouded-circle img-fluid">
                       <img style=" max-width:70px;max-height:60px" class=" img-fluid" src="images/lists.png" alt="categories">
                   </div>
                   </div>
                  <div class="card-body text-center">
                        <h2><a href="Categories.jsp">Categories</a></h2>
               <% 
				CategoryDao cd=new CategoryDao();
			    List<Category> cl=cd.getAllCategories();
			    int j=cl.size();
              %>
                    <h2><a href="Categories.jsp"><%=j %></a></h2>
                   </div>
                </div>
           </div>
           <div class="col-md-4 mb-3">
                <div class="card dash-card ">
                  <div class="card-title m-5">
                       <div class="container text-center rouded-circle img-fluid">
                       <img style=" max-width:70px;max-height:60px" class="rounded-circle img-fluid" src="images/products.png" alt="products">
                   </div>
                   </div>
                   <div class="card-body text-center">
                        <h2><a href="products.jsp">Products</a></h2>
              <% 
                ProductDao pd= new ProductDao();
                List<Products> pl=pd.getAllProducts();
                int k=pl.size();
              %>
                    <h2><a href="products.jsp"><%= k %></a></h2>
                   </div>
                </div>
           </div>
        </div>
         <div class="row mt-4">
         <div class="col-md-4 mb-3">
               <div class="card dash-card" data-bs-toggle="modal" data-bs-target="#modal3">
                  <div class="card-title m-5">
                    <div class="container text-center rouded-circle img-fluid">
                       <img  style=" max-width:70px;max-height:60px" class="img-fluid" src="images/add_users.png" alt="Add_categories">
                   </div>
                   </div>
                   <div class="card-body text-center">
                       <h1>Add Users</h1>
                       <h5>Click here to add users</h5>
                   </div>
                </div>
           </div>
         <div class="col-md-4 mb-3">
               <div class="card dash-card" data-bs-toggle="modal" data-bs-target="#modal1">
                  <div class="card-title m-5">
                    <div class="container text-center rouded-circle img-fluid">
                       <img  style=" max-width:70px;max-height:60px" class="img-fluid" src="images/add_categories.png" alt="Add_categories">
                   </div>
                   </div>
                   <div class="card-body text-center">
                       <h1>Add Categories</h1>
                       <h5>Click here to add categories</h5>
                   </div>
                </div>
           </div>
           <div class="col-md-4 mb-3">
               <div class="card dash-card "  data-bs-toggle="modal" data-bs-target="#modal2">
                    <div class="card-title m-5">
                    <div class="container text-center rouded-circle">
                       <img  style=" max-width:70px;max-height:60px" class="rounded-circle img-fluid" src="images/plus.png" alt="add products">
                   </div>
                   </div>
                   <div class="card-body text-center">
                      <h1>Add Products</h1>
                      <h5>Click here to add products</h5>
                   </div>
                </div>
           </div>
        </div>
    </div>
    
    <!-- modal -->
    <div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="modalLable">Fill Category Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="addUserServlet" method="post">
           <div class="form-group">
            <input type="hidden" name="operation" value="addcategory">
              <input type="text" class="form-control" name="category_name" placeholder="Enter Category name here" required>
           </div>
           <div class="form-group">
              <textarea style="height:200px" class="form-control mt-4 mb-2" placeholder="Enter Category description" name="category_description" required></textarea>
           </div>
           <div class="form-group text-center">
           <button type="submit" class="btn btn-success">Submit</button>
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
           </div>
        </form>
      </div>
    </div>
  </div>
</div>

      <div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="modalLabel1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="modalLable1">Fill Products Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <!-- whenever we deal with files we shoyd use enctype="multipart/form-data" -->
        <form action="addUserServlet" method="post" enctype="multipart/form-data">
          <div class="form-group">
               <input type="hidden" name="operation" value="addproduct">
             <input type="text" class="form-control" placeholder="Enter product title here" name="product_name" required>
          </div>
          <div class="form-group">
             <textarea style="height:200px" class="form-control mt-4 mb-4" name="product_description" placeholder="Enter product description here" required></textarea>
          </div>
          <div class="form-group">
             <input type="number" class="form-control mt-4 mb-4" placeholder="Enter product price here" name="product_price" required>
          </div>
          <div class="form-group">
             <input type="number" class="form-control mt-4 mb-4" placeholder="Enter product discount in percentile here" name="product_discount" required>
          </div>
          <div class="form-group">
             <input type="number" class="form-control mt-4 mb-4" placeholder="Enter product Quantity here" name="product_quantity" required>
          </div>
          <div class="form-group">
          <label for="pr_ca">Choose product category</label>
            <select name="product_category" id="pr_ca">
              <% 
                CategoryDao cd3=new CategoryDao();
			    List<Category> cl3=cd3.getAllCategories();
        		for(Category cr:cl3){  
              %>
                    <option value='<%= cr.getCategoryName() %>'><%= cr.getCategoryName() %></option>
              <% }
               %>
             </select>
          </div>
          
          <div class="form-group">
              <label for="image" class="form-label fw-bold mt-4 mb-4">Upload Product image</label>
              <input type="file" id="image" name="product_image"class="form-control">
          </div>
          <div class="form-group text-center mt-3">
          <button type="submit" class="btn btn-success">Submit</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

    <div class="modal fade" id="modal3" tabindex="-1" aria-labelledby="modalLabel2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="modalLable2">Fill Users details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="addUserServlet" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label fw-bold">Enter Username</label>
                            <input type="hidden" name="operation" value="adduser">
                            <input type="text" name="user_name" id="name" class="form-control" placeholder="Enter user name here">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold">Enter Email</label>
                            <input type="email" id="email" name="user_email" class="form-control" placeholder="Enter your email here">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label fw-bold">Enter Password</label>
                            <input type="password" id="password" name="user_password" class="form-control" placeholder="Enter your passwords here">
                        </div>
                        <div class="mb-3">
                            <label for="phone_number" class="form-label fw-bold">Enter Phonenumber</label>
                            <input type="number" id="phone_number" name="user_phonenumber" class="form-control" placeholder="Enter your Phone number here">
                        </div>
                        <div class="mb-3">
                             <label for="address" class="form-label fw-bold">Enter Address</label>
                             <textarea id="address" name="user_address" class="form-control" style="height:70px" placeholder="Enter your address here"></textarea>
                        </div>
                        <div class="text-center">
                        <button type="submit" value="submit" class="btn btn-outline-success">Submit</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                     </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>