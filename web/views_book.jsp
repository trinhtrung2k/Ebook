<%@ page import="com.trinhtrung.Dao.Impl.BookDaoImpl" %>
<%@ page import="com.trinhtrung.DB.DBConnect" %>
<%@ page import="com.trinhtrung.Entity.BookDtls" %><%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 26/02/2023
  Time: 9:30 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Detail</title>
    <%@ include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp"%>
<%  User userLogin = (User)session.getAttribute("userobj");

%>
<%
 int bid = Integer.parseInt(request.getParameter("bid"));
    BookDaoImpl  dao = new BookDaoImpl(DBConnect.getConn());
    BookDtls b = dao.getBookById(bid);
%>

<div class="container -p3">
    <div class="row">
        <div class="col-md-6 text-center p-5 border bg-white">
            <img src="book/<%=b.getPhotoName()%>" style="height: 280px; width: 280px"><br>
            <h4 class="mt-3">Book name: <span class="text-success"><%=b.getBookName()%></span></h4>
            <h4>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
            <h4>Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
        </div>
        <div class="col-md-6 text-center p-5 border bg-white">
           <h2><%=b.getBookName()%></h2>
            <%
            if ("Old".equals(b.getBookCategory()))
            {%>
            <h5  class="text-primary">Contact To Seller</h5>
                <h5 class="text-primary"><i class="fas fa-envelope"></i>Email: <%= b.getEmail()%></h5>
            <%} %>

            <div class="row">
                <div class="col-md-4 text-warning text-center p-2">
                    <i class="fas fa-money-bill-wave fa-2x"></i>
                    <p>Cash On Delivery</p>
                </div>
                <div class="col-md-4 text-warning text-center p-2">
                    <i class="fas fa-undo-alt fa-2x"></i>
                    <p>Return Available</p>
                </div>
                <div class="col-md-4 text-warning text-center p-2">
                    <i class="fas fa-truck-moving fa-2x"></i>
                    <p>Free Shipping</p>
                </div>
            </div>

            <%
                if ("Old".equals(b.getBookCategory()))
                {%>
            <div class="text-center p-3">
                <a href="index.jsp" class="btn btn-success">
                    <i class="fas fa-cart-plus">Continue Shopping</i>
                </a>

            </div>
            <%}else{ %>
            <div  class="text-center p-3">
                <% if (userLogin == null)
                {%>
                <a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i>Add Cart</a>
                <%}else{%>
                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=userLogin.getId()%>" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i>Add Cart</a>

                <%}%>
                <%--<a href="" class="btn btn-danger">
                    <i class="fas fa-cart-plus">Add Cart</i>
                </a>--%>
                <a href="" class="btn btn-danger">
                    <i class="fas fa-rupee-sign">200</i>
                </a>
            </div>

            <%} %>



        </div>
    </div>
</div>
</body>
</html>
