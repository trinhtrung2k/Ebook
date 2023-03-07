package com.trinhtrung.user.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.BookDaoImpl;
import com.trinhtrung.Dao.Impl.CartDaoImpl;
import com.trinhtrung.Entity.BookDtls;
import com.trinhtrung.Entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bid=Integer.parseInt(req.getParameter("bid"));
            int uid=Integer.parseInt(req.getParameter("uid"));
            BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
            BookDtls b =dao.getBookById(bid);
            Cart c = new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDaoImpl dao1 = new CartDaoImpl(DBConnect.getConn());
            boolean f =dao1.addCart(c);

            HttpSession session = req.getSession();
            session.setAttribute("addCart","");
            session.setAttribute("failedCart","");
            if (f){
                session.setAttribute("addCart","Book Added to Cart");
                resp.sendRedirect("all_new_book.jsp");

            }else {
                session.setAttribute("failed","Something Wrong on server");
                resp.sendRedirect("all_new_book.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
