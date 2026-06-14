package servlet;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import util.HibernateUtil;


@WebServlet("/ViewProductServlet")
public class ViewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Session session = HibernateUtil.getFactory().openSession();
	        List<Product> list = session.createQuery("from Product", Product.class).list();
	        session.close();

	        request.setAttribute("products", list);
	        request.getRequestDispatcher("admin/adminViewProducts.jsp").forward(request, response);
	}
}
