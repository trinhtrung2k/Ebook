package com.trinhtrung.user.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.UserDaoImpl;
import com.trinhtrung.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            System.out.println(name + " " + email + " " +phone + " " + password + " " + check);

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);

            HttpSession session =req.getSession();
            session.setAttribute("userSuccMsg","");
            session.setAttribute("userFailedMsg","");
            session.setAttribute("emailMsg","");
            session.setAttribute("termMsg","");

            if (check != null){
                UserDaoImpl dao = new UserDaoImpl(DBConnect.getConn());
                boolean checkuser = dao.checkUser(email);
                if (!checkuser){
                    boolean f = dao.userRegister(user);
                    if (f){
                        session.setAttribute("userSuccMsg","Registration Successfully..");
                        resp.sendRedirect("register.jsp");
                    }else {
                        session.setAttribute("userFailedMsg","Something wrong on server..");
                        resp.sendRedirect("register.jsp");
                    }
                }else {
                    session.setAttribute("emailMsg","User Already Exits Try Another Email id ");
                    resp.sendRedirect("register.jsp");
                }
            }else {
                session.setAttribute("termMsg","Please Check Agree & Terms Condition");
                resp.sendRedirect("register.jsp");
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
