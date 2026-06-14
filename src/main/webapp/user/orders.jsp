<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Order" %>

<head>
<meta charset="UTF-8">
<title>My Orders</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<!-- USER NAVBAR -->
<%@ include file="navbar.jsp" %>

<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
int orderCount = (orders != null) ? orders.size() : 0;
%>

<div class="p-6 bg-gray-100 min-h-screen">

    <!-- Header -->
    <div class="max-w-6xl mx-auto flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold text-gray-800">📦 My Orders</h2>

        <span class="text-sm text-gray-500 bg-white px-4 py-2 rounded shadow">
            Total Orders: <%= orderCount %>
        </span>
    </div>

    <!-- Table Card -->
    <div class="max-w-6xl mx-auto bg-white rounded-lg shadow overflow-x-auto">

        <table class="min-w-full text-sm text-left">

            <!-- Table Header -->
            <thead class="bg-gray-50 border-b">
                <tr class="text-gray-600 uppercase tracking-wider text-xs">
                    <th class="px-4 py-3">Order ID</th>
                    <th class="px-4 py-3">Date</th>
                    <th class="px-4 py-3">Total</th>
                    <th class="px-4 py-3">Payment</th>
                    <th class="px-4 py-3">Status</th>
                    <th class="px-4 py-3">Action</th>
                </tr>
            </thead>

            <!-- Table Body -->
            <tbody class="divide-y">

            <%
            if (orders != null && !orders.isEmpty()) {
                for (Order o : orders) {

                String status = o.getStatus();

                String badge =
                    "Pending".equals(status) ? "bg-yellow-100 text-yellow-700" :
                    "Shipped".equals(status) ? "bg-blue-100 text-blue-700" :
                    "Delivered".equals(status) ? "bg-green-100 text-green-700" :
                    "Cancelled".equals(status) ? "bg-red-100 text-red-700" :
                    "bg-gray-100 text-gray-700";
            %>

                <tr class="hover:bg-gray-50 transition">

                    <!-- Order ID -->
                    <td class="px-4 py-3 font-semibold text-indigo-600">
                        #<%= o.getId() %>
                    </td>

                    <!-- Date -->
                    <td class="px-4 py-3 text-gray-600 text-sm">
                        <%= o.getOrderDate() %>
                    </td>

                    <!-- Total -->
                    <td class="px-4 py-3 font-bold text-gray-900">
                        ₹ <%= o.getTotalAmount() %>
                    </td>

                    <!-- Payment -->
                    <td class="px-4 py-3 text-gray-700">
                        <%= o.getPaymentMode() != null ? o.getPaymentMode() : "N/A" %>
                    </td>

                    <!-- Status -->
                    <td class="px-4 py-3">
                        <span class="px-3 py-1 rounded-full text-xs font-semibold <%= badge %>">
                            <%= status %>
                        </span>
                    </td>

                    <!-- Action -->
                    <td class="px-4 py-3">

                        <a href="<%=request.getContextPath()%>/OrderDetailsServlet?id=<%=o.getId()%>"
                           class="px-3 py-1 bg-indigo-600 text-white rounded text-xs hover:bg-indigo-700">
                            View Details
                        </a>

                    </td>

                </tr>

            <%
                }
            } else {
            %>

                <!-- Empty State -->
                <tr>
                    <td colspan="6" class="text-center py-12">

                        <div class="flex flex-col items-center gap-3">

                            <span class="text-4xl">📭</span>

                            <p class="text-gray-500 text-sm">
                                You haven't placed any orders yet.
                            </p>

                            <a href="<%=request.getContextPath()%>/home"
                               class="mt-2 px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700 text-sm">
                               Continue Shopping
                            </a>

                        </div>

                    </td>
                </tr>

            <%
            }
            %>

            </tbody>
        </table>

    </div>
</div>