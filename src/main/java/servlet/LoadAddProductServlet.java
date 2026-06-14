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
import util.HibernateUtil;

@WebServlet("/LoadAddProductServlet")
public class LoadAddProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Session session = HibernateUtil.getFactory().openSession();
        List<Category> list =
            session.createQuery("from Category", Category.class).list();
        session.close();

        request.setAttribute("categories", list);
        request.getRequestDispatcher("/admin/addProduct.jsp")
               .forward(request, response);
    }
}
