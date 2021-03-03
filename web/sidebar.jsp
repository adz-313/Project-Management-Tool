<%-- 
    Document   : sidebar
    Created on : 03-Mar-2021, 2:09:52 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/a3f1b63724.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="CSS/navbar.css">
    </head>
    <body>        
        <nav id="sidebar">
            <ul class="lisst-unstyled components">
                <li id="home" class="active">
                    <a href="home.jsp">Home</a>
                </li>
                <li id="teams">
                    <a href="#">Teams</a>
                </li>
                <li id="mentors">
                    <a href="mentors.jsp">Mentors</a>
                </li>
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Add</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li id="team_approval">
                            <a href="#">Task</a>
                        </li>
                        <li id="task_approval">
                            <a href="#">Guideline</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </body>
</html>
