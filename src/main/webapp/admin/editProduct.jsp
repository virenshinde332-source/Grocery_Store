<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Product, model.Category"%>

<%
Product product = (Product) request.getAttribute("product");
if (product == null) {
%>
<div
	class="max-w-2xl mx-auto mt-20 text-center text-red-600 text-xl font-semibold">
	Product not found</div>
<%
    return;
}
List<Category> categories = (List<Category>) request.getAttribute("categories");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

	<!-- NAVBAR -->
	<%@ include file="admin-navbar.jsp"%>

	<div class="max-w-3xl mx-auto px-4 py-8">

		<h2 class="text-3xl font-bold mb-6">Edit Product</h2>

		<form action="<%=request.getContextPath()%>/editProductServlet"
			method="post" enctype="multipart/form-data"
			class="bg-white p-6 rounded-xl shadow-md space-y-4">

			<input type="hidden" name="pid" value="<%= product.getPid() %>">

			<!-- Product Name -->
			<div>
				<label class="block font-semibold mb-1">Product Name:</label> <input
					type="text" name="pname" value="<%= product.getPname() %>" required
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
			</div>

			<!-- Price -->
			<div>
				<label class="block font-semibold mb-1">Price (₹):</label> <input
					type="number" step="0.01" name="price"
					value="<%= product.getPrice() %>" required
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
			</div>

			<!-- Quantity -->
			<div>
				<label class="block font-semibold mb-1">Quantity:</label> <input
					type="number" name="quantity" value="<%= product.getQuantity() %>"
					required
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
			</div>

			<!-- Category -->
			<div>
				<label class="block font-semibold mb-1">Category:</label> <select
					name="cid" required
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
					<%
                    for (Category c : categories) {
                    %>
					<option value="<%= c.getCid() %>"
						<%= (product.getCategory() != null && product.getCategory().getCid() == c.getCid()) ? "selected" : "" %>>
						<%= c.getCname() %>
					</option>
					<%
                    }
                    %>
				</select>
			</div>

			<!-- Current Image -->
			<div>
				<label class="block font-semibold mb-1">Current Image:</label>
				<%
                if (product.getImage() != null && !product.getImage().isEmpty()) {
                %>
				<img
					src="<%=request.getContextPath()%>/uploads/products/<%= product.getImage() %>"
					class="h-24 w-24 object-cover rounded border">
				<%
                } else {
                %>
				<span class="text-gray-500">No Image</span>
				<%
                }
                %>
			</div>

			<!-- Upload New Image -->
			<div>
				<label class="block font-semibold mb-1">Upload New Image:</label> <input
					type="file" name="image"
					class="border border-gray-300 rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-green-500">
			</div>

			<!-- Submit Button -->
			<div>
				<button type="submit"
					class="w-full bg-green-600 hover:bg-green-700 text-white font-semibold py-3 rounded-lg transition">
					Update Product</button>
			</div>

		</form>
	</div>

</body>
</html>
