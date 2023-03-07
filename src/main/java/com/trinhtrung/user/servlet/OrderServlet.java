package com.trinhtrung.user.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.BookDaoImpl;
import com.trinhtrung.Dao.Impl.BookOrderDaoImpl;
import com.trinhtrung.Dao.Impl.CartDaoImpl;
import com.trinhtrung.Entity.BookDtls;
import com.trinhtrung.Entity.Book_Order;
import com.trinhtrung.Entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/order")
public class  OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {


            int id = Integer.parseInt(req.getParameter("id"));
            String name=req.getParameter("username");
            String email=req.getParameter("email");
            String phone=req.getParameter("phone");
            String address=req.getParameter("address");
            String landmark=req.getParameter("landmark");
            String city=req.getParameter("city");
            String state=req.getParameter("state");
            String pinCode=req.getParameter("pincode");
            String paymentType =req.getParameter("payment");

            CartDaoImpl dao =new CartDaoImpl(DBConnect.getConn());

            List<Cart> cartList =  dao.getBookByUser(id);
            HttpSession session = req.getSession();
            session.setAttribute("orderEmptyMsg","");
            if (cartList.isEmpty()){
                session.setAttribute("orderEmptyMsg","Add Item");
                resp.sendRedirect("checkout.jsp");
            }else {
                BookOrderDaoImpl dao1 = new BookOrderDaoImpl(DBConnect.getConn());

                Book_Order book_order = null;


                ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
                Random random = new Random();
                for (Cart c:cartList){
                    book_order = new Book_Order();
                    book_order.setOrderId("BOOK-ORD-00" + random.nextInt(1000));
                    book_order.setUsername(name);
                    book_order.setEmail(email);
                    book_order.setPhone(phone);
                    book_order.setFulladd(address);
                    book_order.setBookName(c.getBookName());
                    book_order.setAuthor(c.getAuthor());
                    book_order.setPrice(c.getPrice() + "");
                    book_order.setPaymentType(paymentType);
                    orderList.add(book_order);

                }

                session.setAttribute("orderMsg","");
                session.setAttribute("orderFailedMsg","");
                if ("noselect".equals(paymentType)){
                    session.setAttribute("orderMsg","Choose Payment Method");
                    resp.sendRedirect("checkout.jsp");
                }else{
                    boolean f = dao1.saveOrder(orderList);
                    if (f){
                        resp.sendRedirect("order_success.jsp");
                    }else {
                        session.setAttribute("orderFailedMsg","Choose Payment Method");
                        resp.sendRedirect("checkout.jsp");
                    }
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
