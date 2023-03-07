package com.trinhtrung.Entity;

public class Cart {
    private int cid;
    private int bid;
    private int userId;
    private String bookName;
    private String author;
    private Double price;
    private Double totalPrice;

    public Cart() {
    }

    public Cart(int cid, int bid, int userId, String bookName, String author, Double price, Double totalPrice) {
        this.cid = cid;
        this.bid = bid;
        this.userId = userId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
