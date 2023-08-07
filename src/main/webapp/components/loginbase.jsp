<%@ page language="java" contentType="text/html"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta >
<%@ include file="common_css_js.jsp"  %>
<title>Login page</title>
</head>
<body>
    <div class="container-xxl">
         <div class="row justify-content-center " id="card">
             <div class="col-lg-4">
                <div class="card mt-5 me-5">
                      <div class="card-body py-3">
                          <div class="card-title fw-bold text-center">
                            LOGIN
                          </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text bg-white border-0">
                                    <i class="bi bi-person"></i>
                                </span>
                                <input type="text" name="userid" placeholder="User Id" class="border-0">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text bg-white border-0">
                                    <i class="bi bi-key-fill"></i>
                                </span>
                                <input type="password" name="userpassword" placeholder="Password" class="border-0">
                            </div>
                            <div class="fw-bold text-end">
                              <a href="#" class="text-danger">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                 <a href="#" class="btn btn-danger rounded-pill">Login</a>
                            </div>
                            <div class="text-center mt-4">
                                Did't have an account? <a href="Register.jsp">Register here</a>
                            </div>
                      </div>
                </div>
                <div class="p-1 me-5 rounded-bottom shadow bg-danger"></div>
             </div>
         </div>
      </div>
</body>
</html>