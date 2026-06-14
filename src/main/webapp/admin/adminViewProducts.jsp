<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Product"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Products</title>
<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
	<!-- NAVBAR -->
	<%@ include file="admin-navbar.jsp"%>

	<div class="max-w-6xl mx-auto px-4 py-8">

		<h2 class="text-3xl font-bold mb-6">Available Products</h2>

		<div class="overflow-x-auto">
			<table class="min-w-full bg-white rounded-lg shadow overflow-hidden">
				<thead class="bg-gray-200 text-gray-700">
					<tr>
						<th class="py-3 px-4 text-left">Name</th>
						<th class="py-3 px-4 text-left">Price</th>
						<th class="py-3 px-4 text-left">Quantity</th>
						<th class="py-3 px-4 text-left">Image</th>
						<th class="py-3 px-4 text-left">Action</th>
					</tr>
				</thead>
				<tbody class="divide-y divide-gray-200">
					<%
					List<Product> products = (List<Product>) request.getAttribute("products");

					if (products != null && !products.isEmpty()) {
						for (Product p : products) {
					%>
					<tr class="hover:bg-gray-50">
						<td class="py-3 px-4"><%=p.getPname()%></td>
						<td class="py-3 px-4">₹ <%=p.getPrice()%></td>
						<td class="py-3 px-4"><%=p.getQuantity()%></td>
						<td class="py-3 px-4">
							<%
							if (p.getImage() != null && !p.getImage().isEmpty()) {
							%> <img
							src="<%=request.getContextPath()%>/uploads/products/<%=p.getImage()%>"
							alt="<%=p.getPname()%>" class="h-20 w-20 object-cover rounded">
							<%
							} else {
							%> <span class="text-gray-500">No Image</span> <%
 }
 %>
						</td>
						<td class="py-3 px-4 space-x-2"><a
							href="<%=request.getContextPath()%>/editProductServlet?id=<%=p.getPid()%>"
							class="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700 transition">
								Edit </a> <a
							href="<%=request.getContextPath()%>/DeleteProductServlet?pid=<%=p.getPid()%>"
							onclick="return confirm('Are you sure you want to delete this product?');"
							class="px-3 py-1 bg-red-600 text-white rounded hover:bg-red-700 transition">
								Delete </a></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="5" class="py-6 text-center text-gray-500">No
							products available</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<div class="mt-6">
			<a href="<%=request.getContextPath()%>/LoadAddProductServlet"
				class="px-6 py-3 bg-green-600 text-white rounded hover:bg-green-700 transition">
				Add New Product </a>
		</div>

	</div>

</body>
</html>
