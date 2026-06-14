package servlet;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import util.HibernateUtil;

@WebServlet("/ViewCategoryServlet")
public class ViewCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getFactory().openSession();

        Query<Category> q = session.createQuery("from Category", Category.class);
        List<Category> list = q.list();

        session.close();

        request.setAttribute("categories", list);
        request.getRequestDispatcher("admin/viewCategories.jsp").forward(request, response);
	}
}
