<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, model.Category, model.Product"%>

<!DOCTYPE html>
<html>
<head>
<title>Grocery Store | Home</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

	<!-- Navbar -->
	<%@ include file="/user/navbar.jsp"%>

	<!-- Hero -->
	<section class="bg-white py-20 text-center">
		<h1 class="text-4xl font-bold text-gray-800">Fresh Groceries
			Delivered to Your Door</h1>
		<p class="mt-4 text-gray-600">Fruits, vegetables, dairy & more</p>
	</section>

	<!-- Categories -->
	<section class="max-w-7xl mx-auto py-12 px-6">
		<h2 class="text-2xl font-semibold mb-6">Shop by Category</h2>

		<div class="grid grid-cols-2 md:grid-cols-4 gap-6">
			<%
List<Category> categories =
    (List<Category>) request.getAttribute("categories");

if (categories != null && !categories.isEmpty()) {
    for (Category c : categories) {
%>

			<a
				href="<%=request.getContextPath()%>/ProductsByCategory?cid=<%=c.getCid()%>"
				class="bg-white shadow rounded-lg p-6 text-center hover:shadow-lg transition">

				<img
				src="<%=request.getContextPath()%>/uploads/categories/<%=c.getImage()%>"
				class="h-20 mx-auto mb-3 object-contain">

				<h3 class="font-semibold">
					<%=c.getCname()%></h3>
			</a>

			<% 
    }
} else {
%>
			<p class="text-gray-500 col-span-full text-center">No categories
				available</p>
			<%
}
%>

		</div>
	</section>

	<!-- Featured Products -->
	<section class="max-w-7xl mx-auto py-12 px-6">
		<h2 class="text-2xl font-semibold mb-6">Featured Products</h2>

		<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
			<%
List<Product> products =
    (List<Product>) request.getAttribute("featuredProducts");

if (products != null && !products.isEmpty()) {
    for (Product p : products) {
%>

			<div class="bg-white shadow rounded-lg p-4">
				<img
					src="<%=request.getContextPath()%>/uploads/products/<%=p.getImage()%>"
					class="h-40 w-full object-contain mb-3">

				<h3 class="text-lg font-semibold text-gray-800">
					<a
						href="<%=request.getContextPath()%>/ProductDetailsServlet?id=<%=p.getPid()%>"
						class="font-medium text-indigo-600 hover:underline"> <%= p.getPname() %></a>
				</h3>
				<p class="text-sm text-gray-500">
					₹
					<%=p.getPrice()%></p>
				<p class="text-gray-500 text-sm mt-1">
					Quantity :
					<%= p.getQuantity() %></p>

				<a
					href="<%=request.getContextPath()%>/AddToCartServlet?pid=<%=p.getPid()%>"
					class="mt-2 inline-block px-4 py-2 bg-indigo-500 text-white rounded hover:bg-indigo-600">
					Add to Cart </a>
			</div>

			<%
    }
} else {
%>
			<p class="text-gray-500 text-center col-span-full">No featured
				products available</p>
			<%
}
%>

		</div>
	</section>

	<!-- Footer -->
	<footer class="bg-white text-center py-6 text-gray-500 text-sm">
		© 2026 Grocery Store. All rights reserved. </footer>

</body>
</html>
