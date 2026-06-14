package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Product;
import util.HibernateUtil;

@WebServlet("/ViewCartServlet")
public class ViewCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession httpSession = request.getSession();

        // Cart from session
        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) httpSession.getAttribute("cart");

        Map<Integer, Product> products = new HashMap<>();

        if (cart != null && !cart.isEmpty()) {
            Session hibernateSession = HibernateUtil.getFactory().openSession();

            for (Integer pid : cart.keySet()) {
                Product p = hibernateSession.get(Product.class, pid);
                if (p != null) {
                    products.put(pid, p);
                }
            }

            hibernateSession.close();
        }

        request.setAttribute("cart", cart);

        request.setAttribute("products", products);
        request.getRequestDispatcher("/user/cart.jsp").forward(request, response);
    }
}
