<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form</title>
        <link rel="zstalk icon" type="image/x-icon" href="images/favicon.ico">;
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">;

        <!-- Main css -->
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>

        <div class="main">
            <section class="signup">
                
                <div class="container">
                    
                    <div class="signup-content">
                        <div class="signup-form">
                            
                            <h2 class="form-title">Sign up</h2>
                            <form method="POST" class="register-form" id="register-form" action="SignupController">
                                <!--UserName--> 
                                <div class="form-group">
                                    <label for="newuser"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="newuser" id="username" placeholder="User Name" required>
                                </div>
                                <!--Password-->
                                <div class="form-group">
                                    <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="pass" placeholder="Password" required>
                                </div>    
                                <!--Fullname-->
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="CustomerName" id="name" placeholder="Full Name" required>
                                </div>
                                <!--Phone Number-->
                                <div class="form-group">
                                    <label for="PhoneNumber"><i class="zmdi zmdi-account-box-phone material-icons-name"></i></label>
                                    <input type="text" name="PhoneNumber" id="PhoneNumber" placeholder="Phone Number" required>
                                </div>
                                <!--Address-->
                                <div class="form-group">
                                    <label for="Address"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="Address" id="Address" placeholder="Address" required>
                                </div>
                                <!--Gender-->
                                <div class="form-group">
                                    <label for="Male"><i class="zmdi zmdi-male-alt material-icons"> Male</i></label>
                                    <input type="radio" name="Gender" id="Male" value="Male"/>
                                </div>
                                <div class="form-group">
                                    <label for="Female"><i class="zmdi zmdi-female material-icons"> Female</i></label>
                                    <input type="radio" name="Gender" id="Female" value="Female"/>
                                </div>
                                <!--Email-->
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="Email" id="email" placeholder="Your Email" required>
                                </div>  
                                <!--Terms of service-->
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                </div>
                                <h3>${error}</h3>
                                <div class="form-group form-button">
                                    <input type="submit" id="signup" class="form-submit" value="Sign up"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="images/logo.png" alt="singup image"></figure>
                            <a href="login.jsp" class="signup-image-link">Back to Login</a>
                        </div>
                    </div>
                </div>
            </section>
    </body>
</html>