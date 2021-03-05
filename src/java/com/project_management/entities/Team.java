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
public class Team 
{
    private int id;
    private int created_by;
    private int project_id;
    private int mentor_id;
    private int approved_by;
    private String status;
    private Timestamp timestamp; 

    public Team() {
    }

    public Team(int created_by, int project_id) {
        this.created_by = created_by;
        this.project_id = project_id;
    }

    public Team(int id, int created_by, int project_id, int mentor_id, int approved_by, String status, Timestamp timestamp) {
        this.id = id;
        this.created_by = created_by;
        this.project_id = project_id;
        this.mentor_id = mentor_id;
        this.approved_by = approved_by;
        this.status = status;
        this.timestamp = timestamp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public int getApproved_by() {
        return approved_by;
    }

    public void setApproved_by(int approved_by) {
        this.approved_by = approved_by;
    }
    
    
}
