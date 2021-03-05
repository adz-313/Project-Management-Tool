/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project_management.servlets;

import com.project_management.database.DatabaseInterface;
import com.project_management.entities.Coordinator;
import com.project_management.helper.ConnectionProvider;
import com.project_management.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
        Part part = request.getPart("profile_pic");
        String imageName = part.getSubmittedFileName();
        Coordinator coordinator = new Coordinator(fname, lname, department, subject, email, password, imageName);
        
        String path = request.getRealPath("/")+"resources"+File.separator+imageName;
        Helper.deleteFile(path);
        if(Helper.saveFile(part.getInputStream(), path))
        {
            System.out.println("yolo");
        }

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
