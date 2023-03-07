<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: Add Books</title>

    <%@include file="allCss.jsp"%>
</head>
<body style="background-color: #eeeeee">
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row mt-2">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Add Books</h4>

                    <h5 class="text-center text-danger">${notifyMsg}</h5>
                    <form action="../add_books" method="post" enctype="multipart/form-data">
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
                            <label for="inputSate">Book Categories</label>
                            <select id="inputSate" name="categories" class="form-control">
                                <option selected>--select--</option>
                                <option value="New">New Book</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputState">Book Status</label>
                            <select id="inputState" name="status" class="form-control">
                                <option selected>--select--</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputSate">Upload Photo</label>
                            <input name="bimg" type="file" class="form-control-file"
                            id="exampleFormControlFile1">
                        </div>
                   

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Add</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
