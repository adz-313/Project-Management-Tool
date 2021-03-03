/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project_management.entities;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Coordinator {
    private int id;
    private String fname;
    private String lname;
    private String department;
    private String subject;
    private String email;
    private String password;
    private Timestamp time;

    public Coordinator() {
    }

    public Coordinator(String fname, String lname, String department, String subject, String email, String password) {
        this.fname = fname;
        this.lname = lname;
        this.department = department;
        this.subject = subject;
        this.email = email;
        this.password = password;
    }

    public Coordinator(int id, String fname, String lname, String department, String subject, String email, String password, Timestamp time) {
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.department = department;
        this.subject = subject;
        this.email = email;
        this.password = password;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
