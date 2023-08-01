<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String currentuser=(String)session.getAttribute("current_user");
    %>
    <%@ include file="common_css_js.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%@ include file="common_modals.jsp" %> --%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary text-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">My Cart</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu">
             <%-- <% 
				    CategoryDao cd1=new CategoryDao();
				   List<Category> cl1=cd1.getAllCategories();
				   for(Category c:cl1){
					   
              %> --%>
              <%-- <li class="dropdown-menu-item m-2 ms-4">
              <a href="index.jsp?category=<%= c.getCategoryName()%>"><%= c.getCategoryName()%></a>
              </li> --%>
              <%-- <% 
				   }
               %> --%>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav justify-content-right">
        <li class="nav-item">
        <a class="nav-link btn" href="" data-bs-toggle="modal" data-bs-target="#cart" aria-current="page"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="ml-2 cart-items"></span></a>
        </li>
      <% 
      if(currentuser==null)
      {
      %>
          <li class="nav-item"><a class="btn btn-outline-success text-white" href="login.jsp">Login</a></li>
          <li class="nav-item"><a class="btn btn-outline-danger text-white" href="Register.jsp">Register</a></li>
          </ul>
          <%}
      else{
    	 /*  String username=(String)session.getAttribute("username");
    	  UserDao ud1=new UserDao();
    	  User user1=ud1.getCurrentUser(username); */
    	  %>
    	  <ul class="navbar-nav justify-content-right">
          <%-- <li class="nav-item"><a class="btn btn-outline-success" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"index.jsp"%>"><%=username %></a></li> --%>
          <li class="nav-item"><a class="btn btn-outline-danger" href="logoutServlet">Logout</a></li>
          </ul>
    	  <% 
      }
          %>
    </div>
  </div>
</nav>
</body>
</html>