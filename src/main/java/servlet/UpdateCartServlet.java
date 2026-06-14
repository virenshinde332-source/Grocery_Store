package servlet;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int pid = Integer.parseInt(request.getParameter("pid"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart != null && cart.containsKey(pid)) {

            int qty = cart.get(pid);

            if ("inc".equals(action)) {
                cart.put(pid, qty + 1);
            }
            else if ("dec".equals(action)) {
                if (qty > 1) {
                    cart.put(pid, qty - 1);
                } else {
                    cart.remove(pid);
                }
            }
            else if ("remove".equals(action)) {
                cart.remove(pid);
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("ViewCartServlet");
    }
}
