package servlet;

import java.io.File;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Category;
import util.HibernateUtil;

@WebServlet("/EditCategoryServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 5,   // 5MB
    maxRequestSize = 1024 * 1024 * 10
)

public class EditCategoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // 🔹 LOAD CATEGORY DATA
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cid = Integer.parseInt(request.getParameter("id"));

        Session session = HibernateUtil.getFactory().openSession();

        Category category = session.get(Category.class, cid);

        session.close();

        request.setAttribute("category", category);

        request.getRequestDispatcher("/admin/editCategory.jsp")
               .forward(request, response);
    }

    // 🔹 UPDATE CATEGORY
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cid = Integer.parseInt(request.getParameter("cid"));
        String cname = request.getParameter("cname");

        Part imagePart = request.getPart("image");

        Session session = HibernateUtil.getFactory().openSession();
        Transaction tx = session.beginTransaction();

        Category category = session.get(Category.class, cid);

        category.setCname(cname);

        //  IMAGE UPDATE LOGIC
        if (imagePart != null && imagePart.getSize() > 0) {

            // delete old image
            String oldImage = category.getImage();

            if (oldImage != null && !oldImage.isEmpty()) {

                String oldPath = getServletContext()
                        .getRealPath("/uploads/categories/") + oldImage;

                File oldFile = new File(oldPath);

                if (oldFile.exists()) {
                    oldFile.delete();
                }
            }

            // save new image
            String fileName = System.currentTimeMillis() + "_"
                    + imagePart.getSubmittedFileName();

            String uploadPath = getServletContext()
                    .getRealPath("/uploads/categories/");

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            imagePart.write(uploadPath + fileName);

            category.setImage(fileName);
        }

        session.update(category);

        tx.commit();
        session.close();

        response.sendRedirect(request.getContextPath() + "/ViewCategoryServlet");
    }
}