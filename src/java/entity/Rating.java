/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Timestamp;

/**
 *
 * @author Dao Van Do
 */
public class Rating {

    private int id;
    private int mentorID;
    private String author;
    private int point;
    private String content;
    private String createdTime;

    public Rating(int id, int mentorID, String author, int point, String content, String createdTime) {
        this.id = id;
        this.mentorID = mentorID;
        this.author = author;
        this.point = point;
        this.content = content;
        this.createdTime = createdTime;
    }

    public Rating() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRestaurantId() {
        return mentorID;
    }

    public void setRestaurantId(int mentorID) {
        this.mentorID = mentorID;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
}
