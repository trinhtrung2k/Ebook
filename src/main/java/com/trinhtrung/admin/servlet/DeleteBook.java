package com.trinhtrung.admin.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.BookDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete")
public class DeleteBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
            boolean f = dao.delete(id);
            HttpSession session =req.getSession();

            session.setAttribute("Msg","");
            if (f){
                session.setAttribute("Msg","Book Detele Successfully...");
                resp.sendRedirect("admin/all_books.jsp");

            }else {
                session.setAttribute("Msg","SomeThing wrong on server...");
                resp.sendRedirect("admin/all_books.jsp");
            }
        }catch (Exception e){
                e.printStackTrace();
        }
    }
}
