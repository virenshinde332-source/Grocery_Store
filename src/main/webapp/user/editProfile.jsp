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

<head>
<title>Edit Profile</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<div class="min-h-screen bg-gray-100 py-10 px-4">

<div class="max-w-2xl mx-auto bg-white rounded-xl shadow-lg p-8">

<!-- Header -->
<div class="flex justify-between items-center mb-6">

<h2 class="text-2xl font-bold text-gray-800">
Edit Profile
</h2>

<a href="<%=context%>/user/profile.jsp"
class="text-indigo-600 hover:underline text-sm">

← Back to Profile
</a>

</div>

<!-- Form -->
<form action="<%=context%>/UpdateProfileServlet" method="post" class="space-y-5">

<input type="hidden" name="id" value="<%=user.getId()%>">

<!-- Name -->
<div>
<label class="block text-sm font-medium text-gray-600 mb-1">
Full Name
</label>

<input
type="text"
name="name"
required
value="<%=user.getName()!=null ? user.getName() : ""%>"
class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">
</div>

<!-- Email -->
<div>
<label class="block text-sm font-medium text-gray-600 mb-1">
Email Address
</label>

<input
type="email"
name="email"
required
value="<%=user.getEmail()!=null ? user.getEmail() : ""%>"
class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">
</div>

<!-- Phone -->
<div>
<label class="block text-sm font-medium text-gray-600 mb-1">
Phone Number
</label>

<input
type="text"
name="phone"
value="<%=user.getPhone()!=null ? user.getPhone() : ""%>"
class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">
</div>

<!-- Address -->
<div>
<label class="block text-sm font-medium text-gray-600 mb-1">
Address
</label>

<textarea
name="address"
rows="3"
class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"><%=user.getAddress()!=null ? user.getAddress() : ""%></textarea>
</div>

<!-- Buttons -->
<div class="flex gap-4 pt-4">

<button
type="submit"
class="px-6 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition shadow">

Update Profile
</button>

<a
href="<%=context%>/user/changePassword.jsp"
class="px-6 py-2 border border-gray-300 rounded-lg hover:bg-gray-100 transition">

Change Password
</a>

</div>

</form>

</div>

</div>