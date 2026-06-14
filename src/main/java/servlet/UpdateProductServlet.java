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
import jakarta.servlet.http.Part;
import model.Category;
import model.Product;
import util.HibernateUtil;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pid = Integer.parseInt(request.getParameter("pid"));

	    Session session = HibernateUtil.getFactory().openSession();
	    Transaction tx = session.beginTransaction();

	    Product p = session.get(Product.class, pid);

	    p.setPname(request.getParameter("pname"));
	    p.setPrice(Double.parseDouble(request.getParameter("price")));
	    p.setQuantity(Integer.parseInt(request.getParameter("quantity")));

	    int catId = Integer.parseInt(request.getParameter("categoryId"));
	    Category c = session.get(Category.class, catId);
	    p.setCategory(c);

	    Part part = request.getPart("image");

	    if (part != null && part.getSize() > 0) {
	        // delete old image
	        String oldImage = p.getImage();
	        if (oldImage != null) {
	            File oldFile = new File(getServletContext()
	                .getRealPath("/uploads/products/") + oldImage);
	            if (oldFile.exists()) oldFile.delete();
	        }

	        // save new image
	        String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
	        String path = getServletContext()
	                .getRealPath("/uploads/products/") + fileName;

	        part.write(path);
	        p.setImage(fileName);
	    }


        session.update(p);
        tx.commit();
        session.close();

        response.sendRedirect("/ViewProductServlet");
	}
}
