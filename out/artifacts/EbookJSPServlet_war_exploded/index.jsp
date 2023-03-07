<%@ page import="java.sql.Connection" %>
<%@ page import="com.trinhtrung.DB.DBConnect" %>
<%@ page import="com.trinhtrung.Dao.Impl.BookDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trinhtrung.Entity.BookDtls" %>
<%@ page import="com.trinhtrung.Entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 24/02/2023
  Time: 2:12 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Ebook: Index</title>
    <%@ include file="all_component/allCss.jsp"%>
    <style type="text/css">
      .back-img{
        background: url("img/b.jpg");
        height: 40vh;
        width: 100%;
        background-size: cover ;
        background-repeat: no-repeat;

      }
      .crd-ho:hover{
        background-color: #fcf7f7 ;
      }
    </style>
  </head>
  <body style="background-color: #f7f7f7;">
  <%  User user = (User)session.getAttribute("userobj"); %>

   <%@include file="all_component/navbar.jsp"%>
  <div class="container-fluid back-img">
    <h2 class="text-center text-danger">EBook Management System</h2>
  </div>
   <!-- Start Recent Book -->
  <div class="container" >
    <h3 class="text-center">Recent Book</h3>
    <div class="row">

      <%
        BookDaoImpl dao1 = new BookDaoImpl(DBConnect.getConn());
        List<BookDtls> list1 = dao1.getRecentBooks();
        for (BookDtls b1:list1)
        {%>
      <div class="col-md-3">
        <div class="card crd-ho">
          <div class="card-body text-center">
            <img alt="" src="book/<%=b1.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumblin">
            <p><%=b1.getBookName()%></p>
            <p><%=b1.getAuthor()%></p>
            <p>
              <%if(b1.getBookCategory().equals("Old")){
                %>
              Categories:<%=b1.getBookCategory()%></p>
            <div class="row text-center">
              <a href="views_book.jsp?bid=<%=b1.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
            </div>
              <% }else{%>
            Categories:<%=b1.getBookCategory()%></p>
            <div class="row">
              <% if (user == null)
              {%>
              <a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i>Add Cart</a>
              <a href="views_book.jsp?bid=<%=b1.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
              <%}else{%>
              <a href="cart?bid=<%=b1.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i>Add Cart</a>
              <a href="views_book.jsp?bid=<%=b1.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-success btn-sm ml-1">View Details</a>

              <%}%>
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

  <div class="text-center mt-1">
    <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
  </div>

   <!-- End Recent Book-->
<hr>
   <!-- Start New Book -->
   <div class="container" >
     <h3 class="text-center">New Book</h3>
     <div class="row">

         <%
           BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
           List<BookDtls> list = dao.getNewBook();
           for (BookDtls b:list)
           {%>
       <div class="col-md-3">
         <div class="card crd-ho">
           <div class="card-body text-center">
             <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumblin">
             <p><%=b.getBookName()%></p>
             <p><%=b.getAuthor()%></p>
             <p>Categories:<%=b.getBookCategory()%></p>
             <div class="row">
               <% if (user == null)
               {%>
               <a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i>Add Cart</a>
               <a href="views_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>

               <%}else{%>
               <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i>Add Cart</a>
               <a href="views_book.jsp?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-success btn-sm ml-1">View Details</a>

               <%}%>
               <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fas fa-rupee-sign"></i></a>
             </div>
           </div>
         </div>
       </div>
       <%}
     %>
     </div>

   </div>

   <div class="text-center mt-1">
     <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
   </div>

   <!-- End New Book-->
  <hr>
   <!-- Start Old Book -->
   <div class="container" >
     <h3 class="text-center">Old Book</h3>
     <div class="row">

       <%
         BookDaoImpl dao3 = new BookDaoImpl(DBConnect.getConn());
         List<BookDtls> list3 = dao3.getOldBooks();
         for (BookDtls b3:list3)
         {%>
       <div class="col-md-3">
         <div class="card crd-ho">
           <div class="card-body text-center">
             <img alt="" src="book/<%=b3.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumblin">
             <p><%=b3.getBookName()%></p>
             <p><%=b3.getAuthor()%></p>
             <p>Categories:<%=b3.getBookCategory()%></p>
             <div class="row">
               <a href="views_book.jsp?bid=<%=b3.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
               <a href="" class="btn btn-danger btn-sm ml-1"><%=b3.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
             </div>
           </div>
         </div>
       </div>
       <%}
       %>
     </div>

   </div>

   <div class="text-center mt-1">
     <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
   </div>

   <!-- End Old Book-->
  <%@include file="all_component/footer.jsp"%>
  </body>
</html>
