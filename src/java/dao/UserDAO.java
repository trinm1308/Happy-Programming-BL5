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
}
