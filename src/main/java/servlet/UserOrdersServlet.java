package servlet;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Order;
import model.User;
import util.HibernateUtil;

@WebServlet("/UserOrdersServlet")
public class UserOrdersServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

User user = (User) request.getSession().getAttribute("user");

if (user == null) {
    response.sendRedirect("user/userLogin.jsp");
    return;
}

Session session = HibernateUtil.getFactory().openSession();

Query<Order> q = session.createQuery(
"from Order where userName = :uname", Order.class);

q.setParameter("uname", user.getName());

List<Order> orders = q.list();

session.close();

request.setAttribute("orders", orders);

request.getRequestDispatcher("/user/orders.jsp")
.forward(request, response);

}
}