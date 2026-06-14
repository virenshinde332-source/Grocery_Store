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
import model.Product;
import util.HibernateUtil;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("q");

        Session session = HibernateUtil.getFactory().openSession();

        Query<Product> query = session.createQuery(
            "from Product where pname like :key or category.cname like :key",
            Product.class
        );

        query.setParameter("key", "%" + keyword + "%");

        List<Product> products = query.list();

        session.close();

        request.setAttribute("products", products);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("/user/search.jsp")
               .forward(request, response);
    }
}
