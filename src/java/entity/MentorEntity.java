/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Dao Van Do
 */
public class MentorEntity {

    int id;
    String fullName;
    String account;
    String password;
    String email;
    String phone;
    boolean gender;
    String address;
    String description;
    int role;
    String ava;
    int rate;
    String serviceDescription;
    String skill;
    int rateCount;

    public MentorEntity() {
    }

    public MentorEntity(int id, String fullName, String account, String password, String email, String phone, boolean gender, String address, int role, String ava, String description) {
        this.id = id;
        this.fullName = fullName;
        this.account = account;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.role = role;
        this.ava = ava;
        this.description = description;
    }

    public MentorEntity(int id, String fullName, String ava, String description, int rate, String serviceDescription, String skill, int rateCount) {
        this.id = id;
        this.fullName = fullName;
        this.ava = ava;
        this.description = description;
        this.rate = rate;
        this.serviceDescription = serviceDescription;
        this.skill = skill;
        this.rateCount = rateCount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public int getRateCount() {
        return rateCount;
    }

    public void setRateCount(int rateCount) {
        this.rateCount = rateCount;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAva() {
        return ava;
    }

    public void setAva(String ava) {
        this.ava = ava;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

}
