package com.trinhtrung.Dao.Impl;

import com.trinhtrung.Dao.UserDao;
import com.trinhtrung.Entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDaoImpl implements UserDao {
    private Connection conn;

    public UserDaoImpl(Connection conn) {
        this.conn = conn;
    }

    public boolean userRegister(User user) {
        boolean f = false;
        try {
            String sql = " insert into user(name,email,phone,password) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPhone());
            ps.setString(4,user.getPassword());

            int i = ps.executeUpdate();
            if (i==1){
                f=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    public User login(String email, String password) {
        User user = null;
        boolean f=false;
        try {
            String sql = "select * from user where email=? and password =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPhone(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setLandmark(rs.getString(7));
                user.setCity(rs.getString(8));
                user.setState(rs.getString(9));
                user.setPincode(rs.getString(10));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean checkPassword(int id,String pw) {
        boolean f = false;
        try {
            String sql = "select * from user where id=? and password =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            ps.setString(2,pw);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                f = true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean updateProfile(User user) {
        boolean f = false;
        try {
            String sql = " update user set name = ?, email=?,phone=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPhone());
            ps.setInt(4,user.getId());
            int i = ps.executeUpdate();
            if (i==1){
                f=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean checkUser(String email) {
        boolean f = false;
        try {
            String sql = "select * from user where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,email);
            ResultSet rs =ps.executeQuery();
            while (rs.next()){
                f=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
