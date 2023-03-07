package com.trinhtrung.user.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.BookDaoImpl;
import com.trinhtrung.Entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete_old_book")
public class DeteleOldBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            int id = Integer.parseInt(req.getParameter("id"));
            BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
            boolean f = dao.oldBookDelete("Old", email,id);
            HttpSession session = req.getSession();
            session.setAttribute("rmOldSucMsg", "");
            session.setAttribute("rmOldFailedMsg", "");
            if (f) {
                session.setAttribute("rmOldSucMsg", "Old Book Delete Successfully");
                resp.sendRedirect("old_book.jsp");
            } else {
                session.setAttribute("rmOldFailedMsg", "Something wrong on server");
                resp.sendRedirect("old_book.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
