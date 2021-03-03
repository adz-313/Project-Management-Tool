/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project_management.servlets;

import com.project_management.database.DatabaseInterface;
import com.project_management.entities.Project;
import com.project_management.entities.User;
import com.project_management.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author Admin
 */
public class AddProjectServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProjectServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            
            int userId = user.getId();
            
            Project project = new Project(title, description, userId);
            
            DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
            if(db.saveProject(project))
            {
                out.print("Success");  
                response.sendRedirect("project_overview.jsp?projectId=" + db.getProjectByUserIdAndTitle(userId, title));            
            }
            else
            {
                out.print("fail");
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
