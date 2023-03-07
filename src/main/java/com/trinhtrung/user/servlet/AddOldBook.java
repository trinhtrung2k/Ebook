package com.trinhtrung.user.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.BookDaoImpl;
import com.trinhtrung.Entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String userEmail = req.getParameter("user");
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = "Old";
            String status = "Active";
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();
            BookDtls b = new BookDtls(bookName,author,price,categories,status,fileName,userEmail);

            BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
            boolean f= dao.addBooks(b);
            HttpSession session = req.getSession();
            session.setAttribute("sellSucBMsg","");
            session.setAttribute("sellFailedBMsg","");


            if (f){
                //file img
                String path = getServletContext().getRealPath("")+ "book";
                File file = new File(path);
                System.out.println(file);
                part.write(path + File.separator + fileName);
                session.setAttribute("sellSucBMsg","Book Add Successfully");
                resp.sendRedirect("sell_book.jsp");

            }else {
                session.setAttribute("sellFailedBMsg","Something wrong on server");
                resp.sendRedirect("sell_book.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
