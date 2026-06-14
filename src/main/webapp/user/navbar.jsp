<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");
%>

<%
int cartCount = 0;

Map<Integer, Integer> cart =
        (Map<Integer, Integer>) session.getAttribute("cart");

if (cart != null) {
    cartCount = cart.size();
}
%>

<nav class="flex items-center justify-between px-16 py-4 border-b border-gray-300 bg-white">

    <!-- Logo -->
    <a href="<%=request.getContextPath()%>/Index.jsp">
        <img class="h-11"
             src="<%= request.getContextPath() %>/uploads/images/grocery.jpg"
             alt="Grocery Store Logo">
    </a>

    <!-- Center Menu -->
    <div class="flex items-center gap-10">

        <a href="<%=request.getContextPath()%>/home"
           class="hover:text-indigo-600 font-medium">Home</a>

        <a href="<%=request.getContextPath()%>/user/about.jsp"
           class="hover:text-indigo-600 font-medium">About</a>

        <a href="<%=request.getContextPath()%>/user/contact.jsp"
           class="hover:text-indigo-600 font-medium">Contact</a>

        <!-- Search -->
        <form action="<%=request.getContextPath()%>/SearchServlet"
              method="get"
              class="flex items-center gap-2 border px-4 py-1.5 rounded-full">

            <input name="q"
                   class="bg-transparent outline-none text-sm w-40"
                   placeholder="Search products">
            🔍
        </form>
    </div>

    <!-- Right Side -->
    <div class="flex items-center gap-6">

        <!-- Cart -->
        <a href="<%=request.getContextPath()%>/ViewCartServlet"
           class="relative text-2xl hover:text-indigo-600">

            🛒

            <% if (cartCount > 0) { %>
                <span
                    class="absolute -top-2 -right-3 text-xs bg-red-500
                           text-white w-[18px] h-[18px] rounded-full
                           flex items-center justify-center">
                    <%= cartCount %>
                </span>
            <% } %>
        </a>

        <!-- User Dropdown -->
        <div class="relative">

            <!-- User Icon -->
            <button onclick="toggleUserMenu()"
                    class="text-2xl hover:text-indigo-600">
                👤
                  <% if(user != null){ %>
            <span class="font-medium text-sm">
                <%= user.getName() %>
            </span>
        <% } %>
            </button>

            <!-- Dropdown Menu -->
            <div id="userMenu"
                 class="hidden absolute right-0 mt-3 w-40 bg-white border rounded-lg shadow-lg">

                <%
                if (session.getAttribute("user") == null) {
                %>

                    <a href="<%=request.getContextPath()%>/user/userLogin.jsp"
                       class="block px-4 py-2 hover:bg-gray-100">
                        Login
                    </a>

                    <a href="<%=request.getContextPath()%>/user/register.jsp"
                       class="block px-4 py-2 hover:bg-gray-100">
                        Register
                    </a>

                <%
                } else {
                %>

                    <a href="<%=request.getContextPath()%>/user/profile.jsp"
                       class="block px-4 py-2 hover:bg-gray-100">
                        Profile
                    </a>

                    <a href="<%=request.getContextPath()%>/UserOrdersServlet"
                       class="block px-4 py-2 hover:bg-gray-100">
                        Orders
                    </a>

                    <a href="<%=request.getContextPath()%>/UserLogoutServlet"
                       class="block px-4 py-2 text-red-600 hover:bg-gray-100">
                        Logout
                    </a>

                <%
                }
                %>

            </div>

        </div>

    </div>
</nav>

<script>
function toggleUserMenu() {
    const menu = document.getElementById("userMenu");
    menu.classList.toggle("hidden");
}
</script>