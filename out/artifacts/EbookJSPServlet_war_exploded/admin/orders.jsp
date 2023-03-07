<%@ page import="com.trinhtrung.Dao.Impl.BookOrderDaoImpl" %>
<%@ page import="com.trinhtrung.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trinhtrung.Entity.Book_Order" %>
<%@ page import="com.trinhtrung.Entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 26/02/2023
  Time: 3:55 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
    <%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #eeeeee">
<%@include file="navbar.jsp"%>
<% User userLogin = (User) session.getAttribute("userobj");
    if (userLogin == null) {
        response.sendRedirect("../login.jsp");
    }
%>
<div class="container p-1">
    <h3 class="text-center text-primary">Your Order</h3>
    <table class="table table-striped">
        <thead class="bg-primary text-white">
        <tr>
            <th scope="col">Order Id</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Phone</th>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Payment Type</th>
        </tr>
        </thead>
        <tbody>
        <%
           // User user = (User) session.getAttribute("userobj");
            BookOrderDaoImpl dao = new BookOrderDaoImpl(DBConnect.getConn());
            List<Book_Order> blist = dao.getAllOrder();
            for (Book_Order b : blist){
        %>
        <tr>
            <th scope="row"><%=b.getOrderId()%></th>
            <td><%=b.getUsername()%></td>
            <td><%=b.getEmail()%></td>
            <td><%=b.getFulladd()%></td>
            <td><%=b.getPhone()%></td>
            <td><%=b.getBookName()%></td>
            <td><%=b.getAuthor()%></td>
            <td><%=b.getPrice()%></td>
            <td><%=b.getPaymentType()%></td>

        </tr>
        <% }
        %>

        </tbody>
    </table>
</div>

</body>
</html>
