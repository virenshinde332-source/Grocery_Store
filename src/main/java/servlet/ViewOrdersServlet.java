package servlet;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import util.HibernateUtil;

@WebServlet("/ViewOrdersServlet")
public class ViewOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Session session = HibernateUtil.getFactory().openSession();
        
        List<Order> orders = session.createQuery(
            "select distinct o from Order o left join fetch o.items",
            Order.class
        ).list();

        session.close(); 

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/viewOrders.jsp").forward(request, response);

    }
}
