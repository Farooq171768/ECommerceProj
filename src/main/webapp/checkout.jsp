<%@ page language="java" contentType="text/html"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="cgg.ecommerce.dao.UserDao,cgg.ecommerce.entities.Users" %>
<%
String user = (String) session.getAttribute("current_user");

if (user == null) {
	session.setAttribute("message", "Youre not logged in ,Log in first");
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta>
<%@ include file="components/common_css_js.jsp"%>
<title>CheckOut Page</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- cart -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your Selected Items</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- form details -->
				<%
				String username = (String) session.getAttribute("username");
				UserDao ud = new UserDao();
				Users ul = ud.getCurrentUser(username);
				%>
				<form action="orderSuccess.jsp" id="far">
					<div class="mb-3">
						<label for="email" class="form-label">Your Email</label> <input
							type="text" value="<%=ul.getUserEmail()%>" class="form-control"
							id="email" placeholder="Enter Your Email Here">
					</div>
					<div class="mb-3">
						<label for="name" class="form-label">Your Name</label> <input
							type="text" value="<%=ul.getUserName()%>" class="form-control"
							id="name" placeholder="Enter Your Name Here">
					</div>
					<div class="mb-3">
						<label for="phone" class="form-label">Your Contact Number</label>
						<input type="number" value="<%=ul.getUserph()%>"
							class="form-control" id="phone"
							placeholder="Enter Your Contact number Here">
					</div>
					<!-- //has to be text area -->
					<div class="mb-3">
						<label for="floatingTextArea">Your Shipping address
							Address</label>
						<textarea id="floatingTextArea" value="<%=ul.getUseraddress()%>"
							class="form-control" placeholder="Enter your Address here"></textarea>
					</div>
					<div class="text-center">
						<button class="btn btn-outline-success text-center" type="button" onclick="remove()">Order Now</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>