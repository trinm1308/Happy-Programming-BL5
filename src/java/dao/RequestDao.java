/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import entity.Request;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Nguyen Van Long
 */
public class RequestDao {
    
    PreparedStatement ps;
    ResultSet rs;
    Connection con;
    
    private DBConnect dbConn = null;
    
    public RequestDao(DBConnect dbconn) {
        con = dbconn.con;
        this.dbConn = dbconn;
    }
    
    public int getMaxRequestId() {
        String query = "SELECT MAX(id)FROM Request";
        int output = 0;
        try {
            
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                output = rs.getInt(1);
            }
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (Exception e) {
            System.out.println(e);
            output = -2;
        }
        return output;
    }
    
    public void createRequest(Request request) {
        String query = "INSERT INTO `request` (`mentee_id`, `mentor_id`, `message`, `deadline_date`, `creation_date`, `finish_date`, `status`, `hours`, `title`) VALUES (?, null, ?, ?, ?, ?, ?, ?, ?);";
        
        try {
            
            ps = con.prepareStatement(query);
            ps.setInt(1, request.getMentee_id());
            ps.setString(2, request.getMess());
            ps.setDate(3, request.getDeadline() == null ? null : new java.sql.Date(request.getDeadline().getTime()));
            ps.setDate(4, request.getCreationDate() == null ? null : new java.sql.Date(request.getCreationDate().getTime()));
            ps.setDate(5, request.getFinishDate() == null ? null : new java.sql.Date(request.getFinishDate().getTime()));
            ps.setInt(6, request.getStatus());
            ps.setFloat(7, request.getDeadlineHour());
            ps.setString(8, request.getTitle());
            ps.executeUpdate();
            
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public Request getRequestById(int id) {
        String query = "SELECT * From Request where id = (?)";
        try {
            
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Request(rs.getInt("id"), rs.getInt("mentee_id"),
                        rs.getInt("mentor_id"), rs.getString("message"), rs.getString("title"),
                        rs.getDate("deadline_date"), rs.getDate("creation_date"), rs.getDate("finish_date"),
                        rs.getInt("status"), rs.getFloat("hours"));
            }
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<Request> getListRequestById(int id) {
        List<Request> ls = new ArrayList<Request>();
        String query = "SELECT * From Request where mentee_id = (?)";
        try {
            
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Request(rs.getInt("id"), rs.getInt("mentee_id"),
                        rs.getInt("mentor_id"), rs.getString("message"), rs.getString("title"),
                        rs.getDate("deadline_date"), rs.getDate("creation_date"), rs.getDate("finish_date"),
                        rs.getInt("status"), rs.getFloat("hours")));
            }
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ls;
    }
    
    public List<Request> getListRequestByMentorId(int id) {
        List<Request> ls = new ArrayList<Request>();
        String query = "SELECT * From Request where mentor_id = (?) and status != 1";
        try {
            
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Request(rs.getInt("id"), rs.getInt("mentee_id"),
                        rs.getInt("mentor_id"), rs.getString("message"), rs.getString("title"),
                        rs.getDate("deadline_date"), rs.getDate("creation_date"), rs.getDate("finish_date"),
                        rs.getInt("status"), rs.getFloat("hours")));
            }
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ls;
    }
    
    public void updateRequestByMentee(int requestId, String message, int status, float hours, String title, Date deadline_date, Date finish_date) {
        String query = "UPDATE `happyprogramming`.`request` SET `message` = (?), `status`= (?), `hours` = (?) , `title` = (?) , `deadline_date` = (?), `finish_date` = (?) WHERE (`id` = (?))";
        try {
            
            ps = con.prepareStatement(query);
            ps.setString(1, message);
            ps.setInt(2, status);
            ps.setFloat(3, hours);
            ps.setString(4, title);
            ps.setDate(5, new java.sql.Date(deadline_date.getTime()));
            ps.setDate(6, finish_date == null ? null : new java.sql.Date(finish_date.getTime()));
            ps.setInt(7, requestId);
            ps.executeUpdate();
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateRequestStatusById(int status, int request_id) {
        String query = "update request set status = (?) where id=(?)";
        try {
            
            ps = con.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, request_id);
            ps.executeUpdate();
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateRequestStatusAndDateById(int status, int request_id, Date finish_date) {
        String query = "update request set status = (?), finish_date=(?) where id=(?)";
        try {
            
            ps = con.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(3, request_id);
            ps.setDate(2, new java.sql.Date(finish_date.getTime()));
            ps.executeUpdate();
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public int getMentorNumberById(int id) {
        String query = "SELECT COUNT(distinct mentor_id) FROM request WHERE mentee_id = (?)";
        try {
            
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }
    
    public void updateRequestMentorById(int mentor_id, int request_id) {
        String query = "update request set mentor_id = (?) where id=(?)";
        try {
            
            ps = con.prepareStatement(query);
            ps.setInt(1, mentor_id);
            ps.setInt(2, request_id);
            ps.executeUpdate();
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public int[] getRequestCounts() {
        try {
            String sql = "SELECT (\n"
                    + "	select count(r.id) as pending \n"
                    + "	FROM request r\n"
                    + "	where r.status = 0\n"
                    + "    ) as pending,\n"
                    + "    (\n"
                    + "	select count(r.id) as accepted \n"
                    + "	FROM request r\n"
                    + "	where r.status = 1\n"
                    + "    ) as accepted,\n"
                    + "        (\n"
                    + "	select count(r.id) as rejected \n"
                    + "	FROM request r\n"
                    + "	where r.status = 2\n"
                    + "    ) as rejected";
            
            PreparedStatement pre = con.prepareStatement(sql);
            
            ResultSet rs = pre.executeQuery();
            
            int[] counts = new int[3];
            if (rs.next()) {
                counts[0] = rs.getInt("pending");
                counts[1] = rs.getInt("accepted");
                counts[2] = rs.getInt("rejected");
                return counts;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<Request> getRecentRequests(int count) {
        try {
            String sql = "select r.id, r.mentee_id, u.full_name as mentee_name, r.mentor_id, u2.full_name as mentor_name, r.request_date, r.status\n"
                    + "from request r "
                    + "left join user u on r.mentee_id = u.id "
                    + "left join user u2 on r.mentor_id = u2.id "
                    + "order by r.request_date DESC "
                    + "limit ? ";
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, count);
            
            ResultSet rs = pre.executeQuery();
            
            ArrayList<Request> requests = new ArrayList<>();
            while (rs.next()) {
                Request r = new Request();
                r.setId(rs.getInt("id"));
                r.setMenteeName(rs.getString("mentee_name"));
                r.setMentorName(rs.getString("mentor_name"));
                r.setRequestDate(rs.getString("request_date"));
                r.setStatus(rs.getInt("status"));
                
                requests.add(r);
            }
            return requests;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
}
