<%@page import="com.project_management.entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>

<div class="row">
<%
        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
        ArrayList<Student> student = db.getStudents();
        for (Student s : student) {

    %>
    <div class="col-md-4">
        <div class="card mt-2">
            <div class="card-body text-center">
                <h4><%= s.getFname() + " " + s.getLname()%></h4>
                <h5><%= s.getEmail()%></h5>
                <%
                    if(s.getTeamId() == 0)
                    {
                %>
                
                 <h6 style="color:#999">Not in team</h6>
                
                <%   
                    }
                    else
                    {                        
                %>
                
                    <h6 style="color:#999"><%= s.getTeamId() %></h6>
                 
                <%
                    }
                %>
                
            </div>
        </div>
    </div>


    <%
        }
    %>
</div>