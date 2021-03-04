package com.project_management.database;

import com.project_management.entities.Coordinator;
import com.project_management.entities.Mentor;
import com.project_management.entities.Project;
import com.project_management.entities.Student;
import com.project_management.entities.Team;
import java.sql.*;
import java.util.ArrayList;

public class DatabaseInterface 
{
    private Connection con;

    public DatabaseInterface(Connection con) {
        this.con = con;
    }

    public DatabaseInterface() {
    }
    
    public boolean saveProject(Project project)
    {
        boolean dataInserted = false;
        try
        {
            String query = "insert into project(title, description, user_id) values(?,?);";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, project.getTitle());
            pstmt.setString(2, project.getDescription());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public int getApprovalCount()
    {
        int cnt = 0;
        try
        {
            String query = "select count(*) from teams where status = 'PENDING'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            cnt = rs.getInt(1);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return cnt;
    }
    
    public ArrayList<Team> getTeamApprovals()
    {
        ArrayList<Team> approvals = new ArrayList<Team>();
        try
        {
            String query = "select * from teams where status = 'PENDING'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                int id = rs.getInt("id");
                int created_by = rs.getInt("createdBy");
                int project_id = rs.getInt("projectId");
                int mentor_id = rs.getInt("mentorId");
                String status = rs.getString("status");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Team team = new Team(id, created_by, project_id, mentor_id, status, timestamp);
                approvals.add(team);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return approvals;
    }
     
    public int getProjectByUserIdAndTitle(int userId, String title)
    {
        int projectId = -1;
        try
        {
            String query = "select project_id from project where title=? and user_id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, title);
            pstmt.setInt(2, userId);
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                projectId = rs.getInt("project_id");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return projectId;
    }
    
    public Project getProjectById(int projectId)
    {
        Project project = null;
        try
        {
            String query = "select * from projects where id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, projectId);
            System.out.println(pstmt.toString());
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                project = new Project();
                project.setProject_id(rs.getInt("id"));
                project.setTitle(rs.getString("title"));
                project.setDescription(rs.getString("description"));
                project.setTimestamp(rs.getTimestamp("timestamp"));                
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        System.out.println(project.getTitle());
        return project;
    }
    
    public boolean saveCoordinator(Coordinator coordinator)
    {
        boolean dataInserted = false;
        try
        {          
            String query = "insert into coordinators(fname, lname, department, subject, email, password) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, coordinator.getFname());
            pstmt.setString(2, coordinator.getLname());
            pstmt.setString(3, coordinator.getDepartment());
            pstmt.setString(4, coordinator.getSubject());
            pstmt.setString(5, coordinator.getEmail());
            pstmt.setString(6, coordinator.getPassword());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public Coordinator getCoordinatorByEmailAndPassword(String email, String password)
    {
        Coordinator coordinator = null;
        try
        {
            String query = "select * from coordinators where email=? and password=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                coordinator = new Coordinator();
                coordinator.setId(rs.getInt("id"));                
                coordinator.setFname(rs.getString("fname"));                
                coordinator.setLname(rs.getString("lname"));
                coordinator.setDepartment(rs.getString("department"));
                coordinator.setSubject(rs.getString("subject"));
                coordinator.setEmail(rs.getString("email"));
                coordinator.setPassword(rs.getString("password"));
                coordinator.setTime(rs.getTimestamp("timestamp"));
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return coordinator;
    }
    
    public ArrayList<Mentor> getMentors()
    {
        ArrayList<Mentor> mentors = new ArrayList<Mentor>();
        try
        {            
            String query = "select * from mentors";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String skills = rs.getString("skills");
                String email = rs.getString("email");
                String password = rs.getString("password");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Mentor mentor = new Mentor(id, fname, lname, skills, email, password, timestamp);
                mentors.add(mentor);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return mentors;
    }
    
    public ArrayList<Mentor> getMentorsByName(String search)
    {
        ArrayList<Mentor> mentors = new ArrayList<Mentor>();
        try
        {            
            String query = "select * from mentors where fname like '%" + search + "%' or lname like '%" + search + "%'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String skills = rs.getString("skills");
                String email = rs.getString("email");
                String password = rs.getString("password");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Mentor mentor = new Mentor(id, fname, lname, skills, email, password, timestamp);
                mentors.add(mentor);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return mentors;
    }
    
    public boolean saveStudent(Student student)
    {
        boolean dataInserted = false;
        try
        {          
            String query = "insert into coordinators(fname, lname, department, subject, email, password) values(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, student.getFname());
            pstmt.setString(2, student.getLname());
            pstmt.setString(3, student.getDepartment());
            pstmt.setString(4, student.getDivision());
            pstmt.setString(5, student.getRollNo());
            pstmt.setString(6, student.getPhoneNo());
            pstmt.setString(7, student.getEmail());
            pstmt.setString(8, student.getPassword());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public ArrayList<Student> getStudents()
    {
        ArrayList<Student> students = new ArrayList<Student>();
        try
        {            
            String query = "select * from students";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String department = rs.getString("department");
                String division = rs.getString("division");
                String rollNo = rs.getString("rollNo");
                String phoneNo = rs.getString("phoneNo");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int teamId = rs.getInt("teamId");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Student student = new Student(id, fname, lname, department, division, rollNo, phoneNo, email, password, teamId, timestamp);
                students.add(student);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return students;
    }
    
    public ArrayList<Student> getStudentsByName(String search)
    {
        ArrayList<Student> students = new ArrayList<Student>();
        try
        {            
            String query = "select * from students where fname like '%" + search + "%' or lname like '%" + search + "%'";
            PreparedStatement pstmt = con.prepareStatement(query);
            System.out.println(pstmt);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String department = rs.getString("department");
                String division = rs.getString("division");
                String rollNo = rs.getString("rollNo");
                String phoneNo = rs.getString("phoneNo");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int teamId = rs.getInt("teamId");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Student student = new Student(id, fname, lname, department, division, rollNo, phoneNo, email, password, teamId, timestamp);
                students.add(student);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return students;
    }
    
    public Student getStudentById(int sid)
    {
        Student student = null;
        try
        {            
            String query = "select * from students where id=" + sid + ";";
            PreparedStatement pstmt = con.prepareStatement(query);
            System.out.println(pstmt);
            ResultSet rs = pstmt.executeQuery(); 
            if(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String department = rs.getString("department");
                String division = rs.getString("division");
                String rollNo = rs.getString("rollNo");
                String phoneNo = rs.getString("phoneNo");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int teamId = rs.getInt("teamId");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                student = new Student(id, fname, lname, department, division, rollNo, phoneNo, email, password, teamId, timestamp);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return student;
    }
}
