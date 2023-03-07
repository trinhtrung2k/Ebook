package com.trinhtrung.admin.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.BookDaoImpl;
import com.trinhtrung.Entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/edit_books")
public class EditBook  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String status = req.getParameter("status");

            BookDtls b= new BookDtls();
            b.setBookId(id);
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice(price);
            b.setStatus(status);

            BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
            boolean f = dao.updateEditBooks(b);
            HttpSession session =req.getSession();
            session.setAttribute("succMsg","");
            session.setAttribute("failedMsg","");

            if (f){
                session.setAttribute("succMsg","Book Update Successfully...");
                resp.sendRedirect("admin/all_books.jsp");

            }else {
                session.setAttribute("failedMsg","SomeThing wrong on server...");
                resp.sendRedirect("admin/all_books.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
