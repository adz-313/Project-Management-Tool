<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Mentor"%>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>

<div class="row">
<%
    DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
    ArrayList<Mentor> mentors = db.getMentors();
    System.out.println(mentors.size());
    for (Mentor m : mentors) {
%>
<div class="col-md-4">
    <div class="card mt-2">
        <div class="card-body text-center">
            <h4><%= m.getFname() + " " +  m.getLname() %></h4>
            <h5><%= m.getEmail()%></h5>
            <h6 style="color:#999"><%= m.getSkills()%></h6>
        </div>
    </div>
</div>
<%
    }
%>
</div>