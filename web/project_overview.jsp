<%-- 
    Document   : project_overview
    Created on : 21-Feb-2021, 2:55:15 pm
    Author     : Admin
--%>

<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>
<%@page import="com.project_management.entities.Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Project</title>
    <link rel="stylesheet" type="text/css" href="CSS/project_overview.css" />
    <link rel="stylesheet" type="text/css" href="CSS/button_action.css" />
  </head>
  <body>
      <%@include file="navbar.jsp" %>
      <% 
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        System.out.println(projectId);
        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
        Project project = db.getProjectById(projectId);
        System.out.println(project.getTitle());
    %>
    <div class="project-title">
        <h1>
            <% out.print(project.getTitle()); %>
        </h1>
    </div>
    <div class="col">
      <div class="col span-2-of-3">
        <div class="project-description">
          <h2>Description</h2>
            <% out.print(project.getDescription()); %>            
        </div>
        <div class="divider"></div>
        <div class="project-roles">
          <h2>Roles</h2>
          <div class="clearfix">
            <div class="col span-1-of-3 project-members">
              <img
                class="project-member-img"
                src="Images/user.svg"
                alt="user-default"
              />
              <div class="project-member-names">
                <h3>Apurav Deshmukh</h3>
                <h5>Member</h5>
              </div>
            </div>
            <div class="col span-1-of-3 project-members">
              <img
                class="project-member-img"
                src="Images/user.svg"
                alt="user-default"
              />
              <div class="project-member-names">
                <h3>Aryan Gupta</h3>
                <h5>Member</h5>
              </div>
            </div>
            <div class="col span-1-of-3 project-members">
              <img
                class="project-member-img"
                src="Images/user.svg"
                alt="user-default"
              />
              <div class="project-member-names">
                <h3>Aditya Chavan</h3>
                <h5>Member</h5>
              </div>
            </div>
          </div>
          <div class="clearfix">
            <div class="col span-1-of-3 project-members">
              <img
                class="project-member-img"
                src="Images/user.svg"
                alt="user-default"
              />
              <div class="project-member-names">
                <h3>Aditya Sawant</h3>
                <h5>Member</h5>
              </div>
            </div>
          </div>
          <div class="divider"></div>
          <div class="project-milestones">
            <h2>Milestones</h2>
          </div>
        </div>
      </div>
      <div class="col span-1-of-3 column-right">
        <div class="mentor-overview">
          <img class="mentor-img" src="Images/user.svg" alt="user-default" />
          <div class="mentor-name">
            <h3>John Rambo</h3>
          </div>
          <div class="mentor-profession">
            <h4>Engineer</h4>
          </div>
          <div class="mentor-skills">
            <p>HTML, CSS, Js</p>
          </div>
        </div>
        <div class="divider divider-medium"></div>
        <div class="btn">
          <center>
            <a href="Progress.html">Progress</a>
          </center>
        </div>
      </div>
    </div>
  </body>
</html>
