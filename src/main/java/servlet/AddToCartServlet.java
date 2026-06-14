package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String contextPath = request.getContextPath();

        String pidParam = request.getParameter("pid");
        String qtyParam = request.getParameter("qty");

        // Validate Product ID
        if (pidParam == null || pidParam.isEmpty()) {
            response.sendRedirect(contextPath + "/user/home.jsp");
            return;
        }

        int pid;
        int qty = 1;

        try {
            pid = Integer.parseInt(pidParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(contextPath + "/user/home.jsp");
            return;
        }

        // Validate Quantity
        try {
            if (qtyParam != null) {
                qty = Integer.parseInt(qtyParam);
                if (qty < 1) {
                    qty = 1;
                }
            }
        } catch (NumberFormatException e) {
            qty = 1;
        }

        HttpSession session = request.getSession();

        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        // Add product to cart
        cart.put(pid, cart.getOrDefault(pid, 0) + qty);

        session.setAttribute("cart", cart);

        // Safe redirect
        String referer = request.getHeader("referer");

        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(contextPath + "/CartServlet");
        }
    }
}