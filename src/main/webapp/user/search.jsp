<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, model.Product" %>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<%@ include file="navbar.jsp" %>

<div class="max-w-6xl mx-auto p-6">

    <h2 class="text-2xl font-bold mb-6">
        Search results for "<%=request.getAttribute("keyword")%>"
    </h2>

    <%
        List<Product> products =
            (List<Product>) request.getAttribute("products");

        if (products != null && !products.isEmpty()) {
    %>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">

        <% for (Product p : products) { %>

        <div class="bg-white shadow rounded-lg p-4">
            <img src="<%=request.getContextPath()%>/uploads/products/<%=p.getImage()%>"
                 class="h-40 w-full object-cover rounded mb-3">

            <h3 class="font-semibold"><%=p.getPname()%></h3>

            <p class="text-indigo-600 font-bold">
                ₹ <%=p.getPrice()%>
            </p>

            <a href="<%=request.getContextPath()%>/AddToCartServlet?pid=<%=p.getPid()%>"
               class="block mt-3 text-center bg-indigo-500 text-white py-2 rounded hover:bg-indigo-600">
               Add to Cart
            </a>
        </div>

        <% } %>
    </div>

    <%
        } else {
    %>

    <p class="text-gray-500 text-lg">
        No products found 
    </p>

    <% } %>
</div>
