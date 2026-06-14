<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Category"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Categories</title>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

	<!-- NAVBAR -->
	<%@ include file="admin-navbar.jsp"%>
	<div class="max-w-6xl mx-auto px-4 py-8">
		<%
		String error = (String) request.getAttribute("error");
		if (error != null) {
		%>
		<p style="color: red;"><%=error%></p>
		<%
		}
		%>
		<h2 class="text-3xl font-bold mb-6">Categories</h2>

		<div class="overflow-x-auto">
			<table class="min-w-full bg-white rounded-lg shadow overflow-hidden">
				<thead class="bg-gray-200 text-gray-700">
					<tr>
						<th class="py-3 px-4 text-left">ID</th>
						<th class="py-3 px-4 text-left">Image</th>
						<th class="py-3 px-4 text-left">Name</th>
						<th class="py-3 px-4 text-left">Action</th>
					</tr>
				</thead>
				<tbody class="divide-y divide-gray-200">
					<%
					List<Category> list = (List<Category>) request.getAttribute("categories");

					if (list != null && !list.isEmpty()) {
						for (Category c : list) {
					%>
					<tr class="hover:bg-gray-50">
						<td class="py-3 px-4"><%=c.getCid()%></td>

						<!-- Category Image -->
						<td class="py-3 px-4">
							<%
							if (c.getImage() != null && !c.getImage().isEmpty()) {
							%> <img
							src="<%=request.getContextPath()%>/uploads/categories/<%=c.getImage()%>"
							class="h-16 w-16 object-cover rounded border"> <%
 } else {
 %> <span class="text-gray-400">No Image</span> <%
 }
 %>
						</td>

						<td class="py-3 px-5"><%=c.getCname()%></td>

						<td class="py-3 px-4 space-x-2"><a
							href="<%=request.getContextPath()%>/EditCategoryServlet?id=<%=c.getCid()%>"
							onclick="return confirm('Are you sure you want to edit this category?');"
							class="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700 transition">
								Edit </a>

						<a
							href="<%=request.getContextPath()%>/deleteCategory?id=<%=c.getCid()%>"
							onclick="return confirm('Are you sure you want to delete this category?');"
							class="px-3 py-1 bg-red-600 text-white rounded hover:bg-red-700 transition">
								Delete </a></td>

					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="4" class="py-6 text-center text-gray-500">No
							Categories Found</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<div class="mt-6">
			<a href="<%=request.getContextPath()%>/admin/addCategory.jsp"
				class="px-6 py-3 bg-green-600 text-white rounded hover:bg-green-700 transition">
				Add New Category </a>
		</div>

	</div>
</body>
</html>
