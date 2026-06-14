<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect(request.getContextPath()+"/user/userLogin.jsp");
    return;
}

String context = request.getContextPath();
%>

<script src="https://cdn.tailwindcss.com"></script>

<div class="min-h-screen bg-gray-100 py-10 px-4">

<div class="max-w-3xl mx-auto bg-white shadow-lg rounded-xl overflow-hidden">

<!-- Profile Header -->
<%
			String msg = request.getParameter("msg");

			if (msg != null) {
			%>

			<div class="bg-green-100 text-green-700 p-3 rounded mb-4">
				Password changed successfully</div>

			<%
			}
			%>
<div class="bg-indigo-600 text-white p-6 flex items-center gap-8">

<div class="w-16 h-16 rounded-full bg-white text-indigo-600 
flex items-center justify-center text-2xl font-bold">

<%= user.getName()!=null ? user.getName().substring(0,1).toUpperCase() : "U" %>

</div>

<div>

<h2 class="text-2xl font-bold">
<%= user.getName()!=null ? user.getName() : "User" %>
</h2>

<p class="text-indigo-200 text-sm">
Welcome to your profile
</p>

</div>
<div class="ml-auto">
<a href="<%=context%>/home"
class="text-White-600 hover:underline text-sm">
             ← Back to Home
</a>
</div>
</div>

<!-- Profile Details -->
<div class="p-6">

<h3 class="text-lg font-semibold mb-6 text-gray-700">
Account Information
</h3>

<div class="grid md:grid-cols-2 gap-6">

<!-- Name -->
<div>
<label class="text-sm text-gray-500">Full Name</label>
<p class="text-gray-800 font-medium mt-1">
<%= user.getName()!=null ? user.getName() : "-" %>
</p>
</div>

<!-- Email -->
<div>
<label class="text-sm text-gray-500">Email Address</label>
<p class="text-gray-800 font-medium mt-1">
<%= user.getEmail()!=null ? user.getEmail() : "-" %>
</p>
</div>

<!-- Phone -->
<div>
<label class="text-sm text-gray-500">Phone Number</label>
<p class="text-gray-800 font-medium mt-1">
<%= user.getPhone()!=null ? user.getPhone() : "-" %>
</p>
</div>

<!-- Address -->
<div>
<label class="text-sm text-gray-500">Address</label>
<p class="text-gray-800 font-medium mt-1">
<%= user.getAddress()!=null ? user.getAddress() : "Not Provided" %>
</p>
</div>

</div>

<!-- Buttons -->
<div class="mt-8 flex gap-4">

<a href="<%=context%>/user/editProfile.jsp"
class="px-6 py-2 bg-indigo-600 text-white rounded-lg 
hover:bg-indigo-700 transition shadow">

Edit Profile
</a>

<a href="<%=context%>/UserLogoutServlet"
class="px-6 py-2 border border-gray-300 rounded-lg 
hover:bg-gray-100 transition">

Logout
</a>

</div>

</div>

</div>

</div>