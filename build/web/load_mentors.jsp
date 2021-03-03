<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Mentor"%>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>
<%
    DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
    ArrayList<Mentor> mentors = db.getMentors();
    for (Mentor m : mentors) {
%>
<div class="col-md-4">
    <div class="card">
        <div class="card-body text-center">
            <h5><%= m.getFname() + " " +  m.getLname() %></h5>
            <p><%= m.getSkills()%></p>
        </div>
    </div>
</div>


<%
    }
%>