<%@ page import="com.trinhtrung.Dao.Impl.BookDaoImpl" %>
<%@ page import="com.trinhtrung.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trinhtrung.Dao.BookDao" %>
<%@ page import="com.trinhtrung.Entity.BookDtls" %><%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 27/02/2023
  Time: 9:33 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User: Old Book</title>
    <%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<%  User userLogin = (User)session.getAttribute("userobj");
    if (userLogin == null){
        response.sendRedirect("login.jsp");
    }
%>
<%@include file="all_component/navbar.jsp"%>
<%
    try{
        String rmOldSucMsg  = (String) session.getAttribute("rmOldSucMsg");
        String rmOldFailedMsg  = (String) session.getAttribute("rmOldFailedMsg");
        if (!rmOldSucMsg.isEmpty())
        {%>
<div class="alert alert-success" role="alert">
    <%=rmOldSucMsg%>
</div>
<% }
    if(!rmOldFailedMsg.isEmpty()){ %>
<div class="alert alert-danger" role="alert">
    <%=rmOldFailedMsg%>
</div>
<% }
    session.setAttribute("rmOldSucMsg","");
    session.setAttribute("rmOldFailedMsg","");
}catch (Exception e){
    e.printStackTrace();
}
%>

<div class="container p-5">
    <table class="table table-striped">
        <thead class="bg-primary text-white">
        <tr>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
           String email = userLogin.getEmail();
            session.getAttribute("userobj");
            BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
            List<BookDtls> list =  dao.getBookByOld(email,"Old");
            for (BookDtls b : list){ %>
        <tr>
            <td><%=b.getBookName()%></td>
            <td><%=b.getAuthor()%></td>
            <td><%=b.getPrice()%></td>
            <td><%=b.getBookCategory()%></td>
            <td><a href="delete_old_book?email=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>
        </tr>

        <% } %>


        </tbody>
    </table>
</div>
</body>
</html>
