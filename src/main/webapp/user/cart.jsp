<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map, model.Product" %>
<script src="https://cdn.tailwindcss.com"></script>

    <!-- Navbar -->
    <%@ include file="/user/navbar.jsp" %>

<div class="max-w-6xl mx-auto px-4 py-8">

    <h2 class="text-3xl font-bold mb-8">🛒 Your Cart</h2>

<%
    /* Use unique, safe variable names to avoid JSP conflicts */
    Map<Integer, Integer> cartMap =
            (Map<Integer, Integer>) request.getAttribute("cart");

    Map<Integer, Product> productMap =
            (Map<Integer, Product>) request.getAttribute("products");

    if (cartMap != null && !cartMap.isEmpty()) {

        double totalAmount = 0;
%>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

        <!-- ================= CART ITEMS ================= -->
        <div class="lg:col-span-2 space-y-4">

        <%
            for (Map.Entry<Integer, Integer> entry : cartMap.entrySet()) {

                Integer productId = entry.getKey();
                Integer quantity = entry.getValue();

                Product product = productMap.get(productId);
                if (product == null) {
                    continue;
                }

                double subTotal = product.getPrice() * quantity;
                totalAmount += subTotal;
        %>

            <div class="flex gap-4 bg-white border rounded-xl p-4 shadow-sm hover:shadow-md transition">

                <img src="<%=request.getContextPath()%>/uploads/products/<%=product.getImage()%>"
                     alt="<%=product.getPname()%>"
                     class="h-24 w-24 object-cover rounded-lg border">

                <div class="flex-1">
                    <h3 class="text-lg font-semibold mb-1">
                        <%=product.getPname()%>
                    </h3>

                    <p class="text-sm text-gray-500">
                        ₹ <%=product.getPrice()%> per unit
                    </p>

                    <!-- Quantity Controls -->
                    <div class="flex items-center gap-2 mt-3">
                        <a href="UpdateCartServlet?pid=<%=product.getPid()%>&action=dec"
                           class="w-8 h-8 flex items-center justify-center rounded-full bg-gray-200 hover:bg-gray-300">
                            −
                        </a>

                        <span class="w-8 text-center font-medium">
                            <%=quantity%>
                        </span>

                        <a href="UpdateCartServlet?pid=<%=product.getPid()%>&action=inc"
                           class="w-8 h-8 flex items-center justify-center rounded-full bg-gray-200 hover:bg-gray-300">
                            +
                        </a>

                        <a href="UpdateCartServlet?pid=<%=product.getPid()%>&action=remove"
                           class="ml-4 text-sm text-red-600 hover:underline">
                            Remove
                        </a>
                    </div>
                </div>

                <div class="text-right text-lg font-semibold">
                    ₹ <%=subTotal%>
                </div>
            </div>

        <%
            }
        %>

        </div>

        <!-- ================= ORDER SUMMARY ================= -->
        <div class="bg-white border rounded-xl p-6 shadow-sm h-fit sticky top-24">

            <h3 class="text-xl font-semibold mb-4">Order Summary</h3>

            <div class="flex justify-between text-gray-600 mb-2">
                <span>Items Total</span>
                <span>₹ <%=totalAmount%></span>
            </div>

            <div class="flex justify-between text-gray-600 mb-2">
                <span>Delivery</span>
                <span class="text-green-600">FREE</span>
            </div>

            <hr class="my-4">

            <div class="flex justify-between text-lg font-bold mb-6">
                <span>Grand Total</span>
                <span>₹ <%=totalAmount%></span>
            </div>

            <a href="<%=request.getContextPath()%>/user/selectPayment.jsp"
               class="block text-center bg-green-600 hover:bg-green-700 text-white py-3 rounded-lg font-semibold transition">
                Buy Now
            </a>
        </div>

    </div>

<%
    } else {
%>

    <!-- ================= EMPTY CART ================= -->
    <div class="text-center py-24">
        <div class="text-5xl mb-4">🛒</div>
        <p class="text-xl font-semibold mb-2">Your cart is empty</p>
        <p class="text-gray-500">Add items to your cart to continue shopping</p>
    </div>

<%
    }
%>

</div>
