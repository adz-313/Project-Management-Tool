<%@page import="com.project_management.entities.Coordinator"%>
<%@page import="com.project_management.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Barlow%7CBarlow+Condensed:400,700&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="CSS/navbar.css">
    </head>
    <body>
        <nav>
            <!--            <div class="container">
                            
                            <h2>PROJECTIFY</h2>
            
                            <ul>
                                
                                <li><a href="home.jsp">Home</a></li>
                                <li><a href="#">Contact</a></li>
            <%
                Coordinator user = (Coordinator) session.getAttribute("currentUser");
            %>
            <c:set var="user" value="${user}"/>      
            <c:choose>
                <c:when test="user != null">                            
                    <li><a href="login">Login</a></li>
                    <li><a class="special" href="register_page.html">Register</a></li>
                </c:when>
                <c:otherwise >                        
                    <li><a href="add_project.jsp">Add Project</a></li>
                    <li><a class="special" href="#">Profile</a></li>
                    <li><a href="LogoutServlet">Logout</a></li>
                </c:otherwise> 
            </c:choose>     
                      
        </ul>

    </div>
</nav>-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="#">
                    <button type="button" id="sidebarCollapse" class="btn btn-info bg-primary mt-1 mr-1 d-inline-block align-top">
                        <i class="fas fa-bars"></i>
                    </button>
                    Projectify
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
<!--                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Logout</a>
                        </li>-->
                        <c:set var="user" value="${user}"/>      
                        <c:choose>
                            <c:when test="user != null">                            
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Register</a>
                                </li>
                            </c:when>
                            <c:otherwise >
                            <li class="nav-item">
                                <a class="nav-link" href="approvals.jsp">Approvals <span class="badge badge-light">2</span></a>                                
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="LogoutServlet">Logout</a>
                            </li>
                            </c:otherwise> 
                        </c:choose> 
                    </ul>
                </div>
            </nav>           
    </body>
</html>
