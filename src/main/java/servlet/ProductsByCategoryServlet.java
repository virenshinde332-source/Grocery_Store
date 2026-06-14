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

@WebServlet("/ProductsByCategory")
public class ProductsByCategoryServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    int cid = Integer.parseInt(request.getParameter("cid"));

    Session session = HibernateUtil.getFactory().openSession();
    Query<Product> q = session.createQuery(
        "from Product where category.cid = :cid", Product.class);
    q.setParameter("cid", cid);

    List<Product> products = q.list();
    session.close();

    request.setAttribute("products", products);
    request.getRequestDispatcher("/user/products.jsp").forward(request, response);
}
}
