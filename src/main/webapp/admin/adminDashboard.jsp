<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Product" %>
<%
    // Check admin session
    if (session.getAttribute("admin") == null) {
        response.sendRedirect(request.getContextPath() + "/user/userLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

    <!-- NAVBAR -->
    <%@ include file="admin-navbar.jsp" %>

    <div class="max-w-6xl mx-auto px-4 py-8">

        <!-- DASHBOARD ACTIONS -->
        <h2 class="text-2xl font-semibold mb-6">Manage Products & Orders</h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">

            <!-- View Categories -->
            <a href="<%= request.getContextPath() %>/ViewCategoryServlet"
               class="block p-6 bg-white rounded-xl shadow hover:shadow-lg transition text-center">
                <h3 class="text-lg font-semibold mb-2">View Categories</h3>
                <p class="text-gray-500">Browse all product categories</p>
            </a>

            <!-- Add New Category -->
            <a href="<%= request.getContextPath() %>/admin/addCategory.jsp"
               class="block p-6 bg-white rounded-xl shadow hover:shadow-lg transition text-center">
                <h3 class="text-lg font-semibold mb-2">Add New Category</h3>
                <p class="text-gray-500">Create a new product category</p>
            </a>

            <!-- View Products -->
            <a href="<%= request.getContextPath() %>/ViewProductServlet"
               class="block p-6 bg-white rounded-xl shadow hover:shadow-lg transition text-center">
                <h3 class="text-lg font-semibold mb-2">View Products</h3>
                <p class="text-gray-500">Check existing products</p>
            </a>

            <!-- Add New Product -->
            <a href="<%= request.getContextPath() %>/LoadAddProductServlet"
               class="block p-6 bg-white rounded-xl shadow hover:shadow-lg transition text-center">
                <h3 class="text-lg font-semibold mb-2">Add New Product</h3>
                <p class="text-gray-500">Insert new products into catalog</p>
            </a>

            <!-- Orders -->
            <a href="<%= request.getContextPath() %>/ViewOrdersServlet"
               class="block p-6 bg-white rounded-xl shadow hover:shadow-lg transition text-center">
                <h3 class="text-lg font-semibold mb-2">View Orders</h3>
                <p class="text-gray-500">Manage customer orders</p>
            </a>

        </div>

    </div>

</body>
</html>
