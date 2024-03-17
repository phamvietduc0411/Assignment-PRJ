<!DOCTYPE html>
<html>
    <head>
        <title>PRJ301 Demo - LoginADMIN</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
                <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/login.css">

    </head>
    <body>
        <!-- Sing in  Form -->
        <section class="sign-in" style="padding-top: 10% ">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/admin.png" alt="sing up image"></figure>

                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        
                        
                        <form action="./adminLogin" method="get" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="userName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="userName" id="your_name"/>
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="your_pass"/>
                            </div>
                            <div class="form-group">
                               
                               
                            </div>
                            <div class="form-group form-button">
                                <input  class="form-submit" type="submit" value="login"/>
                            </div>
                        </form>
                    
                    </div> 
                </div>
            </div>
        </section>

    </div> 
</body>
</html>
