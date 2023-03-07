package com.trinhtrung.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static Connection conn = null;
    public static Connection getConn(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3310/ebook","root","123456");

        }catch (Exception e){
            System.out.println("khong thanh cong");
            e.printStackTrace();
        }
        return conn;
    }
}
