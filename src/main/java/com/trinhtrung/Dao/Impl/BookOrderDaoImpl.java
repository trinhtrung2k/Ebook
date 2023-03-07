package com.trinhtrung.Dao.Impl;

import com.trinhtrung.Dao.BookOrderDao;
import com.trinhtrung.Entity.Book_Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookOrderDaoImpl implements BookOrderDao {
    private Connection conn;

    public BookOrderDaoImpl(Connection conn) {
        this.conn = conn;
    }


    @Override
    public boolean saveOrder(List<Book_Order> orderList) {
        boolean f= false;
        try {
            String sql = "insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);

            for (Book_Order b:orderList){
                ps.setString(1,b.getOrderId());
                ps.setString(2,b.getUsername());
                ps.setString(3,b.getEmail());
                ps.setString(4,b.getFulladd());
                ps.setString(5,b.getPhone());
                ps.setString(6,b.getBookName());
                ps.setString(7,b.getAuthor());
                ps.setString(8,b.getPrice());
                ps.setString(9,b.getPaymentType());
                ps.addBatch();
            }

               int[] count = ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);



        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Book_Order> getBook(String email) {
       List<Book_Order> list = new ArrayList<Book_Order>();
       Book_Order b = null;
       try {
           String sql = " select * from book_order where email=?";
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setString(1,email);
           ResultSet rs = ps.executeQuery();
           while (rs.next()){
               b = new Book_Order();
               b.setId(rs.getInt(1));
               b.setOrderId(rs.getString(2));
               b.setUsername(rs.getString(3));
               b.setEmail(rs.getString(4));
               b.setFulladd(rs.getString(5));
               b.setPhone(rs.getString(6));
               b.setBookName(rs.getString(7));
               b.setAuthor(rs.getString(8));
               b.setPrice(rs.getString(9));
               b.setPaymentType(rs.getString(10));
               list.add(b);

           }
       }catch (Exception e){
           e.printStackTrace();
       }
       return list;
    }

    @Override
    public List<Book_Order> getAllOrder() {
        List<Book_Order> list = new ArrayList<Book_Order>();
        Book_Order b = null;
        try {
            String sql = " select * from book_order";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                b = new Book_Order();
                b.setId(rs.getInt(1));
                b.setOrderId(rs.getString(2));
                b.setUsername(rs.getString(3));
                b.setEmail(rs.getString(4));
                b.setFulladd(rs.getString(5));
                b.setPhone(rs.getString(6));
                b.setBookName(rs.getString(7));
                b.setAuthor(rs.getString(8));
                b.setPrice(rs.getString(9));
                b.setPaymentType(rs.getString(10));
                list.add(b);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
