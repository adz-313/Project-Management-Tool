<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Student"%>
<%@page import="com.project_management.entities.Team"%>
<%@page import="com.project_management.entities.Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/project_overview.css">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="wrapper">
            <%@include file="sidebar.jsp" %>
            <%                if (user == null) {
                    response.sendRedirect("login_page.jsp");
                }
                int projectId = Integer.parseInt(request.getParameter("project_id"));
                int teamId = Integer.parseInt(request.getParameter("team_id"));
                Team t = db.getTeamById(teamId);
                Project p = db.getProjectById(projectId);
                ArrayList<Student> students = db.getStudentsByTeamId(teamId);
            %>
            <div id="content">
                <div class="container-fluid" id="project-container">
                    <div class="row">
                        <h1 class="mr-auto">Project</h1>

                        <%
                            if (t.getStatus().equals("PENDING")) {
                        %>

                        <form class="form-inline my-2 my-lg-0">
                            <button class="btn btn-outline-success mr-2"><a href="UpdateApprovalServlet?team_id=<%= t.getId()%>&status=1">Accept</a></button>
                            <button class="btn btn-outline-danger"><a href="UpdateApprovalServlet?team_id=<%= t.getId()%>&status=0">Reject</a></button>
                        </form> 

                        <%
                            }
                        %>
                    </div>
                    <div class="card mb-2 mt-2 box-shadow">
                        <div class="card-body">
                            <h3 class="card-title font-weight-bold"><%= p.getTitle()%></h3>
                            <p class="card-text"><%= p.getDescription()%></p>
                            <p class="card-text"><small class="text-muted"><%= p.getTimestamp()%></small></p>
                        </div>
                    </div>
                    <div class="shadow-lg p-3 bg-primary rounded box-shadow">
                        <h3 class="text-light border-bottom border-gray pb-2">Team Members</h3>
                        <div class="row">                            
                            <%
                                for (Student s : students) {
                            %>
                            <div class="col-3">
                                <div class="card mt-2 pt-3">
                                    <img class="card-img-top mx-auto" src="resources/<%= s.getProfile()%>" alt="profile" style="width: 6rem; border-radius: 50%">
                                    <div class="card-body text-center">                                       
                                        <h5><%= s.getFname() + " " + s.getLname()%></h5>
                                        <h6 style="color:#999"><%= s.getRollNo()%></h6>
                                        <button class="btn btn-primary"><a href="#">Profile</a></button>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>

                    <%
                        //                        if team not approved
                        if (!t.getStatus().equals("PENDING")) {
                    %>

                    <div class="my-3 p-3 bg-dark rounded box-shadow">
                        <h3 class="text-light border-bottom border-gray pb-2">Updates</h3>
                        <div class="media text-white pt-3">
                            <img src="resources/user.png" alt="" class="mr-2 rounded" style="height: 2.5rem">
                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">@username</strong>
                                Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                            </p>
                        </div>
                    </div>

                    <%
                        }

                    %>

                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="Javascript/sidebar.js"></script>  
            <script>
                $(document).ready(function (e) {
                    $('#home').removeClass('active');
                    $('#approvals-badge').html(
                <%= cnt%>
                    );
                });
            </script>
    </body>
</html>
