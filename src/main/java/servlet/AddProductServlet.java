package servlet;

import java.io.File;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Category;
import model.Product;
import util.HibernateUtil;

@WebServlet("/AddProductServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1MB
	    maxFileSize = 1024 * 1024 * 5,   // 5MB
	    maxRequestSize = 1024 * 1024 * 10
	)
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pname = request.getParameter("pname");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryId = Integer.parseInt(request.getParameter("cid"));

        // Image upload
        Part part = request.getPart("image");
        String fileName = System.currentTimeMillis() + "_" +
                          part.getSubmittedFileName();

        String uploadPath =
        	    getServletContext().getRealPath("/uploads/products/");
        
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        part.write(uploadPath + File.separator + fileName);
        

        Session session = HibernateUtil.getFactory().openSession();
        Transaction tx = session.beginTransaction();

        Category category = session.get(Category.class, categoryId);

        Product p = new Product();
        p.setPname(pname);
        p.setPrice(price);
        p.setQuantity(quantity);
        p.setCategory(category);
        p.setImage(fileName);
        
        session.save(p);
        tx.commit();
        session.close();

        response.sendRedirect("ViewProductServlet");
    }
}
