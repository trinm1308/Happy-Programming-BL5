/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import entity.MentorEntity;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MentorDAO {

    Connection conn = null;

    public List<MentorEntity> getAllMentor() throws SQLException {
        List<MentorEntity> mes = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
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
            String description = rs.getString("description");
            int role = rs.getInt("role");
            String ava = rs.getString("ava");
            MentorEntity mentorEntity = new MentorEntity(id, fullName, account, password, email, phone, gender, address, role, ava, description);
            mes.add(mentorEntity);
        }
        return mes;
    }

}
