<%@ page import="com.trinhtrung.Dao.Impl.CartDaoImpl" %>
<%@ page import="com.trinhtrung.DB.DBConnect" %>
<%@ page import="com.trinhtrung.Entity.Cart" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Trung
  Date: 26/02/2023
  Time: 12:25 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart Page</title>
    <%@ include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #eeeeee">
<%@include file="all_component/navbar.jsp" %>
<% User userLogin = (User) session.getAttribute("userobj");
    if (userLogin == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%
    try {
        String removeCart = (String) session.getAttribute("rmSucMsg");
        String failedCart = (String) session.getAttribute("rmFailedMsg");

        if (!removeCart.isEmpty()) {%>
<div class="alert alert-success" role="alert">
    <%=removeCart%>
</div>
<% }
    if (!failedCart.isEmpty()) { %>
<div class="alert alert-danger" role="alert">
    <%=failedCart%>
</div>
<% }
    session.setAttribute("rmSucMsg", "");

    session.setAttribute("rmFailedMsg", "");
} catch (Exception e) {
    e.printStackTrace();
}
%>

<div class="container">
    <div class="row">
        <div class="col-md-6">

            <div class="card bg-white">
                <div class="card-body">

                    <%
                        try {
                            String orderEmptyMsg = (String) session.getAttribute("orderEmptyMsg");
                            String orderMsg = (String) session.getAttribute("orderMsg");
                            String orderFailedMsg = (String) session.getAttribute("orderFailedMsg");
                            if (!orderEmptyMsg.isEmpty()) {%>
                    <div class="alert alert-danger text-center" role="alert">
                        <%=orderEmptyMsg%>
                    </div>
                    <% }
                            if (!orderMsg.isEmpty()) {%>
                    <div class="alert alert-danger text-center" role="alert">
                        <%=orderMsg%>
                    </div>
                    <% }
                        if (!orderFailedMsg.isEmpty()) {%>
                    <div class="alert alert-danger text-center" role="alert">
                        <%=orderFailedMsg%>
                    </div>
                    <% }
                        session.setAttribute("orderEmptyMsg", "");
                        session.setAttribute("orderMsg", "");
                        session.setAttribute("orderFailedMsg", "");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                    <h3 class="text-center text-success">Your Selected Item</h3>

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Book Name</th>
                            <th scope="col">Author</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
                            List<Cart> listCart = dao.getBookByUser(userLogin.getId());
                            Double totalPrice = 0.00;
                            for (Cart c : listCart) {
                                totalPrice = c.getTotalPrice();
                        %>
                        <tr>
                            <th scope="row"><%=c.getBookName()%>
                            </th>
                            <td><%=c.getAuthor()%>
                            </td>
                            <td><%=c.getPrice()%>
                            </td>
                            <td>
                                <a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
                                   class="btn btn-sm btn-danger">Remove</a>
                            </td>
                        </tr>
                        <% }%>
                        <tr>
                            <td>Total Price</td>
                            <td></td>
                            <td></td>
                            <td><%=totalPrice%>
                            </td>
                        </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Detail for Order</h3>
                    <form action="order" method="post">
                        <input type="hidden" value="${userobj.id}" name="id" required>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Name</label>
                                <input name="username" type="text" class="form-control" id="inputEmail4"
                                       value="${userobj.name}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Email</label>
                                <input name="email" type="email" class="form-control" id="inputPassword4"
                                       value="${userobj.email}" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Phone Number</label>
                                <input name="phone" type="number" class="form-control" id="inputEmail4"
                                       value="${userobj.phone}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Address</label>
                                <input name="address" type="text" class="form-control" id="inputPassword4" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Landmark</label>
                                <input name="landmark" type="text" class="form-control" id="inputEmail4" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">City</label>
                                <input name="city" type="text" class="form-control" id="inputPassword4" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">State</label>
                                <input name="state" type="text" class="form-control" id="inputEmail4" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Pin code</label>
                                <input name="pincode" type="text" class="form-control" id="inputPassword4">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputState">Payment Mode</label>
                            <select name="payment" id="inputState" class="form-control">
                                <option value="noselect">Select...</option>
                                <option value="COD">Cash On Delivery</option>
                            </select>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-warning">Order Now</button>
                            <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
