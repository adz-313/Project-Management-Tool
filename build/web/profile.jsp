<%@page import="com.project_management.entities.Student"%>
<%@page import="com.project_management.entities.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Team"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="wrapper">
            <%@include file="sidebar.jsp" %>
            <%                if (user == null) {
                    response.sendRedirect("login_page.jsp");
                }
            %>
            <div id="content">
                <div class="container-fluid">
                    <div class="row no-gutters">
                        <div class="col-md-3">
                            <div class="d-flex justify-content-center">
                                <img src="resources/<%= user.getProfile()%>" alt="..." class="img-thumbnail rounded" style="width: 10rem"/>
                            </div>

                        </div>
                        <div class="col-md-9">
                            <h2 class="mt-1 ml-auto"><%= user.getFname() + " " + user.getLname()%></h2>
                            <p class="ml-auto mb-0 text-dark"><%= user.getEmail()%></p>
                            <p class="ml-auto mb-0 text-dark">Department: <%= user.getDepartment()%></p>
                            <p class="ml-auto mb-0 text-dark">Subject: <%= user.getSubject()%></p>
                        </div>
                    </div>
                    <h3 class="mb-3 mt-4">Approved Projects</h3>


                    <%
                        ArrayList<Team> teams = db.getTeamsByCoordinatorId(user.getId());
                        for (Team t : teams) {
                            Project p = db.getProjectById(t.getProject_id());
                            Student s = db.getStudentById(t.getCreated_by());
                    %>
                    <div class="row mt-2">
                        <div class="card w-100">
                            <div class="card-body">
                                <h3 class="card-title"><%= p.getTitle()%></h3>
                                <p class="card-text"><%= p.getDescription()%></p>
                                <button class="btn btn-primary"><a href="project_overview.jsp?team_id=<%= t.getId()%>&project_id=<%= p.getProject_id()%>">View</a></button>
                            </div>
                        </div>
                    </div>

                    <%        }
                    %>

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="Javascript/sidebar.js"></script>   
        <script>
            if (<%= cnt%> === 0)
            {
                $('#approvals-badge').hide();
            } else
            {
                $('#approvals-badge').html(
            <%= cnt%>
                );
            }
        </script>
    </body>  
</html>
