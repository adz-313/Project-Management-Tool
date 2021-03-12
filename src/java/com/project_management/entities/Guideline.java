/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project_management.entities;

/**
 *
 * @author Admin
 */
public class Guideline 
{
    private int id;
    private String title;
    private int coordinatorId;
    private String filename;

    public Guideline() {
    }

    public Guideline(String title, int coordinatorId, String filename) {
        this.title = title;
        this.coordinatorId = coordinatorId;
        this.filename = filename;
    }

    public Guideline(int id, String title, int coordinatorId, String filename) {
        this.id = id;
        this.title = title;
        this.coordinatorId = coordinatorId;
        this.filename = filename;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCoordinatorId() {
        return coordinatorId;
    }

    public void setCoordinatorId(int coordinatorId) {
        this.coordinatorId = coordinatorId;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
