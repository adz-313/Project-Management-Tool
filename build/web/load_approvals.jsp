<%@page import="com.project_management.entities.Project"%>
<%@page import="com.project_management.entities.Team"%>
<%@page import="com.project_management.entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>

<div class="row">
    <%
        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
        ArrayList<Team> teams = db.getTeamApprovals();
        for (Team t : teams) {
            Project p = db.getProjectById(t.getProject_id());
            Student s = db.getStudentById(t.getCreated_by());
    %>
    <div class="col-3">
        <div class="card mt-2">
            <div class="card-body text-center">
                <h3 class="card-title"><%= p.getTitle()%></h3>
                <h5 class="card-text"><%= s.getFname() + " " + s.getLname() %></h5>
                <p class="text-muted mb-1"><%= s.getRollNo() %></p>
                <button class="btn btn-primary"><a href="project_overview.jsp?team_id=<%= t.getId() %>&project_id=<%= p.getProject_id() %>">View</a></button>
            </div>
        </div>
    </div>


    <%        }
        if(teams.size() == 0)
        {
    %>
    <h2 class="ml-auto mr-auto mt-5">No approvals right now</h2>
        
    <%}%>
</div>
