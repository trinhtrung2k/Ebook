<%@ page import="com.trinhtrung.Dao.Impl.BookDaoImpl" %>
<%@ page import="com.trinhtrung.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trinhtrung.Entity.BookDtls" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 25/02/2023
  Time: 11:08 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Books</title>
    <%@include file="allCss.jsp"%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("button").click(function(){
                $("p").hide(1000);
            });
        });
    </script>--%>

</head>

<body style="background-color: #eeeeee">
<%@include file="navbar.jsp"%>
<%@include file="alter.jsp"%>

<h3>All Book</h3>
<h5 id="alter" class="text-center text-danger">${Msg}</h5>
<table class="table table-striped">
    <thead class="bg_primary text-while">
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Image</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Categories</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
        <% BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
            List<BookDtls> list = dao.getAllBooks();
            for (BookDtls b: list)
            { %>
        <tr>
            <td> <%= b.getBookId() %></td>
            <td><img src="../book/<%= b.getPhotoName() %>"
            style="width: 50px; height: 50px;"></td>
            <td><%= b.getBookName() %></td>
            <td><%= b.getAuthor() %></td>
            <td><%= b.getPrice() %></td>
            <td><%= b.getBookCategory() %></td>
            <td><%= b.getStatus() %></td>
            <td>
                <a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary"><i class=" fas fa-edit"></i>Edit</a>
                <a href="../delete?id=<%=b.getBookId()%>"  class="btn btn-sm btn-danger text-white"><i class="fas fa-trash-alt"></i>Delete</a>
            </td>
        </tr>
            <%}
        %>
    </tbody>
</table>
<div style="margin-top: 130px">
    <%@include file="footer.jsp"%>
</div>

</body>
</html>
