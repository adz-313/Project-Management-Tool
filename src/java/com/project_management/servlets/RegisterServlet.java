/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project_management.servlets;

import com.mysql.jdbc.Connection;
import com.project_management.database.DatabaseInterface;
import com.project_management.entities.User;
import com.project_management.helper.ConnectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
@MultipartConfig(fileSizeThreshold= 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 1000,
        maxRequestSize = 1024 * 1024 * 1000
)
public class RegisterServlet extends HttpServlet {

    PrintWriter out = null;
    HttpSession session = null;
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        out = response.getWriter();
        session = request.getSession(false);
        String foldername = "resources";
        System.out.println("yolo: " + request.getServletContext().getRealPath(""));
        String uploadpath = request.getServletContext().getRealPath("") + foldername;
        System.out.println("uploadpath: " + uploadpath);
        File dir = new File(uploadpath);
        if(!dir.exists())
        {
            dir.mkdirs();
        }
        else
        {
            System.out.println("dir exists");
        }
        String username = request.getParameter("user_username");
        String firstname = request.getParameter("user_first_name");
        String lastname = request.getParameter("user_last_name");
        String email = request.getParameter("user_email");
        String phone = request.getParameter("user_phone");
        String password = request.getParameter("user_password"); 
        String filename = null;
        String path = null;

        Part filepart = request.getPart("user_pic");
        if(filepart != null)
        {
            filename = filepart.getSubmittedFileName();
            path = foldername + File.separator + filename;
            System.out.println("filename: " + filename);
            System.out.println("path: " + path);
            System.out.println("name: " + filename);
            InputStream is = filepart.getInputStream();
            Files.copy(is, Paths.get(uploadpath + File.separator +filename), StandardCopyOption.REPLACE_EXISTING);
        }
        
        User user = new User(username, firstname, lastname, email, phone, password, filename, path);

        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
        if(db.saveUser(user))
        {
            out.print("<h1>Success</h1>");
        }
        else
        {
            out.print("<h1>Fail</h1>");
        }
    }
}
