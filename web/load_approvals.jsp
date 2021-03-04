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
            if (p == null) {
                System.out.println("p is null!!!");
            }
    %>
    <div class="col-3">
        <div class="card mt-2">
            <div class="card-body text-center">
                <h4><%= p.getTitle()%></h4>
                <h5><%= s.getFname() + " " + s.getLname() %></h5>
                <h6 style="color:#999"><%= s.getRollNo() %></h6>
            </div>
        </div>
    </div>


    <%        }
    %>
</div>
