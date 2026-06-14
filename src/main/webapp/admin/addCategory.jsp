<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Category" %>

<%
Category category = (Category) request.getAttribute("category"); // For edit, can be null for new
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
	
	<!-- NAVBAR -->
    <%@ include file="admin-navbar.jsp" %>

    <div class="max-w-2xl mx-auto px-4 py-8">

        <h2 class="text-3xl font-bold mb-6">
            <%= (category != null) ? "Edit Category" : "Add New Category" %>
        </h2>

        <form action="<%=request.getContextPath()%>/AddCategoryServlet"
              method="post"
              enctype="multipart/form-data"
              class="bg-white p-6 rounded-xl shadow-md space-y-4">

            <%-- Hidden field for category ID if editing --%>
            <input type="hidden" name="cid" value="<%= (category != null) ? category.getCid() : "" %>">

            <!-- Category Name -->
            <div>
                <label class="block font-semibold mb-1">Category Name:</label>
                <input type="text" name="cname" value="<%= (category != null) ? category.getCname() : "" %>" required
                       class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
            </div>

            <!-- Current Image Preview -->
            <div>
                <label class="block font-semibold mb-1">Current Image:</label>
                <%
                if (category != null && category.getImage() != null && !category.getImage().isEmpty()) {
                %>
                    <img src="<%=request.getContextPath()%>/uploads/categories/<%= category.getImage() %>"
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
                <label class="block font-semibold mb-1">Upload New Image:</label>
                <input type="file" name="image"
                       class="border border-gray-300 rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-green-500">
            </div>

            <!-- Submit Button -->
            <div>
                <button type="submit"
                        class="w-full bg-green-600 hover:bg-green-700 text-white font-semibold py-3 rounded-lg transition">
                    <%= (category != null) ? "Update Category" : "Add Category" %>
                </button>
            </div>

        </form>

    </div>

</body>
</html>
