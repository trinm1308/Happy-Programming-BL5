/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import entity.MentorEntity;
import entity.Point;
import entity.Rating;
import entity.RequestEntity;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;

public class MentorDAO {

    Connection conn = null;

    public List<MentorEntity> getAllMentor(int pagaeIndex, int maxPage, String name) throws SQLException {
        List<MentorEntity> mes = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select u.id, u.full_name, u.serviceDescription,u.skill,u.rate, u.description, u.framework, u.ava from user u \n"
                + "where u.role = 1 and u.full_name like ? LIMIT ? OFFSET ?";
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
            String skill = rs.getString("skill");
            String serviceDescription = rs.getString("serviceDescription");
            MentorEntity mentorEntity = new MentorEntity(id, fullName, ava, description, rate, serviceDescription, skill, 0);
            mes.add(mentorEntity);
        }
        return mes;
    }

    public MentorEntity getMentorByID(int idMentor) throws SQLException {
        List<MentorEntity> mes = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select u.id, u.full_name,u.serviceDescription,u.skill, u.description, u.framework, u.ava, u.rate, u.rate_count from user u\n"
                + "where u.role = 1 and u.id = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, idMentor);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String fullName = rs.getString("full_name");
            String description = rs.getString("description");
            String ava = rs.getString("ava");
            String skill = rs.getString("skill");
            int rate = rs.getInt("rate");
            int rateCount = rs.getInt("rate_count");
            String serviceDescription = rs.getString("serviceDescription");
            return new MentorEntity(id, fullName, ava, description, rate, serviceDescription, skill, rateCount);
        }
        return null;
    }

    public List<Rating> ratings(int idMentor) throws SQLException {
        List<Rating> ratings = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select * from rating where mentor_id = ? order by time";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, idMentor);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            int mentorID = rs.getInt("mentor_id");
            String author = rs.getString("author");
            String comment = rs.getString("comment");
            String time = rs.getString("time");
            int rate = rs.getInt("rate");
            ratings.add(new Rating(id, mentorID, author, rate, comment, time));
        }
        return ratings;
    }

    public List<Rating> getRatingsByPoint(int idMentor, int point) throws SQLException {
        List<Rating> ratings = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select * from rating where mentor_id = ? and rate = ? order by time";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, idMentor);
        ps.setInt(2, point);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            int mentorID = rs.getInt("mentor_id");
            String author = rs.getString("author");
            String comment = rs.getString("comment");
            String time = rs.getString("time");
            int rate = rs.getInt("rate");
            ratings.add(new Rating(id, mentorID, author, rate, comment, time));
        }
        return ratings;
    }

    public void addRequest(MentorEntity entity, String author, int hours, String time, String note) {
        try {
            DBConnect bConnect = new DBConnect();
            conn = bConnect.con;
            String sql = "insert into request (mentor_id, message , start_date, creation_date, status, hours, title, author)\n"
                    + "values (?,?,?,?,?,?,?,?);";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, entity.getId());
            pre.setString(2, note);
            pre.setString(3, time);
            Date date = Calendar.getInstance().getTime();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
            String strDate = dateFormat.format(date);
            pre.setString(4, strDate);
            pre.setInt(5, 1);
            pre.setInt(6, hours);
            pre.setString(7, entity.getSkill());
            pre.setString(8, author);
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<RequestEntity> getListRequest() throws SQLException {
        List<RequestEntity> res = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select * from request";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            res.add(new RequestEntity(rs.getInt("id"), rs.getInt("mentor_id"),
                    rs.getString("message"), rs.getString("start_date"),
                    rs.getString("creation_date"), rs.getInt("hours"),
                    rs.getString("status"), rs.getString("title")));
        }
        return res;
    }

    public void rate(int id, int rate, String comment, String author) {
        try {
            DBConnect bConnect = new DBConnect();
            conn = bConnect.con;
            String sql = "insert into rating (mentor_id,rate,comment,author, time )\n"
                    + "values (?,?,?,?,?);";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.setInt(2, rate);
            pre.setString(3, comment);
            pre.setString(4, author);
            Date date = Calendar.getInstance().getTime();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String strDate = dateFormat.format(date);
            pre.setString(5, dateFormat.format(date));
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Point getRateByMentorID(int idMentor) throws SQLException {
        List<Rating> ratings = new ArrayList<>();
        DBConnect bConnect = new DBConnect();
        conn = bConnect.con;
        String sql = "select rate, rate_count from user where id  = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, idMentor);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int rate = rs.getInt("rate");
            int rateCount = rs.getInt("rate_count");
            return new Point(rate, rateCount);
        }
        return null;
    }

    public void updateRateMentor(int id, int rate, int rateCount) {
        try {
            DBConnect bConnect = new DBConnect();
            conn = bConnect.con;
            String sql = "update user set rate = ?, rate_count = ? where id =?;";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, rate);
            pre.setInt(2, rateCount);
            pre.setInt(3, id);;
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
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
