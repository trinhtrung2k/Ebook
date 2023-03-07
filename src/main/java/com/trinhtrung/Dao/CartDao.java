package com.trinhtrung.Dao;

import com.trinhtrung.Entity.BookDtls;
import com.trinhtrung.Entity.Cart;

import java.util.List;

public interface CartDao {
    public boolean addCart(Cart c);
    public List<Cart> getBookByUser(int  userId);
    public boolean deleteBook(int bid, int uid , int cid);
}
