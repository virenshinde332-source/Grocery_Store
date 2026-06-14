<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Category" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Grocery Store | Home</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">

    <!-- Navbar -->
    <%@ include file="/user/navbar.jsp" %>

    <!-- Hero Section -->
    <section class="bg-green-50 py-24">
        <div class="max-w-6xl mx-auto text-center px-6">
            <h1 class="text-5xl font-extrabold text-gray-800 mb-4">
                Fresh Groceries Delivered to Your Door
            </h1>
            <p class="text-lg text-gray-600 mb-8">
                Fruits, vegetables, dairy, and essentials — all in one place.
            </p>
            <div class="flex justify-center gap-4 flex-wrap">
                <a href="user/userRegister.jsp"
                   class="px-8 py-3 bg-green-600 text-white rounded-full font-semibold hover:bg-green-700 transition">
                    Get Started
                </a>
                <a href="user/userLogin.jsp"
                   class="px-8 py-3 bg-white border border-green-600 text-green-600 rounded-full font-semibold hover:bg-green-100 transition">
                    Login
                </a>
            </div>
        </div>
    </section>

    <!-- Features / Highlights Section -->
    <section class="max-w-7xl mx-auto py-20 px-6">
        <h2 class="text-3xl font-bold text-gray-800 mb-12 text-center">
            Why Shop With Us?
        </h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-10">
            <!-- Feature 1 -->
            <div class="bg-white shadow-lg rounded-xl p-8 text-center hover:shadow-2xl transition">
                <img src="<%= request.getContextPath() %>/uploads/images/fresh.jpg" class="mx-auto w-20 mb-4">
                <h3 class="text-xl font-semibold mb-2">Fresh Products</h3>
                <p class="text-gray-500">We source the freshest fruits and vegetables directly from farms.</p>
            </div>

            <!-- Feature 2 -->
            <div class="bg-white shadow-lg rounded-xl p-8 text-center hover:shadow-2xl transition">
                <img src="<%= request.getContextPath() %>/uploads/images/fastd.jpg" class="mx-auto w-20 mb-4">
                <h3 class="text-xl font-semibold mb-2">Fast Delivery</h3>
                <p class="text-gray-500">Get your groceries delivered to your doorstep quickly and safely.</p>
            </div>

            <!-- Feature 3 -->
            <div class="bg-white shadow-lg rounded-xl p-8 text-center hover:shadow-2xl transition">
                <img src="<%= request.getContextPath() %>/uploads/images/highq.jpg" class="mx-auto w-20 mb-4">
                <h3 class="text-xl font-semibold mb-2">High Quality</h3>
                <p class="text-gray-500">We ensure top-quality products and best value for money.</p>
            </div>
        </div>
    </section>

    <!-- Call-to-Action Section -->
    <section class="bg-green-600 text-white py-16 mt-auto">
        <div class="max-w-6xl mx-auto text-center px-6">
            <h2 class="text-4xl font-bold mb-4">Ready to Shop?</h2>
            <p class="mb-6">Join thousands of happy customers and get your groceries delivered fast!</p>
            <a href="user/userRegister.jsp"
               class="px-8 py-3 bg-white text-green-600 rounded-full font-semibold hover:bg-gray-100 transition">
                Start Shopping
            </a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-white border-t text-center py-6 text-gray-500 text-sm">
        © 2026 Grocery Store. All rights reserved.
    </footer>

</body>
</html>
