<%@ page import="com.trinhtrung.Dao.Impl.BookDaoImpl" %>
<%@ page import="com.trinhtrung.DB.DBConnect" %>
<%@ page import="com.trinhtrung.Entity.BookDtls" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 26/02/2023
  Time: 8:29 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Recent Book</title>
    <%@include file="all_component/allCss.jsp"%>
    <style type="text/css">
        .crd-ho:hover{
            background-color: #dcc0c0;
        }

    </style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<%  User user = (User)session.getAttribute("userobj"); %>
<div class="container-fluid">
    <div class="row p-3">

        <%
            BookDaoImpl dao1 = new BookDaoImpl(DBConnect.getConn());
            List<BookDtls> list1 = dao1.getAllRecentBook();
            for (BookDtls b1:list1)
            {%>
        <div class="col-md-3">
            <div class="card crd-ho mt-2">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b1.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumblin">
                    <p><%=b1.getBookName()%></p>
                    <p><%=b1.getAuthor()%></p>
                    <p>
                        <%if(b1.getBookCategory().equals("Old")){
                        %>
                        Categories:<%=b1.getBookCategory()%></p>
                    <div class="row ">
                        <a href="views_book.jsp?bid=<%=b1.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                    </div>
                    <% }else{%>
                    Categories:<%=b1.getBookCategory()%></p>
                    <div class="row">
                        <% if (user == null)
                        {%>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <%}else{%>
                        <a href="cart?bid=<%=b1.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i>Add Cart</a>

                        <%}%>

                        <a href="views_book.jsp?bid=<%=b1.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1"><%=b1.getPrice()%><i class="fas fa-rupee-sign"></i></a>
                    </div>
                    <% }%>


                </div>
            </div>
        </div>

        <%}
        %>
    </div>
</div>
</body>
</html>
