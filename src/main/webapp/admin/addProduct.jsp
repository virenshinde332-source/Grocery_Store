<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Category" %>

<%
    List<Category> categories =
        (List<Category>) request.getAttribute("categories");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen">

<!-- NAVBAR -->
    <%@ include file="admin-navbar.jsp" %>

<div class="max-w-3xl mx-auto px-4 py-8">

    <h2 class="text-3xl font-bold mb-6">Add Product</h2>

    <form action="<%= request.getContextPath() %>/AddProductServlet"
          method="post"
          enctype="multipart/form-data"
          class="bg-white p-6 rounded-xl shadow-md space-y-4">

        <!-- Product Name -->
        <div>
            <label class="block font-semibold mb-1">Product Name</label>
            <input type="text"
                   name="pname"
                   required
                   placeholder="Enter product name"
                   class="w-full border border-gray-300 rounded px-3 py-2
                          focus:outline-none focus:ring-2 focus:ring-green-500">
        </div>

        <!-- Price -->
        <div>
            <label class="block font-semibold mb-1">Price (₹)</label>
            <input type="number"
                   step="0.01"
                   name="price"
                   required
                   placeholder="Enter price"
                   class="w-full border border-gray-300 rounded px-3 py-2
                          focus:outline-none focus:ring-2 focus:ring-green-500">
        </div>

        <!-- Quantity -->
        <div>
            <label class="block font-semibold mb-1">Quantity</label>
            <input type="number"
                   name="quantity"
                   required
                   placeholder="Enter quantity"
                   class="w-full border border-gray-300 rounded px-3 py-2
                          focus:outline-none focus:ring-2 focus:ring-green-500">
        </div>

        <!-- Category -->
        <div>
            <label class="block font-semibold mb-1">Category</label>
            <select name="cid"
                    required
                    class="w-full border border-gray-300 rounded px-3 py-2
                           focus:outline-none focus:ring-2 focus:ring-green-500">
                <option value="">-- Select Category --</option>
                <%
                    if (categories != null) {
                        for (Category c : categories) {
                %>
                    <option value="<%= c.getCid() %>">
                        <%= c.getCname() %>
                    </option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <!-- Image Upload -->
        <div>
            <label class="block font-semibold mb-1">Product Image</label>
            <input type="file"
                   name="image"
                   required
                   class="w-full border border-gray-300 rounded px-3 py-2
                          focus:outline-none focus:ring-2 focus:ring-green-500">
        </div>

        <!-- Submit -->
        <div>
            <button type="submit"
                    class="w-full bg-green-600 hover:bg-green-700
                           text-white font-semibold py-3 rounded-lg transition">
                Add Product
            </button>
        </div>

    </form>

</div>

</body>
</html>
