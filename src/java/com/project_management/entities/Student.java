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
public class Student 
{
    private int id;
    private String fname;
    private String lname;
    private String department;
    private String division;
    private String rollNo;
    private String phoneNo;
    private String email;
    private String password;
    private int teamId;
    private Timestamp timestamp;

    public Student() {
    }

    public Student(String fname, String lname, String department, String division, String rollNo, String phoneNo, String email, String password) {
        this.fname = fname;
        this.lname = lname;
        this.department = department;
        this.division = division;
        this.rollNo = rollNo;
        this.phoneNo = phoneNo;
        this.email = email;
        this.password = password;
    }

    public Student(int id, String fname, String lname, String department, String division, String rollNo, String phoneNo, String email, String password, int teamId, Timestamp timestamp) {
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.department = department;
        this.division = division;
        this.rollNo = rollNo;
        this.phoneNo = phoneNo;
        this.email = email;
        this.password = password;
        this.teamId = teamId;
        this.timestamp = timestamp;
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

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getRollNo() {
        return rollNo;
    }

    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
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

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
    
}
