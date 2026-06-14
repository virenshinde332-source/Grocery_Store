package servlet;

import java.io.IOException;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Product;
import util.HibernateUtil;

@WebServlet("/ProductDetailsServlet")
public class ProductDetailsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Session session = HibernateUtil.getFactory().openSession();

        Product product = session.get(Product.class, id);

        session.close();

        request.setAttribute("product", product);

        request.getRequestDispatcher("/user/product-details.jsp")
               .forward(request, response);
    }
}