<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create your account</title>

<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex items-center justify-center min-h-screen">

<form action="<%=request.getContextPath()%>/UserRegistrationServlet"
      class="bg-white w-full max-w-sm p-8 rounded-lg shadow-md">

    <h2 class="text-xl font-medium text-gray-800 text-center mb-1">
        Create your Account
    </h2>
    <p class="text-sm text-gray-500 text-center mb-6">
        Continue to Grocery Store
    </p>

    <!-- Username -->
    <div class="mb-4">
        <input name="name" type="text" required
               class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
               placeholder="Username">
    </div>

    <!-- Email -->
    <div class="mb-4">
        <input name="email" type="email" required
               class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
               placeholder="Email address">
    </div>

    <!-- Password -->
    <div class="mb-4">
        <input name="password" type="password" required
               class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
               placeholder="Password">
    </div>

    <!-- Address -->
    <div class="mb-4">
        <input name="address" type="text" required
               class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
               placeholder="Address">
    </div>

    <!-- Phone -->
    <div class="mb-6">
        <input name="phone" type="text" required
               class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
               placeholder="Phone number">
    </div>

    <!-- Button -->
    <button type="submit"
            class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded font-medium">
        Create account
    </button>

    <!-- Login -->
    <p class="text-center text-sm text-gray-600 mt-4">
        Already have an account?
        <a href="userLogin.jsp" class="text-blue-600 hover:underline">Login</a>
    </p>

    <!-- Message -->
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
        <p class="text-center text-red-500 text-sm mt-3"><%= msg %></p>
    <%
        }
    %>

</form>
</body>
</html>
