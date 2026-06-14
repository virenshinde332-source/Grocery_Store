<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-br from-blue-100 to-indigo-100 min-h-screen flex items-center justify-center">

<form action="<%=request.getContextPath()%>/UserLoginServlet"
      class="bg-white w-full max-w-sm p-8 rounded-xl shadow-lg">

    <!-- Logo / Title -->
    <div class="text-center mb-6">
        <h2 class="text-2xl font-semibold text-gray-800">Welcome Back</h2>
        <p class="text-sm text-gray-500">Login to your account</p>
    </div>

    <!-- Email -->
    <div class="mb-4">
        <label class="block text-sm text-gray-600 mb-1">Email</label>
        <input type="email" name="email" required
               class="w-full px-3 py-2 border rounded-lg outline-none focus:ring-2 focus:ring-blue-500"
               placeholder="you@example.com">
    </div>

    <!-- Password -->
    <div class="mb-5">
        <label class="block text-sm text-gray-600 mb-1">Password</label>
        <input type="password" name="password" required
               class="w-full px-3 py-2 border rounded-lg outline-none focus:ring-2 focus:ring-blue-500"
               placeholder="••••••••">
    </div>

    <!-- Button -->
    <button type="submit"
            class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2.5 rounded-lg font-medium transition">
        Sign In
    </button>

    <!-- Register -->
    <p class="text-center text-sm text-gray-600 mt-4">
        Don’t have an account?
        <a href="<%=request.getContextPath()%>/user/userRegister.jsp" class="text-blue-600 hover:underline">Create one</a>
    </p>

    <!-- Message -->
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
        <p class="text-center text-red-500 text-sm mt-4"><%= msg %></p>
    <%
        }
    %>
    <%
		String msg1 = (String) session.getAttribute("msg1");
		if (msg1 != null) {
	%>
  	    <p class="text-red-600 text-sm mt-4"><%=msg1%></p>
	<%
   		session.removeAttribute("msg1");
	}
	%>
    

</form>
</body>
</html>
