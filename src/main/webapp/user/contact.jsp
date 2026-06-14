<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us | Apna Grocery</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<%@ include file="navbar.jsp" %>

<section class="bg-white py-12 px-6 md:px-16 lg:px-24">
    <div class="max-w-5xl mx-auto">

        <h1 class="text-3xl font-bold text-gray-800 mb-6">Contact Us</h1>

        <p class="text-gray-600 mb-8">
            Have questions or need help? We’d love to hear from you.
        </p>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">

            <!-- Contact Info -->
            <div>
                <h2 class="text-xl font-semibold mb-4">Get in Touch</h2>

                <p class="text-gray-600 mb-3">📍 Pune, Maharashtra, India</p>
                <p class="text-gray-600 mb-3">📞 +91 98765 43210</p>
                <p class="text-gray-600 mb-3">📧 support@apnagrocery.com</p>
            </div>

            <!-- Contact Form -->
            <form class="space-y-4">
                <input type="text" placeholder="Your Name"
                       class="w-full border rounded px-4 py-2" required>

                <input type="email" placeholder="Your Email"
                       class="w-full border rounded px-4 py-2" required>

                <textarea placeholder="Your Message"
                          class="w-full border rounded px-4 py-2 h-28"
                          required></textarea>

                <button type="submit"
                        class="bg-green-600 text-white px-6 py-2 rounded hover:bg-green-700">
                    Send Message
                </button>
            </form>

        </div>
    </div>
</section>

</body>
</html>
