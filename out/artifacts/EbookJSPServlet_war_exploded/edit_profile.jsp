<%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 26/02/2023
  Time: 3:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <%@ include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #eeeeee">
<%@include file="all_component/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center text-primary">Edit Profile</h4>
                    <%
                        try {
                            String updateSucMsg = (String) session.getAttribute("updateSucMsg");
                            String updateFailedMsg = (String) session.getAttribute("updateFailedMsg");
                            String icrUpdateMsg = (String) session.getAttribute("icrUpdateMsg");
                            if (!updateSucMsg.isEmpty())
                            {%>
                    <div class="alert alert-success" role="alert">
                        <%=updateSucMsg%>
                    </div>
                    <% }
                        if (!updateFailedMsg.isEmpty()) { %>
                    <div class="alert alert-danger" role="alert">
                        <%=updateFailedMsg%>
                    </div>
                    <% }
                        if (!icrUpdateMsg.isEmpty()) { %>
                    <div class="alert alert-danger" role="alert">
                        <%=icrUpdateMsg%>
                    </div>
                    <% }
                        session.setAttribute("updateSucMsg", "");
                        session.setAttribute("updateFailedMsg", "");
                        session.setAttribute("icrUpdateMsg", "");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>

                    <form action="update_profile" method="post">
                        <input type="hidden" value="${userobj.id}" name="id">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Enter Full Name</label>
                            <input name="fname" type="text" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" placeholder="full name" required="required"
                                   value="${userobj.name}">

                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" placeholder="Enter email" required="required"
                                   value="${userobj.email}">

                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Phone Number</label>
                            <input name="phone" type="number" class="form-control" id="exampleInputPassword1"
                                   placeholder="Phone" required="required" value="${userobj.phone}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1"
                                   placeholder="Password" required="required">
                        </div>
                        <div class="text-center p-2">
                            <button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
