package servlet;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
import util.HibernateUtil;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Session session = HibernateUtil.getFactory().openSession();

        List<Category> categories =
            session.createQuery("from Category", Category.class).list();

        List<Product> featuredProducts =
            session.createQuery("from Product", Product.class)
                   .setMaxResults(8)
                   .list();

        session.close();

        request.setAttribute("categories", categories);
        request.setAttribute("featuredProducts", featuredProducts);

        request.getRequestDispatcher("/user/home.jsp")
               .forward(request, response);
    }
}
