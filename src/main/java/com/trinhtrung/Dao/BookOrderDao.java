package com.trinhtrung.Dao;

import com.trinhtrung.Entity.Book_Order;

import java.util.List;

public interface BookOrderDao {
    //public int getOrderNo();
    public boolean saveOrder(List<Book_Order> orderList);
    public List<Book_Order> getBook(String email);
    public List<Book_Order> getAllOrder();
}
