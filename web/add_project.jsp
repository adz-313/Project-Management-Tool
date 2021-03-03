<%@page import="com.project_management.entities.User"%>
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
                <h5 class="sign-up-text">Add Project</h5>
                <form action="AddProjectServlet" method="post">
                    <input class="input" type="text" name="title" placeholder="Title">
                    <textarea class="input" name="description" placeholder="Description"></textarea>
                    <button class="btn" type="submit">submit</button>
                </form>
            </div>
        </div>        
    </body>
</html>

