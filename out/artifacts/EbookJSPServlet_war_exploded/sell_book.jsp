<%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 26/02/2023
  Time: 3:27 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sell Book</title>
    <%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #eeeeee">
<%  User userLogin = (User)session.getAttribute("userobj");
    if (userLogin == null){
        response.sendRedirect("login.jsp");
    }
%>

<%@include file="all_component/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="text-center text-primary">Sell Old Book</h5>
                    <%
                        try{
                            String sellSucBMsg  = (String) session.getAttribute("sellSucBMsg");
                            String sellFailedBMsg  = (String) session.getAttribute("sellFailedBMsg");
                            if (!sellSucBMsg.isEmpty())
                            {%>
                    <div class="alert alert-success" role="alert">
                        <%=sellSucBMsg%>
                    </div>
                    <% }
                        if(!sellFailedBMsg.isEmpty()){ %>
                    <div class="alert alert-danger" role="alert">
                        <%=sellFailedBMsg%>
                    </div>
                    <% }
                        session.setAttribute("sellSucBMsg","");
                        session.setAttribute("sellFailedBMsg","");
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                    %>

                    <form action="add_old_book" method="post" enctype="multipart/form-data">
                        <input type="hidden" value="${userobj.email}" name="user">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Book Name</label>
                            <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">

                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Author Name</label>
                            <input name="author" type="text" class="form-control" id="exampleInputPassword1" required="required">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Price</label>
                            <input name="price" type="number" class="form-control" id="exampleInputPassword1" required="required">
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlFile1">Upload Photo</label>
                            <input name="bimg" type="file" class="form-control-file"
                                   id="exampleFormControlFile1">
                        </div>


                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Sell</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
