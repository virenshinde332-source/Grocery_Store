<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.OrderItem" %>

<head>
<meta charset="UTF-8">
<title>Order Details</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<%@ include file="navbar.jsp" %>

<%
List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");

double total = 0;
int totalQty = 0;

if(items != null){
    for(OrderItem i : items){
        total += i.getProductPrice() * i.getQuantity();
        totalQty += i.getQuantity();
    }
}
%>

<div class="bg-gray-100 min-h-screen p-6">

<div class="max-w-5xl mx-auto">

<!-- Header -->
<div class="flex justify-between items-center mb-6">
<h2 class="text-2xl font-bold text-gray-800">📦 Order Details</h2>

<a href="<%=request.getContextPath()%>/UserOrdersServlet"
class="text-indigo-600 hover:underline text-sm">
← Back to Orders
</a>
</div>

<!-- Order Card -->
<div class="bg-white rounded-lg shadow overflow-hidden">

<table class="w-full text-sm">

<thead class="bg-gray-50 border-b text-gray-600 uppercase text-xs">
<tr>
<th class="px-4 py-3 text-left">Product</th>
<th class="px-4 py-3 text-left">Price</th>
<th class="px-4 py-3 text-left">Qty</th>
<th class="px-4 py-3 text-left">Total</th>
<th class="px-4 py-3 text-left">Action</th>
</tr>
</thead>

<tbody class="divide-y">

<%
if(items != null && !items.isEmpty()){
for(OrderItem i : items){
%>

<tr class="hover:bg-gray-50 transition">

<!-- Product Info -->
<td class="px-4 py-4">

<div class="flex items-center gap-4">

<img src="<%=request.getContextPath()%>/uploads/products/<%=i.getProductImage()%>"
class="w-16 h-16 object-cover rounded border">

<div>

<a href="<%=request.getContextPath()%>/ProductDetailsServlet?id=<%=i.getProductId()%>"
class="font-medium text-indigo-600 hover:underline">

<%= i.getProductName() %>

</a>

</div>

</div>

</td>

<!-- Price -->
<td class="px-4 py-4 text-gray-700">
₹ <%= i.getProductPrice() %>
</td>

<!-- Quantity -->
<td class="px-4 py-4 text-gray-700">
<%= i.getQuantity() %>
</td>

<!-- Total -->
<td class="px-4 py-4 font-semibold text-gray-900">
₹ <%= i.getProductPrice() * i.getQuantity() %>
</td>

<!-- Buy Again -->
<td class="px-4 py-4">

<a href="<%=request.getContextPath()%>/ProductDetailsServlet?id=<%=i.getProductId()%>"
class="px-3 py-1 bg-indigo-600 text-white text-xs rounded hover:bg-indigo-700">
Buy Again
</a>

</td>

</tr>

<%
}
}else{
%>

<tr>
<td colspan="5" class="text-center py-12 text-gray-500">

<div class="flex flex-col items-center gap-2">
<span class="text-4xl">📭</span>
<p>No items found in this order.</p>
</div>

</td>
</tr>

<%
}
%>

</tbody>

</table>

<!-- Summary -->
<% if(items != null && !items.isEmpty()){ %>

<div class="border-t bg-gray-50 p-6 flex justify-between items-center">

<div class="text-gray-600 text-sm">
Total Items:
<span class="font-semibold text-gray-900">
<%= totalQty %>
</span>
</div>

<div class="text-lg font-bold text-gray-900">
Grand Total: ₹ <%= total %>
</div>

</div>

<% } %>

</div>

</div>
</div>