package servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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

@WebServlet("/editProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 5,   // 5MB
    maxRequestSize = 1024 * 1024 * 10
)
public class editProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //  Load product data (GET)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int pid = Integer.parseInt(request.getParameter("id"));

        Session session = HibernateUtil.getFactory().openSession();

        Product product = session.get(Product.class, pid);

        Query<Category> q = session.createQuery("from Category", Category.class);
        List<Category> categories = q.list();

        session.close();

        request.setAttribute("product", product);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/admin/editProduct.jsp")
               .forward(request, response);
    }

    //  Update product (POST)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int pid = Integer.parseInt(request.getParameter("pid"));
        String pname = request.getParameter("pname");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryId = Integer.parseInt(request.getParameter("cid"));

        Part imagePart = request.getPart("image"); // file input name="image"

        Session session = HibernateUtil.getFactory().openSession();
        Transaction tx = session.beginTransaction();

        Product product = session.get(Product.class, pid);
        Category category = session.get(Category.class, categoryId);

        product.setPname(pname);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setCategory(category);

        //  IMAGE UPDATE LOGIC
        if (imagePart != null && imagePart.getSize() > 0) {

            // delete old image
            String oldImage = product.getImage();
            if (oldImage != null && !oldImage.isEmpty()) {
                String oldPath = getServletContext()
                        .getRealPath("/uploads/products/") + oldImage;
                File oldFile = new File(oldPath);
                if (oldFile.exists()) {
                    oldFile.delete();
                }
            }

            // save new image
            String fileName = System.currentTimeMillis() + "_"
                    + imagePart.getSubmittedFileName();

            String uploadPath = getServletContext()
                    .getRealPath("/uploads/products/");

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            imagePart.write(uploadPath + fileName);

            product.setImage(fileName);
        }

        session.update(product);
        tx.commit();
        session.close();

        response.sendRedirect(request.getContextPath() + "/ViewProductServlet");
    }
}
