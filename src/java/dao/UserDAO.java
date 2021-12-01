/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tri
 */
public class UserDAO {

    Connection conn = null;

    DBConnect dbConn = null;

    public UserDAO(DBConnect dbconn) {
        conn = dbconn.con;
        this.dbConn = dbconn;
    }

    public ArrayList<User> getUsers() {
        try {
            ArrayList<User> users = new ArrayList<>();

            String sql = "select * from user";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                User u = new User(id, fullName, account, password, email, phone, gender, address, role, ava);

                users.add(u);
            }

            return users;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

 public User checkUser(String account, String password) {
        try {
            String sql = "select * from user where account=? and password =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                 account = rs.getString("account");
                 password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                User u = new User(id, fullName, account, password, email, phone, gender, address, role, ava);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserById(int userId) {
        try {
            String sql = "select * from user where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                String ava = rs.getString("ava");
                User u = new User(id, fullName, account, password, email, phone, gender, address, role, ava);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editUser(int id, String fullName, String account, String email, String phone, boolean gender, String address) {
        try {
            String sql = "update user set full_name = ?, "
                    + "account = ?, "
                    + "email = ?, "
                    + "phone = ?, "
                    + "gender = ?, "
                    + "address = ? "
                    + "where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, fullName);
            pre.setString(2, account);
            pre.setString(3, email);
            pre.setString(4, phone);
            pre.setBoolean(5, gender);
            pre.setString(6, address);
            pre.setInt(7, id);

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addUser(String fullName, String account, String email, String phone, boolean gender, String address) {
        try {
            String sql = "insert into user (full_name, account, email, phone, gender, address, role, password) values (?,?,?,?,?,?,?,?)";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, fullName);
            pre.setString(2, account);
            pre.setString(3, email);
            pre.setString(4, phone);
            pre.setBoolean(5, gender);
            pre.setString(6, address);
            pre.setInt(7, 0);
            pre.setString(8, "12345678");

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(int id) {
        try {
            String sql = "delete from user where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
