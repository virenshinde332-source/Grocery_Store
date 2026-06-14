package servlet;

import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import util.HibernateUtil;


@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int oid = Integer.parseInt(request.getParameter("oid"));
        String status = request.getParameter("status");

        Session session = HibernateUtil.getFactory().openSession();
        Transaction tx = session.beginTransaction();

        Order order = session.get(Order.class, oid);
        if (order != null) {
            order.setStatus(status);
            session.update(order);
        }

        tx.commit();
        session.close();

        response.sendRedirect(request.getContextPath() + "/ViewOrdersServlet");
    }
}
