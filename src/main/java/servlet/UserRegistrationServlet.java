package servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.HibernateUtil;

@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		Session s=HibernateUtil.getFactory().openSession();

        Query<User> query = s.createQuery("from User where email = :email", User.class);
        query.setParameter("email", email);

        User existingUser = query.uniqueResult();

        if (existingUser != null) {
            request.setAttribute("msg", "Account already exists with this email");
            RequestDispatcher rd = request.getRequestDispatcher("user/userRegister.jsp");
            rd.forward(request, response);
        } else {
        	
        	Transaction t=s.beginTransaction();
    		User u=new User();
    		u.setName(request.getParameter("name"));
    		u.setEmail(request.getParameter("email"));
    		u.setPassword(request.getParameter("password"));
    		u.setAddress(request.getParameter("address"));
    		u.setPhone(request.getParameter("phone"));
    	
    		s.save(u);t.commit();
            response.sendRedirect("user/userLogin.jsp");
        }	
		s.close();
	}
}
