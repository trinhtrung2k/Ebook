<%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 27/02/2023
  Time: 1:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #eeeeee">
<%@include file="all_component/navbar.jsp"%>
  <div class="container text-center">
      <i class="fas fa-check-circle fa-5x text-success"></i>
      <h1>Thank You</h1>
      <h2>Your Order Successfully</h2>
      <h5> With in 7 Days Your Product will be Delivered In your Address</h5>
      <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
      <a href="user_order.jsp" class="btn btn-danger mt-3">View Order</a>
  </div>
</body>
</html>
