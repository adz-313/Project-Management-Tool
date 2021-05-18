<%@page import="com.project_management.entities.Mentor"%>
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
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#approvalModal">
                                Approve
                            </button>
                        </form> 



                        <!-- Modal -->
                        <div class="modal fade" id="approvalModal" tabindex="-1" role="dialog" aria-labelledby="approvalModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="eapprovalModalLabel">Remark</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="UpdateApprovalServlet?team_id=<%= t.getId()%>" method="post">
                                        <div class="modal-body">

                                            <div class="form-group">
                                                <label for="message-text" class="col-form-label">Message:</label>
                                                <textarea class="form-control" id="message-text" name="remark"></textarea>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-outline-success mr-2" type="submit" name="btnAccept" value="1">Accept</button>
                                            <button class="btn btn-outline-danger" type="submit" name="btnReject" value="0">Reject</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div> 

                        <%
                            }
                        %>
                    </div>
                    <div class="card mb-2 mt-2 box-shadow">
                        <div class="card-body">
                            <h3 class="card-title font-weight-bold"><%= p.getTitle()%></h3>

                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <h5>Description</h5>
                                    <p class="card-text"><%= p.getDescription()%></p>
                                </li>
                                <%
                                    if (t.getStatus().equals("APPROVED") && t.getRemark() != null && !t.getRemark().equals("")) {
                                %>
                                <li class="list-group-item">
                                    <h5>Remarks</h5>
                                    <p class="card-text"><%= t.getRemark()%></p>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
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
                                        <a class="btn btn-primary" href="#">Profile</a>
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

                    <div class="card mb-2 mt-2 box-shadow p-3">
                        <div class="row border-bottom border-gray mb-2 mt-0">
                            <h3 class="mr-auto ml-4">Mentor</h3>
                            <% if (t.getMentor_id() != 0) {%>  
                            <button class="btn btn-link mr-4"><a href="assign_mentors.jsp?id=<%= t.getId()%>"><i class="fas fa-user-edit"></i></a></button>
                            <% } %>
                        </div>
                        <div class="row p-1">

                            <% if (t.getMentor_id() != 0) {
                                    Mentor m = db.getMentorByID(t.getMentor_id());
                            %>

                            <div class="col-md-3">
                                <div class="d-flex justify-content-center">
                                    <img src="resources/<%= m.getProfile()%>" alt="..." class="img-thumbnail rounded" style="width: 8rem"/>
                                </div>

                            </div>
                            <div class="col-md-9">
                                <h2 class="mt-1 ml-auto"><%= m.getFname() + " " + m.getLname()%></h2>
                                <p class="ml-auto mb-0 text-dark"><%= m.getEmail()%></p>
                                <p class="ml-auto mb-0 text-dark">Skills: <%= m.getSkills()%></p>
                            </div>

                            <% } else {%>
                            <div class="ml-auto mr-auto pt-3 pb-3">
                                <h5>No Mentor Assigned</h5>
                                <button class="btn btn-primary ml-4"><a href="assign_mentors.jsp?id=<%= t.getId()%>">Assign Mentor</a></button>
                            </div>


                            <% } %>
                        </div>
                    </div>
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
                    if (<%= cnt%> === 0)
                    {
                        $('#approvals-badge').hide();
                    } else
                    {
                        $('#approvals-badge').html(
                <%= cnt%>
                        );
                    }
                });
            </script>
    </body>
</html>
