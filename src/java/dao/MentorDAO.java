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

    public List<MentorEntity> getAllMentor(int pagaeIndex, int maxPage, String name) throws SQLException {
        List<MentorEntity> mes = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select u.id, u.full_name, u.description, u.framework, u.ava, r.rate from user u join rating r\n"
                + "on u.id = r.mentor_id and u.role = 1 and u.full_name like ? LIMIT ? OFFSET ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "%" + name + "%");
        ps.setInt(2, maxPage);
        ps.setInt(3, pagaeIndex * maxPage);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String fullName = rs.getString("full_name");
            String description = rs.getString("description");
            String ava = rs.getString("ava");
            int rate = rs.getInt("rate");
            MentorEntity mentorEntity = new MentorEntity(id, fullName, ava, description, rate);
            mes.add(mentorEntity);
        }
        return mes;
    }

    public MentorEntity getMentorByID(int idMentor) throws SQLException {
        List<MentorEntity> mes = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select u.id, u.full_name, u.description, u.framework, u.ava, r.rate from user u join rating r\n"
                + "on u.id = r.mentor_id and u.role = 1 and u.id = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, idMentor);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String fullName = rs.getString("full_name");
            String description = rs.getString("description");
            String ava = rs.getString("ava");
            int rate = rs.getInt("rate");
            return new MentorEntity(id, fullName, ava, description, rate);
        }
        return null;
    }

    public int getTotalRecord(String name) throws SQLException {
        List<MentorEntity> mes = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select count(*) as count from (select u.id, u.full_name, u.description, u.framework, u.ava, r.rate from user u join rating r\n"
                + "on u.id = r.mentor_id and u.role = 1 and full_name like ?) as a;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "%" + name + "%");
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("count");
        }
        return 0;
    }
}
