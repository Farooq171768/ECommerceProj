<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Listing</title>
</head>
<body>
	<h1>Product Listing</h1>
	<table border="1">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Description</th>
		<th>Price</th>
	</tr>
	 <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
            </tr>
        </c:forEach>
	</table>
</body>
</html>