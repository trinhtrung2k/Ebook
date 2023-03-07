package com.trinhtrung.Dao;

import com.trinhtrung.Entity.User;

public interface UserDao {
    public boolean userRegister(User user);
    public User login(String email, String password);
    public boolean checkPassword( int id,String ps);
    public boolean updateProfile(User user);
    public boolean checkUser(String email);
}
