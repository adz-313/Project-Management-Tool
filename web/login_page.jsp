<!DOCTYPE html>
<html>
<head>

    <title>Login Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" >
    <link rel="stylesheet" href="CSS/login_page.css"> 

    <style>

.container-login100{
   width:100%;
   min-height:100vh;
   display:flex;
   flex-wrap: wrap;
   justify-content: center;
   align-items: center;
   padding:15px;
   background-image:url(Images/image_1.jpeg);
   background-position:center;
   background-size: cover;
   background-repeat: no-repeat;
   position: relative;
   z-index:1;
 }

 .login100-form{
   width:100%;
   
  }

    </style>
</head>
<body> 
    
    <div class="container-login100">
        
        <div class="wrap-login100 p-t-50 p-b-90 p-l-50 p-r-50">
            
            <form class="login100-form flex-sb flex-w" action="LoginServlet" method="post">
                
                <span class="login100-form-title">
                    <i class="fas fa-user"></i>
                    
                </span>

                <div class="wrap-input100 m-b-16">
                    <input class="input100" name="email" type="email" placeholder="EMAIL-ID">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 m-b-16">
                    <input class="input100" name="password" type="password" placeholder="PASSWORD">
                    <span class="focus-input100"></span>
                </div>
                                
                <div class="container-login100-form-btn m-t-17">
                    <div class="w-full beforeNone text-center">
                        <input id="btn-submit" type="submit" class="nv-login-submit login100-form-btn" value="Sign In">
                    </div>
                </div>

                <div class="container-login100-form-btn m-t-17">
                    <p>Don't have an account? &nbsp;</p><a href="register_page.html">&nbsp; SIGN UP</a>
                </div>
            </form>
        </div>
    </div> 
</body>
</html>

