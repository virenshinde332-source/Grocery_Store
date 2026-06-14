package servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.User;
import util.HibernateUtil;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int id = Integer.parseInt(request.getParameter("id"));
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

if(!newPassword.equals(confirmPassword)){

response.sendRedirect("user/changePassword.jsp?error=passwordMismatch");
return;
}

Session session = null;
Transaction tx = null;

try{

session = HibernateUtil.getFactory().openSession();
tx = session.beginTransaction();

User user = session.get(User.class, id);

if(user != null && user.getPassword().equals(oldPassword)){

user.setPassword(newPassword);

session.update(user);
tx.commit();

response.sendRedirect("user/profile.jsp?msg=PasswordChanged");

}else{

tx.rollback();
response.sendRedirect("user/changePassword.jsp?error=WrongPassword");

}

}catch(Exception e){

if(tx != null) tx.rollback();
e.printStackTrace();

}finally{

if(session != null) session.close();

}

}
}