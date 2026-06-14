<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Category"%>

<%
Category c = (Category) request.getAttribute("category");
if (c == null){
%>
<div class="max-w-2xl mx-auto mt-20 text-center text-red-600 text-xl font-semibold">
	Category not found 
</div>
<%
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Category</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

	<!-- NAVBAR -->
	<%@ include file="admin-navbar.jsp"%>

	<div class="max-w-3xl mx-auto px-4 py-8">

		<h2 class="text-3xl font-bold mb-6">Edit Category</h2>

		<form action="<%=request.getContextPath()%>/EditCategoryServlet"
			method="post" enctype="multipart/form-data"
			class="bg-white p-6 rounded-xl shadow-md space-y-4">

			<input type="hidden" name="cid" value="<%= c.getCid() %>">

			<!-- Category Name -->
			<div>
				<label class="block font-semibold mb-1">Category Name: </label> <input
					type="text" name="cname" value="<%= c.getCname() %>" required
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
			</div>

			<!-- Current Image -->
			<div>
				<label class="block font-semibold mb-1">Current Image:</label>
				<%
                if (c.getImage() != null && !c.getImage().isEmpty()) {
                %>
				<img
					src="<%=request.getContextPath()%>/uploads/categories/<%= c.getImage() %>"
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