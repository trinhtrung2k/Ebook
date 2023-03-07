<%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 24/02/2023
  Time: 8:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>--%>
<html>
<head>
    <title>EBook: Register</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #eeeeee">
<%@include file="all_component/navbar.jsp"%>
<div class="container p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Registration Page</h4>
                    <%
                        try{
                            String userSuccMsg  = (String) session.getAttribute("userSuccMsg");
                            String userFailedMsg  = (String) session.getAttribute("userFailedMsg");
                            String emailMsg  = (String) session.getAttribute("emailMsg");
                            String termMsg  = (String) session.getAttribute("termMsg");
                            if (!userSuccMsg.isEmpty())
                            {%>
                    <div class="alert alert-success" role="alert">
                        <%=userSuccMsg%>
                    </div>
                    <% }
                        if(!userFailedMsg.isEmpty()){ %>
                    <div class="alert alert-danger" role="alert">
                        <%=userFailedMsg%>
                    </div>
                    <% }
                        if(!emailMsg.isEmpty()){ %>
                    <div class="alert alert-danger" role="alert">
                        <%=emailMsg%>
                    </div>
                    <% }
                        if(!termMsg.isEmpty()){ %>
                    <div class="alert alert-danger" role="alert">
                        <%=termMsg%>
                    </div>
                    <% }
                        session.setAttribute("userSuccMsg","");
                        session.setAttribute("userFailedMsg","");
                        session.setAttribute("emailMsg","");
                        session.setAttribute("termMsg","");
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                    %>
                    <form action="register" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Enter Full Name</label>
                            <input name="fname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="full name" required="required">

                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required">

                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Phone Number</label>
                            <input name="phone" type="number" class="form-control" id="exampleInputPassword1" placeholder="Phone" required="required">
                        </div>
                            <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required">
                        </div>
                        <div class="form-check">
                            <input  name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Agree term & Condition</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="all_component/footer.jsp"%>

</body>

</html>
