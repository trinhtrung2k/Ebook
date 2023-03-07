package com.trinhtrung.user.servlet;

import com.trinhtrung.DB.DBConnect;
import com.trinhtrung.Dao.Impl.UserDaoImpl;
import com.trinhtrung.Dao.UserDao;
import com.trinhtrung.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/update_profile")
public class UpdateProfileServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id =Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            User user = new User();
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            UserDaoImpl dao = new UserDaoImpl(DBConnect.getConn());
            HttpSession session = req.getSession();
            boolean f = dao.checkPassword(id,password);
            session.setAttribute("updateSucMsg","");

            session.setAttribute("updateFailedMsg","");

            session.setAttribute("icrUpdateMsg","");

            if (f){
                boolean f1 = dao.updateProfile(user);
                if (f1){
                    session.setAttribute("updateSucMsg"," Profile Update Successfully..");
                    resp.sendRedirect("edit_profile.jsp");
                }else {
                    session.setAttribute("updateFailedMsg","Something wrong on server");
                    resp.sendRedirect("edit_profile.jsp");
                }
            }else {
                session.setAttribute("icrUpdateMsg","Your Password Incorrect..");
                resp.sendRedirect("edit_profile.jsp");
            }



        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
