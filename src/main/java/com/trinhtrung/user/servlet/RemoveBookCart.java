package com.trinhtrung.user.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.CartDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {
           int bid = Integer.parseInt(req.getParameter("bid"));
           int uid = Integer.parseInt(req.getParameter("uid"));
           int cid = Integer.parseInt(req.getParameter("cid"));
           CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
           boolean f = dao.deleteBook(bid,uid,cid);
           HttpSession session = req.getSession();
           session.setAttribute("rmSucMsg", "");
           session.setAttribute("rmFailedMsg", "");
           if (f) {
               session.setAttribute("rmSucMsg", "Book Removed  from Cart");
               resp.sendRedirect("checkout.jsp");
           } else {
               session.setAttribute("rmFailedMsg", "Something wrong on server");
               resp.sendRedirect("checkout.jsp");

           }
       }catch (Exception e){
           e.printStackTrace();
       }

    }
}
