/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project_management.servlets;

import com.project_management.database.DatabaseInterface;
import com.project_management.entities.Coordinator;
import com.project_management.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class CoordinatorRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String department = request.getParameter("department");
        String subject = request.getParameter("subject");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Coordinator coordinator = new Coordinator(fname, lname, department, subject, email, password);

        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
        if(db.saveCoordinator(coordinator))
        {
            out.print("<h1>Success</h1>");
        }
        else
        {
            out.print("<h1>Fail</h1>");
        }
    }

}
