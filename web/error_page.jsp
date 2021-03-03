<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/basic_setup.css" />
        <link rel="stylesheet" type="text/css" href="CSS/error_page.css" />
        <link rel="stylesheet" type="text/css" href="CSS/button_action.css" />
    </head>
    <body>
    <center>
        <img class="error_img" src="Images/error.svg" alt="error_page"/>
        <h2 class="error_msg">Sorry! Something went wrong...</h2>
        <h2 class="error_text"><%= exception %></h2>
        <div class="row">
            <a href="index.html" class="btn">Home</a>
        </div>
    </center>
</body>
</html>
