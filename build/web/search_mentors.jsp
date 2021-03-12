<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Mentor"%>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>

<div class="row">
<%
    DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
    String search = request.getParameter("search");
    System.out.println(search);
    ArrayList<Mentor> mentors = db.getMentorsByName(search);
    for (Mentor m : mentors) {
       
%>
<div class="col-md-4">
    <div class="card mt-2">
        <img class="card-img-top mx-auto mt-2" src="resources/<%= m.getProfile() %>" alt="profile" style="width: 6rem;">
        <div class="card-body text-center">
            <h4><%= m.getFname() + " " +  m.getLname() %></h4>
            <h5><%= m.getEmail()%></h5>
            <h6 style="color:#999"><%= m.getSkills()%></h6>
            <a href="#" class="btn btn-primary">Profile</a>
        </div>
    </div>
</div>


<%
    }
%>
</div>