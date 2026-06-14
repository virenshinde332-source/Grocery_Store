<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

    <div class="bg-white p-10 rounded-xl shadow-lg text-center max-w-md">
        <h2 class="text-4xl font-bold text-green-600 mb-6">🎉 Order Placed Successfully!</h2>
        <p class="text-gray-700 mb-8">Thank you for shopping with us. Your order has been placed and will be processed shortly.</p>
        <a href="<%=request.getContextPath()%>/home"
           class="px-6 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 transition font-semibold">
            Continue Shopping
        </a>
    </div>

</body>
</html>
