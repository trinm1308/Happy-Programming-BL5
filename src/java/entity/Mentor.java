/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author HELLO
 */
public class Mentor {
    int id;
    String name;
    String phone;
    String email;
    String skill;
    String gender;
    int rate;

    public Mentor() {
    }

    public Mentor(int id, String name, String phone, String email, String skill, String gender, int rate) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.skill = skill;
        this.gender = gender;
        this.rate = rate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }
    
    

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getSkill() {
        return skill;
    }

    public String getGender() {
        return gender;
    }

    public int getRate() {
        return rate;
    }
    
    
}
