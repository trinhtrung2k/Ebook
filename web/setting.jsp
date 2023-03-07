<%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 26/02/2023
  Time: 2:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Setting</title>
    <%@ include file="all_component/allCss.jsp"%>
    <style type="text/css">
        a{
            text-decoration: none;
            color: #a55d5d;
        }
        a:hover{
            text-decoration: none;

        }
    </style>

</head>
<body style="background-color: #f7f7f7;">
<%  User userLogin = (User)session.getAttribute("userobj");
    if (userLogin == null){
        response.sendRedirect("login.jsp");
    }
%>
<%@include file="all_component/navbar.jsp"%>
<div class="container">
    <% if (userLogin != null) { %>
    <h3 class="text-center">Welcome <%=userLogin.getName()%></h3>

    <%}%>

    <div class="row p-5">
        <div class="col-md-4">
            <a href="sell_book.jsp" >
                <div class="card" style=" border-radius: 16px;">
                    <div class="card-body text-center">
                        <div class="text-primary">
                        <i class="fas fa-book-open fa-3x"></i>
                        </div>
                        <h4>Sell Old Book</h4>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="old_book.jsp" >
                <div class="card" style=" border-radius: 16px;">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-book-open fa-3x"></i>
                        </div>
                        <h4>Old Book</h4>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="edit_profile.jsp">
                <div class="card" style=" border-radius: 16px;">
                    <div class="card-body text-center">
                        <div class="text-primary">
                        <i class="fas fa-edit fa-3x"></i>
                        </div>
                        <h4>Edit Profile</h4>
                    </div>
                </div>
            </a>
        </div>


        <div class="col-md-6 mt-3">
            <a href="order.jsp">
                <div class="card" style=" border-radius: 16px;">
                    <div class="card-body text-center">
                        <div class="text-danger">
                            <i class="fas fa-box-open fa-3x"></i>
                        </div>
                        <h4>My Order</h4>
                        <p>Track Your Order</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6 mt-3">
            <a href="helpline.jsp">
                <div class="card" style=" border-radius: 16px;">
                    <div class="card-body text-center" >
                        <div class="text-primary">
                            <i class="fas fa-user-circle fa-3x"></i>
                        </div>
                        <h4>Help Center</h4>
                        <p>24/7 Serivce</p>
                    </div>
                </div>
            </a>
        </div>

    </div>
</div>

<%@include file="all_component/footer.jsp"%>
</body>
</html>
