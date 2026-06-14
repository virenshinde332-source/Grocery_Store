package servlet;

import java.io.File;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import util.HibernateUtil;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pidStr = request.getParameter("pid");

        if (pidStr == null) {
            response.sendRedirect(request.getContextPath() + "/ViewProductServlet");
            return;
        }

        int pid = Integer.parseInt(pidStr);

        Session session = HibernateUtil.getFactory().openSession();
        Transaction tx = session.beginTransaction();

        Product p = session.get(Product.class, pid);

        if (p != null) {
            String img = p.getImage();
            if (img != null && !img.isEmpty()) {
                File file = new File(
                    getServletContext().getRealPath("/uploads/products/")
                    + File.separator + img
                );
                if (file.exists()) file.delete();
            }
            session.delete(p);
        }

        tx.commit();
        session.close();

        response.sendRedirect(request.getContextPath() + "/ViewProductServlet");
    }
}