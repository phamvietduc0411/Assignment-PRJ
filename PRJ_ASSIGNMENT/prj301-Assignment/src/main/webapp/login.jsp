<!DOCTYPE html>
<html>
    <head>
        <title>PRJ301 Demo - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
                <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/login.css">

    </head>
    <body>
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/logo.png" alt="sing up image"></figure>

                                             

                        <a href="signUp.jsp" class="display-flex-center signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        
                     <%String error = (String)request.getParameter("error"); %>
                        <% if (error!=null) {%>
                            <h2><%= error %></h2>
   
                        <%}%>
                        

                        
                        
                        <form action="./login" method="get" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="userName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="userName" id="your_name"/>
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="your_pass"/>
                            </div>
                            <div class="form-group">
                               <input type="hidden" name="option" value="login"  />
                            </div>
                            <div class="form-group form-button">
                                <input  class="form-submit" type="submit" value="Login"/>
                            </div>
                        </form>
                    
                    </div> 
                </div>
            </div>
        </section>
        

    </div> 
   
</body>
</html>
