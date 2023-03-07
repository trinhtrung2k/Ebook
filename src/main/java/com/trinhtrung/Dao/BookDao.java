package com.trinhtrung.Dao;

import com.trinhtrung.Entity.BookDtls;

import java.util.List;

public interface BookDao {
    public  boolean addBooks(BookDtls bookDtls);
    public List<BookDtls> getAllBooks();
    public  BookDtls getBookById(int id);
    public boolean updateEditBooks(BookDtls b);
    public boolean delete(int id);
    public List<BookDtls> getNewBook();
    public  List<BookDtls> getRecentBooks();
    public  List<BookDtls> getOldBooks();
    public  List<BookDtls> getAllRecentBook ();
    public  List<BookDtls> getAllNewBook ();
    public  List<BookDtls> getAllOldBook ();
    public  List<BookDtls> getBookByOld (String email,String category);
    public boolean oldBookDelete (String category,String email, int id);
        //search
    public List<BookDtls> getBookBySearch(String ch);

}
