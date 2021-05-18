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
public class Mentor {
    private int id;
    private String fname;
    private String lname;
    private String skills;
    private String email;
    private String password;
    private Timestamp timestamp;
    private String profile;

    public Mentor() {
    }

    public Mentor(String fname, String lname, String skills, String email, String password, String profile) {
        this.fname = fname;
        this.lname = lname;
        this.skills = skills;
        this.email = email;
        this.password = password;
        this.profile = profile;
    }

    public Mentor(int id, String fname, String lname, String skills, String email, String password, Timestamp timestamp, String profile) {
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.skills = skills;
        this.email = email;
        this.password = password;
        this.timestamp = timestamp;
        this.profile = profile;
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

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
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

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
}
