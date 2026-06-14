<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect(request.getContextPath() + "/user/userLogin.jsp");
	return;
}

String context = request.getContextPath();
%>

<head>
<title>Change Password</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<div class="min-h-screen bg-gray-100 py-10 px-4">

	<div class="max-w-md mx-auto bg-white shadow-lg rounded-xl p-8">

		<!-- Header -->
		<div class="flex justify-between items-center mb-6">
			
			<h2 class="text-xl font-bold text-gray-800">Change Password</h2>

			<a href="<%=context%>/user/profile.jsp"
				class="text-indigo-600 hover:underline text-sm"> ← Back to
				Profile </a>

		</div>

		<!-- Form -->
		<form action="<%=context%>/ChangePasswordServlet" method="post"
			class="space-y-5">

			<input type="hidden" name="id" value="<%=user.getId()%>">

			<!-- Current Password -->
			<div>
				<label class="block text-sm font-medium text-gray-600 mb-1">
					Current Password </label> <input type="password" name="oldPassword"
					required
					class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">
			</div>

			<!-- New Password -->
			<div>
				<label class="block text-sm font-medium text-gray-600 mb-1">
					New Password </label> <input type="password" name="newPassword" required
					minlength="6"
					class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">
			</div>

			<!-- Confirm Password -->
			<div>
				<label class="block text-sm font-medium text-gray-600 mb-1">
					Confirm New Password </label> <input type="password" name="confirmPassword"
					required minlength="6"
					class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">
			</div>

			<!-- Buttons -->
			<div class="flex gap-4 pt-2">

				<button type="submit"
					class="px-6 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition shadow">

					Update Password</button>

				<a href="<%=context%>/user/profile.jsp"
					class="px-6 py-2 border border-gray-300 rounded-lg hover:bg-gray-100 transition">

					Cancel </a>

			</div>

		</form>
			<%
			String msg = request.getParameter("msg");

			if (msg != null) {
			%>

			<div class="bg-green-100 text-green-700 p-3 rounded mb-4">
				Password changed successfully</div>

			<%
			}
			%>
			<%
			String error = request.getParameter("error");

			if (error != null) {
			%>

			<div class="text-red-700 p-3 rounded mb-4">
				Current password is Wrong </div><br><br>

			<%
			}
			%>
	</div>

</div>
