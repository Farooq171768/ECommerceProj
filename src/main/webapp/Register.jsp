<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<%@ include file="components/common_css_js.jsp"  %>
<title>Register Page</title>
</head>
<body>
	 <%@ include file="components/navbar.jsp" %>
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card border-1 mt-1">
                     <div class="card-body">
                     <form action="registerServlet" method="post">
                        <h1 class="text-center">Sing-up Here!</h1>
                        <div class="mb-3">
                            <label for="name" class="form-label fw-bold">Username</label>
                            <input type="text" name="user_name" id="name" class="form-control" placeholder="Enter your name">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold">Email</label>
                            <input type="email" id="email" name="user_email" class="form-control" placeholder="Enter your email">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label fw-bold">Password</label>
                            <input type="password" id="password" name="user_password" class="form-control" placeholder="Enter your passwords">
                        </div>
                        <div class="mb-3">
                            <label for="phone_number" class="form-label fw-bold">Phonenumber</label>
                            <input type="number" id="phone_number" name="user_phonenumber" class="form-control" placeholder="Enter your Phone number">
                        </div>
                        <div class="mb-3">
                             <label for="address" class="form-label fw-bold">Address</label>
                             <textarea id="address" name="user_address" class="form-control" style="height:70px" placeholder="Enter your address"></textarea>
                        </div>
                        <div class="text-center">
                        <button type="submit" value="submit" class="btn btn-outline-success">Register</button>
                        <button type="reset" class="btn btn-outline-primary">Reset</button>
                        </div>
                     </form>
                     </div>
                </div>
            </div>
        </div>
      </div>
</body>
</html>