package servlet;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.OrderItem;
import util.HibernateUtil;

@WebServlet("/OrderDetailsServlet")
public class OrderDetailsServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int oid = Integer.parseInt(request.getParameter("id"));

Session session = HibernateUtil.getFactory().openSession();

Query<OrderItem> q = session.createQuery(
"from OrderItem where order.id=:oid", OrderItem.class);

q.setParameter("oid", oid);

List<OrderItem> items = q.list();

session.close();

request.setAttribute("items", items);

request.getRequestDispatcher("/user/orderDetails.jsp")
.forward(request, response);

}
}