<%@ page import="com.trinhtrung.Entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 25/02/2023
  Time: 9:37 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Title</title>
    <%@ include file="allCss.jsp"%>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body style="background-color: #eeeeee">
<%--
<%@include file="navbar.jsp"%>
<button type="button" class="btn btn-outline-success ml-20"><a href="all_books.jsp">All Books</a></button>
<button type="button" class="btn btn-outline-success  ml-20"><a href="add_books.jsp"></a>Add Books</button>
<button type="button" class="btn btn-outline-success  ml-20">Order Books</button>
<button type="button" class="btn btn-outline-success  ml-20">Logout</button>
--%>
<%  User user = (User)session.getAttribute("userobj");
    if (user == null ){
        response.sendRedirect("login.jsp");
    }
%>
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row p-5">
        <div class="col-md-3">
            <a href="add_books.jsp">
                <div class="card">
                    <div class="card-body text-center">
                    <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                    <h4>Add Books</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="all_books.jsp">
                <div class="card">
                    <div class="card-body text-center">
                    <i class="fas fa-book-open fa-3x text-danger"></i><br>
                    <h4>All Books</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="orders.jsp">
                <div class="card">
                    <div class="card-body text-center">
                    <i class="fas fa-box-open fa-3x text-warning"></i><br>
                    <h4>Orders Book</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">

            <a data-toggle="modal" data-target="#exampleModalCenter">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
                        <h4>Logout</h4>
                    </div>
                </div>
            </a>
        </div>



    </div>
</div>

<%--
logout modal--%>
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4>Do you want logout</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="../logout"  type="button" class="btn btn-primary text-white">Logout</a>

                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<%--end logout modal--%>
<div style="margin-top: 130px;">
    <%@include file="footer.jsp"%>
</div>

</body>
</html>
