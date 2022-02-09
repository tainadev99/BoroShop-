<%-- 
    Document   : register
    Created on : Nov 11, 2019, 12:01:16 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>

<style>
    body {
     background: url('raw_views/img/banner-login.jpg');
    background-size: cover;
}

*[role="form"] {
    max-width: 530px;
    padding: 15px;
    margin: 0 auto;
    border-radius: 0.3em;
    background-color: #f2f2f2;
}

*[role="form"] h2 { 
    font-family: 'Open Sans' , sans-serif;
    font-size: 40px;
    font-weight: 600;
    color: #000000;
    margin-top: 5%;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 4px;
}
.container{
    margin-top: 70px;
}
</style>
    </head>
    <body>
<div class="container">
            <form class="form-horizontal" role="form" action="register" method="POST">
                <h2>Registration</h2>
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">Username*</label>
                    <div class="col-sm-9">
                        <input name="username" type="text" id="firstName" placeholder="Username" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password*</label>
                    <div class="col-sm-9">
                        <input name="password" type="password" id="lastName" placeholder="Pass word" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Confirm Password* </label>
                    <div class="col-sm-9">
                        <input name="password2" type="password" id="email" placeholder="Confirm Password" class="form-control" name= "email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">FullName*</label>
                    <div class="col-sm-9">
                        <input name="fullname" type="text" id="password" placeholder="Full Name" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email*</label>
                    <div class="col-sm-9">
                        <input name="email" type="email" id="password" placeholder="Email" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Date of Birth*</label>
                    <div class="col-sm-9">
                        <input name="dob" type="text" id="birthDate" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="phoneNumber" class="col-sm-3 control-label">Phone number </label>
                    <div class="col-sm-9">
                        <input name="phone" type="phoneNumber" id="phoneNumber" placeholder="Phone number" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                        <label for="address" class="col-sm-3 control-label">Address* </label>
                    <div class="col-sm-9">
                        <input name="address" type="text" id="height" placeholder="Your Adress" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Gender</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input name="gender" type="radio" id="femaleRadio" value="0">Female
                                </label>
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input name="gender" type="radio" id="maleRadio" value="1">Male
                                </label>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                
                <button type="submit" class="btn btn-primary btn-block">Register</button>
            </form> <!-- /form -->
         <!-- ./container -->
</div>
    </body>
</html>
