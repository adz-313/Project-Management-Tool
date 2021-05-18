<%@page import="com.project_management.entities.Guideline"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Mentor"%>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>

<div class="row">
    <%
        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
        ArrayList<Guideline> guidelines = db.getGuidelines();
        for (Guideline g : guidelines) {
    %>
    <div class="col-md-4">
        <div class="card w-75 mt-2">
            <img class="card-img-top ml-auto mr-auto mt-3" src="Images/paper.png" alt="Card image cap" style="width: 7rem;">
            <div class="card-body">
                <h5 class="card-title"><%= g.getTitle() %></h5>
                <a href="DownloadGuidelineServlet?fileName=<%= g.getFilename() %>" class="btn btn-primary">Download</a>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>