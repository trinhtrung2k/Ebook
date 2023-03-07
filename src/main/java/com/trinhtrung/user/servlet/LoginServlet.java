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

@WebServlet("/login")
public class LoginServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try{
           UserDaoImpl userDao = new UserDaoImpl(DBConnect.getConn());
           HttpSession session = req.getSession();
           String email = req.getParameter("email");
           String password = req.getParameter("password");

           session.setAttribute("failedMsg", "");
           if ("admin@gmail.com".equals(email) &&"admin".equals(password)){
               User user1 = new User();
               user1.setName("Admin");
               session.setAttribute("userobj",user1);
               resp.sendRedirect("admin/home.jsp");
           }else {
               User user = userDao.login(email,password);
               if(user != null){
                   session.setAttribute("userobj", user);
                   resp.sendRedirect("index.jsp");

               }else {
                   session.setAttribute("failedMsg", "Email & Password Invalid");
                   resp.sendRedirect("login.jsp");
               }
           }

           System.out.println(email + password);
       }catch (Exception e){
           e.printStackTrace();
       }
    }
}
