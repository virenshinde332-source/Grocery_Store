package servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.User;
import util.HibernateUtil;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

Session session = HibernateUtil.getFactory().openSession();
Transaction tx = session.beginTransaction();

User user = session.get(User.class, id);

user.setName(name);
user.setEmail(email);
user.setPhone(phone);
user.setAddress(address);

session.update(user);

tx.commit();
session.close();

request.getSession().setAttribute("user", user);

response.sendRedirect(request.getContextPath()+"/user/profile.jsp");
}
}