<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us | Apna Grocery</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

    <!-- Navbar (optional include) -->
    <%@ include file="navbar.jsp" %> 

    <!-- About Section -->
    <section class="bg-white py-12 px-6 md:px-16 lg:px-24">
        <div class="max-w-6xl mx-auto">

            <h1 class="text-3xl font-bold text-gray-800 mb-6">
                About Apna Grocery
            </h1>

            <p class="text-gray-600 leading-relaxed mb-5">
                Welcome to <span class="font-semibold text-green-600">Apna Grocery</span>,
                your trusted local grocery store for fresh vegetables, fruits,
                daily essentials, and household products. We aim to make grocery
                shopping simple, affordable, and reliable for every household.
            </p>

            <p class="text-gray-600 leading-relaxed mb-5">
                Inspired by the traditional Indian kirana store, Apna Grocery
                brings the same trust and quality to an online platform.
                We carefully select products to ensure freshness, hygiene,
                and value for money.
            </p>

            <p class="text-gray-600 leading-relaxed mb-8">
                Whether you are shopping for daily groceries or monthly essentials,
                we are committed to delivering quality products with excellent
                customer service.
            </p>

            <!-- Highlights -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

                <div class="border rounded-lg p-6 text-center">
                    <h3 class="text-lg font-semibold text-gray-800 mb-2">
                        🥦 Fresh & Quality
                    </h3>
                    <p class="text-gray-600 text-sm">
                        We ensure fresh produce and quality products
                        for your daily needs.
                    </p>
                </div>

                <div class="border rounded-lg p-6 text-center">
                    <h3 class="text-lg font-semibold text-gray-800 mb-2">
                        🛒 Easy Shopping
                    </h3>
                    <p class="text-gray-600 text-sm">
                        Simple navigation, quick ordering,
                        and a smooth shopping experience.
                    </p>
                </div>

                <div class="border rounded-lg p-6 text-center">
                    <h3 class="text-lg font-semibold text-gray-800 mb-2">
                        🤝 Trusted Service
                    </h3>
                    <p class="text-gray-600 text-sm">
                        Built on trust, transparency,
                        and customer satisfaction.
                    </p>
                </div>

            </div>

        </div>
    </section>

    <!-- Footer (optional) -->
    <footer class="bg-gray-900 text-gray-300 text-center py-4 mt-12">
        <p class="text-sm">
            © 2026 Apna Grocery. All rights reserved.
        </p>
    </footer>

</body>
</html>
