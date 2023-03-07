<%@ page import="com.trinhtrung.Dao.Impl.BookDaoImpl" %>
<%@ page import="com.trinhtrung.DB.DBConnect" %>
<%@ page import="com.trinhtrung.Entity.BookDtls" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: Edit Books</title>

    <%@include file="allCss.jsp"%>
</head>
<body style="background-color: #eeeeee">
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row mt-2">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Edit Books</h4>

                    <%
                    int id =Integer.parseInt(request.getParameter("id"));
                        BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
                        BookDtls b =dao.getBookById(id);
                    %>

                    <form action="../edit_books" method="post">
                       <input type="hidden" name="id" value="<%=b.getBookId()%>">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Book Name</label>
                            <input value="<%=b.getBookName()%>" name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">

                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Author Name</label>
                            <input value="<%=b.getAuthor()%>" name="author" type="text" class="form-control" id="exampleInputPassword1" required="required">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Price</label>
                            <input value="<%=b.getPrice()%>" name="price" type="number" class="form-control" id="exampleInputPassword1" required="required">
                        </div>
                        <div class="form-group">
                            <label for="inputSate">Book Status</label>
                            <select id="inputSate" name="status" class="form-control">
                                <%
                                 if ("Active".equals(b.getStatus())){

                                %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>

                                <%
                                    } else {
                                %>

                                <option value="Inactive">Inactive</option>
                                <option value="Active">Active</option>

                                <%
                                    }
                                 %>
                            </select>
                        </div>




                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Update</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
