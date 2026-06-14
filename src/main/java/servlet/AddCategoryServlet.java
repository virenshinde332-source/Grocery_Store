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
import util.HibernateUtil;

@WebServlet("/AddCategoryServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5,   // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class AddCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET to load edit form
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));

        Session session = HibernateUtil.getFactory().openSession();
        Category category = session.get(Category.class, cid);
        session.close();

        if (category == null) {
            response.getWriter().println("Category not found!");
            return;
        }

        request.setAttribute("category", category);
        request.getRequestDispatcher("addCategory.jsp").forward(request, response);
    }

    // Handle POST to save edits
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String cidStr = request.getParameter("cid"); // might be "" for new category
    	String cname = request.getParameter("cname");

    	Part part = request.getPart("image");
    	String fileName = null;
    	if (part != null && part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
    	    fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
    	    String uploadPath = getServletContext().getRealPath("/uploads/categories");
    	    File uploadDir = new File(uploadPath);
    	    if (!uploadDir.exists()) uploadDir.mkdirs();
    	    part.write(uploadPath + File.separator + fileName);
    	}

    	Session session = HibernateUtil.getFactory().openSession();
    	Transaction tx = session.beginTransaction();

    	if (cidStr == null || cidStr.isEmpty()) {
    	    // NEW CATEGORY
    	    Category category = new Category();
    	    category.setCname(cname);
    	    category.setImage(fileName);
    	    session.save(category);
    	} else {
    	    // EDIT CATEGORY
    	    int cid = Integer.parseInt(cidStr);
    	    Category category = session.get(Category.class, cid);
    	    if (category != null) {
    	        category.setCname(cname);
    	        if (fileName != null) {
    	            // Delete old image
    	            String oldImage = category.getImage();
    	            if (oldImage != null) {
    	                File oldFile = new File(getServletContext().getRealPath("/uploads/categories") + File.separator + oldImage);
    	                if (oldFile.exists()) oldFile.delete();
    	            }
    	            category.setImage(fileName);
    	        }
    	        session.update(category);
    	    }
    	}

    	tx.commit();
    	session.close();

    	// Redirect to view categories
    	response.sendRedirect("ViewCategoryServlet");
    }
}
