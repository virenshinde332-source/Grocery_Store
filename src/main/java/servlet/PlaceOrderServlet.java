package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Order;
import model.OrderItem;
import model.Product;
import model.User;
import util.HibernateUtil;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle GET: redirect to cart if accessed directly
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/ViewCartServlet");
    }

    // Handle POST: place order with payment
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession httpSession = request.getSession();

        //  Check login
        User user = (User) httpSession.getAttribute("user");
        if (user == null) {
            httpSession.setAttribute("msg1", "Please login to place order");
            response.sendRedirect(request.getContextPath() + "/user/userLogin.jsp");
            return;
        }

        //  Get cart
        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) httpSession.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/ViewCartServlet");
            return;
        }

        //  Get selected payment mode
        String paymentMode = request.getParameter("paymentMode");
        if (paymentMode == null || paymentMode.isEmpty()) {
            httpSession.setAttribute("msg1", "Please select a payment mode");
            response.sendRedirect(request.getContextPath() + "/user/selectPayment.jsp");
            return;
        }

        Session hibernateSession = HibernateUtil.getFactory().openSession();
        Transaction tx = hibernateSession.beginTransaction();

        //  Create Order
        Order order = new Order();
        order.setUserName(user.getName());
        order.setAddress(user.getAddress());
        order.setOrderDate(new Date());
        order.setStatus("Pending");
        order.setPaymentMode(paymentMode); // Save payment mode

        double total = 0;
        order.setTotalAmount(total);

        //  Save order first (important for foreign key)
        hibernateSession.save(order);

        //  Create Order Items
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {

            int pid = entry.getKey();
            int qty = entry.getValue();

            Product product = hibernateSession.get(Product.class, pid);
            if (product == null) continue;

            OrderItem item = new OrderItem();

            item.setProductId(product.getPid());
            item.setProductName(product.getPname());
            item.setProductPrice(product.getPrice());
            item.setProductImage(product.getImage());
            item.setQuantity(qty);
            item.setOrder(order);

            total += product.getPrice() * qty;

            hibernateSession.save(item);
        }

        //  Update total amount
        order.setTotalAmount(total);
        hibernateSession.update(order);

        tx.commit();
        hibernateSession.close();

        //  Clear cart
        httpSession.removeAttribute("cart");

        // Redirect to success page
        response.sendRedirect(request.getContextPath() + "/user/orderSuccess.jsp");
    }
}
