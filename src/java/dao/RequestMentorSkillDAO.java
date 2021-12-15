/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import entity.Rating;
import entity.RequestMentorSkill;
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
public class RequestMentorSkillDAO {

    Connection conn = null;

    DBConnect dbConn = null;

    public RequestMentorSkillDAO(DBConnect dbconn) {
        conn = dbconn.con;
        this.dbConn = dbconn;
    }

    public ArrayList<RequestMentorSkill> getPaginatedPending(int limit, int offset) {
        try {
            String sql = "select r.id, r.userid, u.full_name as userName, r.skillid, s.name as skillName, r.introduce, r.status \n"
                    + "from request_mentor_skill r "
                    + "left join skill s on r.skillid = s.id "
                    + "left join user u on r.userid = u.id "
                    + "where r.status = 0 "
                    + "order by r.id DESC "
                    + "limit ? offset ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, limit);
            pre.setInt(2, offset);

            ResultSet rs = pre.executeQuery();

            ArrayList<RequestMentorSkill> rms = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("userid");
                int skillId = rs.getInt("skillid");
                String introduce = rs.getString("introduce");
                int status = rs.getInt("status");

                RequestMentorSkill rm = new RequestMentorSkill(id, userId, skillId, introduce, status);

                rm.setUserName(rs.getString("userName"));
                rm.setSkillName(rs.getString("skillName"));

                rms.add(rm);

            }
            return rms;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getCountOfStatus(int status) {
        try {
            String sql = "select count(*) as count \n"
                    + "from request_mentor_skill r "
                    + "where r.status = ? ";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, status);

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                return rs.getInt("count");
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public ArrayList<RequestMentorSkill> getPaginatedHistory(int limit, int offset) {
        try {
            String sql = "select r.id, r.userid, u.full_name as userName, r.skillid, s.name as skillName, r.introduce, r.status \n"
                    + "from request_mentor_skill r "
                    + "left join skill s on r.skillid = s.id "
                    + "left join user u on r.userid = u.id "
                    + "where NOT r.status = 0 "
                    + "order by r.id DESC "
                    + "limit ? offset ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, limit);
            pre.setInt(2, offset);

            ResultSet rs = pre.executeQuery();

            ArrayList<RequestMentorSkill> rms = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("userid");
                int skillId = rs.getInt("skillid");
                String introduce = rs.getString("introduce");
                int status = rs.getInt("status");

                RequestMentorSkill rm = new RequestMentorSkill(id, userId, skillId, introduce, status);

                rm.setUserName(rs.getString("userName"));
                rm.setSkillName(rs.getString("skillName"));

                rms.add(rm);

            }
            return rms;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void acceptRequest(int requestId, int userId) {
        try {
            String sql = "update request_mentor_skill set status = 1 where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, requestId);

            pre.executeUpdate();

            String updateUserSql = "update user set role = 0 where id = ?";
            PreparedStatement preUpdateUserSql = conn.prepareStatement(updateUserSql);
            preUpdateUserSql.setInt(1, userId);

            preUpdateUserSql.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void rejectRequest(int requestId) {
        try {
            String sql = "update request_mentor_skill set status = 2 where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, requestId);

            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void revertRequest(int requestId, int userId, int status) {
        try {
            if (status == 1) {
                String updateUserSql = "update user set role = 1 where id = ?";
                PreparedStatement preUpdateUserSql = conn.prepareStatement(updateUserSql);
                preUpdateUserSql.setInt(1, userId);

                preUpdateUserSql.executeUpdate();
            } else {
                return;
            }

            String sql = "update request_mentor_skill set status = 0 where id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, requestId);

            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
