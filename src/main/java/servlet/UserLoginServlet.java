package servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.query.Query;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.HibernateUtil;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 private static final String ADMIN_USERNAME = "admin123@gmail.com";
	 private static final String ADMIN_PASSWORD = "admin123";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	
		String useremail = request.getParameter("email");
        String password = request.getParameter("password");

        /* ================= ADMIN LOGIN ================= */
        if (ADMIN_USERNAME.equals(useremail) && ADMIN_PASSWORD.equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("admin", "ADMIN");

            response.sendRedirect(request.getContextPath() + "/admin/adminDashboard.jsp");
            return;
        }

        /* ================= USER LOGIN ================= */
        Session hibernateSession = HibernateUtil.getFactory().openSession();

        Query<User> q = hibernateSession.createQuery(
            "from User where email=:e and password=:p", User.class);
        q.setParameter("e", useremail);
        q.setParameter("p", password);

        User user = q.uniqueResult();
        hibernateSession.close();

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            request.setAttribute("msg", "Invalid Username or Password");
            request.getRequestDispatcher("/user/userLogin.jsp")
                   .forward(request, response);
        }
    }
}
