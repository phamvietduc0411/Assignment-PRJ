<%@page import="java.util.List"%>
<%@page import="Model.Products.ProductsDTO"%>
<!DOCTYPE html>
<html lang="en">

    
    <head>
        <title>newhtml</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />



        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/admin.css">


    </head>

    <body>
    <div class="container">
        <h2 class="mt-5">User Profile</h2>
        <table class="table mt-3">
            <tr>
                <td><b>Username:</b></td>
                <td>${user.username}</td>
            </tr>
            <tr>
                <td><b>Email:</b></td>
                <td>${user.email}</td>
            </tr>
            <!-- Thêm các tr??ng thông tin khác c?a ng??i dùng t?i ?ây -->
        </table>
        <a href="/editProfile" class="btn btn-primary">Edit Profile</a> <!-- Link ?? chuy?n sang trang ch?nh s?a profile -->
    </div>

<!-- Bootstrap và jQuery JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper."></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
