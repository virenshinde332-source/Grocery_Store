<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Payment Method</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center">

    <div class="bg-white shadow-lg rounded-xl p-10 max-w-md w-full text-center">
        <h2 class="text-3xl font-bold text-gray-800 mb-6">Select Payment Method 💳</h2>
        <p class="text-gray-500 mb-8">Choose how you would like to pay for your order.</p>

        <form action="<%= request.getContextPath() %>/PlaceOrderServlet" method="post">
            <div class="flex flex-col gap-4 mb-6 text-left">

                <label class="flex items-center gap-3 cursor-pointer bg-gray-100 p-4 rounded hover:bg-gray-200 transition">
                    <input type="radio" name="paymentMode" value="COD" required class="form-radio h-5 w-5 text-green-600">
                    <span class="text-gray-700 font-medium">Cash on Delivery (COD)</span>
                </label>

                <label class="flex items-center gap-3 cursor-pointer bg-gray-100 p-4 rounded hover:bg-gray-200 transition">
                    <input type="radio" name="paymentMode" value="UPI" required class="form-radio h-5 w-5 text-green-600">
                    <span class="text-gray-700 font-medium">UPI / QR Payment</span>
                </label>

                <label class="flex items-center gap-3 cursor-pointer bg-gray-100 p-4 rounded hover:bg-gray-200 transition">
                    <input type="radio" name="paymentMode" value="Card" required class="form-radio h-5 w-5 text-green-600">
                    <span class="text-gray-700 font-medium">Credit / Debit Card</span>
                </label>

            </div>

            <button type="submit"
                    class="w-full px-6 py-3 bg-green-600 text-white rounded-full font-semibold hover:bg-green-700 transition">
                Confirm & Pay
            </button>
        </form>
    </div>

</body>
</html>
