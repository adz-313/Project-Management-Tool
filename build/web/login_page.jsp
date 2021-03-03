<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700;900&display=swap" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="CSS/basic_setup.css" />
        <link rel="stylesheet" type="text/css" href="CSS/button_action.css" />
        <link rel="stylesheet" type="text/css" href="CSS/login_page.css" />
    </head>
    <body>
        <div class="register-page" >
            <div class="sign-up">                
                <img class="sign-up-img" src="pm2.png" alt="sign-up-img">        
                <h5 class="sign-up-text">Manage your projects now</h5>        
            </div>
            <div class="form">
                <h5 class="sign-up-text">Login</h5>
                <form id="login-form" class="register-form" action="LoginServlet" method="post" > 
                    <input name="email" class="input" type="email" placeholder="Email"/>
                    <input name="password" class="input" type="password" placeholder="Password"/>
                    <button class="btn" id="btn-submit" type="submit">Login</button>
                    <p class="message">New here? <a href="register_page.html">Sign Up</a></p>
                </form>
            </div>
        </div>        
    </body>
</html>

