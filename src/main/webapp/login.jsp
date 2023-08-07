<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
String a = (String) session.getAttribute("a");
String logout = (String) session.getAttribute("logout");
%>
<!DOCTYPE html>
<html>
<head>
<meta>
<%@ include file="/components/common_css_js.jsp"%>
<title>Login Page</title>
</head>
<body>
	<%@ include file="/components/navbar.jsp"%>
	<div class="container-xxl">
		<%
		if (a == "true") {
		%>
		<div
			class="alert alert-success alert-dismissible fade show text-center"
			role="alert">
			<strong><%=logout%></strong>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		}
		session.removeAttribute("logout");
		session.removeAttribute("a");
		%>

		<div class="row justify-content-center " id="card">
			<div class="col-lg-4">
				<div class="card mt-5 me-5">
					<%@ include file="components/message.jsp"%>
					<div class="card-body py-3">
						<div class="card-title fw-bold text-center">LOGIN</div>
						<form action="loginServlet" method="post">
							<div class="input-group mb-3">
								<span class="input-group-text bg-white border-0"> <i
									class="bi bi-person"></i>
								</span> <input type="email" name="useremail" placeholder="Email Id"
									class="border-0">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text bg-white border-0"> <i
									class="bi bi-key-fill"></i>
								</span> <input type="password" name="userpassword"
									placeholder="Password" class="border-0">
							</div>
							<div class="fw-bold text-end">
								<a href="#" class="text-danger">Forgot Password?</a>
							</div>
							<div class="text-center">
								<button class="btn btn-danger rounded-pill width:100px"
									type="submit">Login</button>
							</div>
							<div class="text-center mt-4">
								Did't have an account? <a href="Register.jsp">Register here</a>
							</div>
						</form>
					</div>
				</div>
				<div class="p-1 me-5 rounded-bottom shadow bg-success"></div>
			</div>
		</div>
	</div>
</body>
</html>