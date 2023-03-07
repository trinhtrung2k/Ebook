<%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 24/02/2023
  Time: 8:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EBook: Login</title>

<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #eeeeee">
<%@include file="all_component/navbar.jsp"%>
<div class="container">
    <div class="row mt-2">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Login</h4>

                    <h5 class="text-center text-danger">${failedMsg}</h5>
                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">

                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1" required="required">
                        </div>

                      <div class="text-center">
                          <button type="submit" class="btn btn-primary">Login</button>
                          <a href="register.jsp">Create Account</a>
                      </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
