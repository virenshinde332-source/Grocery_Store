<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Order, model.OrderItem" %>

<head>
    <meta charset="UTF-8">
    <title>Order Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

	<!-- NAVBAR -->
    <%@ include file="admin-navbar.jsp" %>
    
<div class="p-6 bg-gray-100 min-h-screen">

    <!-- Header -->
    <div class="flex items-center justify-between mb-6">
        <h2 class="text-2xl font-bold text-gray-800">🧾 Order Management</h2>
        <span class="text-sm text-gray-500">
            Total Orders: <%= ((List)request.getAttribute("orders")).size() %>
        </span>
    </div>

    <!-- Table Card -->
    <div class="bg-white rounded-lg shadow overflow-x-auto">

        <table class="min-w-full text-sm text-left">
            <thead class="bg-gray-50 border-b">
                <tr class="text-gray-600 uppercase tracking-wider text-xs">
                    <th class="px-4 py-3">Order ID</th>
                    <th class="px-4 py-3">Customer</th>
                    <th class="px-4 py-3">Address</th>
                    <th class="px-4 py-3">Products</th>
                    <th class="px-4 py-3">Prices</th>
                    <th class="px-4 py-3">Total</th>
                    <th class="px-4 py-3">Payment</th>
                    <th class="px-4 py-3">Date</th>
                    <th class="px-4 py-3">Status</th>
                    <th class="px-4 py-3">Action</th>
                </tr>
            </thead>

            <tbody class="divide-y">
            <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
                for (Order o : orders) {
            %>

                <tr class="hover:bg-gray-50 transition">

                    <td class="px-4 py-3 font-semibold text-indigo-600">#<%= o.getId() %></td>
                    <td class="px-4 py-3 font-medium text-gray-800"><%= o.getUserName() %></td>
                    <td class="px-4 py-3 text-gray-600 max-w-xs"><%= o.getAddress() %></td>

                    <!-- Products -->
                    <td class="px-4 py-3">
                        <%
                        if (o.getItems() != null && !o.getItems().isEmpty()) {
                            for (OrderItem i : o.getItems()) {
                        %>
                            <div class="flex justify-between text-gray-700">
                                <span>• <%= i.getProductName() %></span>
                                <span class="text-xs text-gray-500">x<%= i.getQuantity() %></span>
                            </div>
                        <%
                            }
                        } else {
                        %>
                            <span class="text-gray-400 italic">No items</span>
                        <%
                        }
                        %>
                    </td>

                    <!-- Prices -->
                    <td class="px-4 py-3 text-gray-700">
                        <%
                        if (o.getItems() != null && !o.getItems().isEmpty()) {
                            for (OrderItem i : o.getItems()) {
                        %>
                            <div>₹ <%= i.getProductPrice() %></div>
                        <%
                            }
                        } else {
                        %>
                            <span class="text-gray-400">—</span>
                        <%
                        }
                        %>
                    </td>

                    <!-- Total -->
                    <td class="px-4 py-3 font-bold text-gray-900">₹ <%= o.getTotalAmount() %></td>

                    <!-- Payment Mode -->
                    <td class="px-4 py-3 text-gray-700 font-medium">
                        <%= o.getPaymentMode() != null ? o.getPaymentMode() : "—" %>
                    </td>

                    <!-- Date -->
                    <td class="px-4 py-3 text-gray-600 text-xs"><%= o.getOrderDate() %></td>

                    <!-- Status -->
                    <td class="px-4 py-3">
                        <%
                        String status = o.getStatus();
                        String badge =
                            "Pending".equals(status) ? "bg-yellow-100 text-yellow-700" :
                            "Shipped".equals(status) ? "bg-blue-100 text-blue-700" :
                            "Delivered".equals(status) ? "bg-green-100 text-green-700" :
                            "Cancelled".equals(status) ? "bg-red-100 text-red-700" :
                            "bg-gray-100 text-gray-700";
                        %>
                        <span class="px-3 py-1 rounded-full text-xs font-semibold <%= badge %>">
                            <%= status %>
                        </span>
                    </td>

                    <!-- Action -->
                    <td class="px-4 py-3">
                       <form action="<%=request.getContextPath()%>/UpdateOrderStatusServlet" method="post" class="flex gap-2 items-center">
                            <input type="hidden" name="oid" value="<%= o.getId() %>">
                            <select name="status" class="border rounded px-2 py-1 text-sm">
                                <option <%= "Pending".equals(status) ? "selected" : "" %>>Pending</option>
                                <option <%= "Shipped".equals(status) ? "selected" : "" %>>Shipped</option>
                                <option <%= "Delivered".equals(status) ? "selected" : "" %>>Delivered</option>
                                <option <%= "Cancelled".equals(status) ? "selected" : "" %>>Cancelled</option>
                            </select>
                            <button class="px-3 py-1 bg-indigo-600 text-white rounded hover:bg-indigo-700 text-sm">Update</button>
                        </form>
                    </td>

                </tr>

            <%
                }
            } else {
            %>
                <tr>
                    <td colspan="10" class="text-center py-10 text-gray-500">No orders found</td>
                </tr>
            <%
            }
            %>
            </tbody>
        </table>

    </div>
</div>
