<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Grocery Store | Products</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen">

    <!-- Navbar -->
    <%@ include file="/user/navbar.jsp" %>

    <div class="max-w-7xl mx-auto px-6 py-10">
        <h2 class="text-3xl font-bold mb-8 text-gray-800">Available Products</h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
<%
List<Product> products = (List<Product>) request.getAttribute("products");

if (products != null && !products.isEmpty()) {
    for (Product p : products) {
%>
            <!-- Product Card -->
            <div class="bg-white shadow-md rounded-xl overflow-hidden hover:shadow-xl transition">
                
                <!-- Product Image -->
                <img 
                    src="<%= request.getContextPath() %>/uploads/products/<%= p.getImage() != null && !p.getImage().isEmpty() ? p.getImage() : "no-image.png" %>" 
                    alt="<%= p.getPname() %>" 
                    class="w-full h-48 object-cover">

                <div class="p-4">
                    <h3 class="text-lg font-semibold text-gray-800"><a href="<%=request.getContextPath()%>/ProductDetailsServlet?id=<%=p.getPid()%>"
class="font-medium text-indigo-600 hover:underline"> <%= p.getPname() %></a> </h3>
                    <p class="text-green-600 font-bold mt-2">₹ <%= p.getPrice() %></p>
                    <p class="text-gray-500 text-sm mt-1">Quantity : <%= p.getQuantity() %></p>

                    <div class="mt-4 flex justify-between items-center">
                        <a href="AddToCartServlet?pid=<%= p.getPid() %>"
                           class="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700 transition text-sm font-semibold">
                            Add to Cart
                        </a>
                        <span class="text-gray-500 text-sm"><%= p.getCategory() != null ? p.getCategory().getCname() : "" %></span>
                    </div>
                </div>
            </div>
<%
    }
} else {
%>
            <p class="text-gray-500 col-span-full text-center">No products available</p>
<%
}
%>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-white border-t text-center py-6 text-gray-500 text-sm mt-auto">
        © 2026 Grocery Store. All rights reserved.
    </footer>

</body>
</html>
