/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Nguyen Van Long
 */
public class Skill {

    private int id;
    private String name;
    private String status;
    private String image;
    private int countRequest;
    private String content;
    private int categoryId;
    private String category;

    public Skill(int id, String name, String status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    public Skill(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Skill() {
    }

    public Skill(int id, String name, String status, int countRequest) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.countRequest = countRequest;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Skill(int id, String name, String status, String image, int countRequest) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.image = image;
        this.countRequest = countRequest;
    }

    public Skill(int id, String name, String status, String image, int countRequest, String content) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.image = image;
        this.countRequest = countRequest;
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Skill{" + "id=" + id + ", name=" + name + ", status=" + status + '}';
    }

    public int getCountRequest() {
        return countRequest;
    }

    @Override
    public boolean equals(Object o) {
        return ((Skill) o).getId() == this.id;
    }
}