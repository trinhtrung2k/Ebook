package com.trinhtrung.admin.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.BookDaoImpl;
import com.trinhtrung.Entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/add_books")
@MultipartConfig
public class AddBook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = req.getParameter("categories");
            String status = req.getParameter("status");
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();
            BookDtls b = new BookDtls(bookName,author,price,categories,status,fileName,"admin");

            BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
            boolean f= dao.addBooks(b);
            HttpSession session = req.getSession();
            session.setAttribute("notifyMsg","");


            if (f){
                //file img
                String path = getServletContext().getRealPath("")+ "book";
                File file = new File(path);
                System.out.println(file);
                part.write(path + File.separator + fileName);
                session.setAttribute("notifyMsg","Book Add Successfully");
                resp.sendRedirect("admin/add_books.jsp");

            }else {
                session.setAttribute("notifyMsg","Something wrong on server");
                resp.sendRedirect("admin/add_books.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
