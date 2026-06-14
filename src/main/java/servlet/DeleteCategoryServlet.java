package servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import util.HibernateUtil;

@WebServlet("/deleteCategory")
public class DeleteCategoryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		Session session = HibernateUtil.getFactory().openSession();
		Transaction tx = session.beginTransaction();

		try {
			Long productCount = (Long) session
					.createQuery("select count(p.id) from Product p where p.category.id = :catId")
					.setParameter("catId", id).uniqueResult();

			if (productCount > 0) {

				tx.rollback();
				session.close();

				request.setAttribute("error", "Cannot delete category. Products exist. If you want please delete all products first.");
				request.getRequestDispatcher("/ViewCategoryServlet").forward(request, response);
				return;
			}

			Category c = session.get(Category.class, id);
			if (c != null) {
				session.delete(c);
			}

			tx.commit();

		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}

		session.close();

		response.sendRedirect(request.getContextPath() + "/ViewCategoryServlet");
	}
}
