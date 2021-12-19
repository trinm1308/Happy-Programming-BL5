/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import entity.Skill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SkillDao {

    PreparedStatement ps;
    ResultSet rs;

    private Connection con;

    private DBConnect dbConn = null;

    public SkillDao(DBConnect dbconn) {
        con = dbconn.con;
        this.dbConn = dbconn;
    }
//----------------------------------------------------------------------SKILL----------------------------------------------------------

    public SkillDao() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getHighestSkillID() {
        String query = "SELECT MAX(id) FROM skill;";
        try {

            ps = con.prepareStatement(query);
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
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    // Lấy skill theo id
    public Skill getSkill(int id) {
        String query = "select * from skill where id = ? ";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                Skill s = new Skill(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getString("image"), 0, rs.getString("content"));
                s.setCategoryId(rs.getInt("categoryId"));
                return s;
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
        }
        return null;
    }
    
    

    // Lấy danh sách Skill
    public ArrayList<Skill> getSkillList() {

        ArrayList<Skill> skillList = new ArrayList<>();
        String query = "select A.*, B.name as catName from skill A left join category B on A.categoryId = B.id";

        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Skill s = new Skill();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setContent(rs.getString("content"));
                if(s.getContent() == null) {
                    s.setContent("");
                }
                if(s.getContent().length() > 30) {
                    s.setContent(s.getContent().substring(0, 30));
                }
                s.setImage(rs.getString("image"));
                s.setStatus(rs.getString("description"));
                s.setCategoryId(rs.getInt("categoryId"));
                s.setCategory(rs.getString("catName") == null? "": rs.getString("catName"));
                skillList.add(s);
            }

            try {
                ps.close();
            } catch (SQLException e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return skillList;
    }
    
    public ArrayList<Skill> getRelatedSkill(int id) {
        Skill skillDetail = getSkill(id);
        ArrayList<Skill> skillList = new ArrayList<>();
        String query = "select * from skill where categoryId=?";

        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, skillDetail.getCategoryId());
            rs = ps.executeQuery();

            while (rs.next()) {
                Skill s = new Skill();
                s.setId(rs.getInt("id"));
                if(s.getId() == id) {
                    continue;
                }
                s.setName(rs.getString("name"));
                s.setContent(rs.getString("content"));
                if(s.getContent() == null) {
                    s.setContent("");
                }
                if(s.getContent().length() > 30) {
                    s.setContent(s.getContent().substring(0, 30));
                }
                s.setImage(rs.getString("image"));
                s.setStatus(rs.getString("description"));
                s.setCategoryId(rs.getInt("categoryId"));
                skillList.add(s);
            }

            try {
                ps.close();
            } catch (SQLException e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return skillList;
    }
    
    public ArrayList<Skill> getActiveSkillList() {

        ArrayList<Skill> skillList = new ArrayList<>();
        String query = "select * from skill where description = 'Active'";

        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Skill s = new Skill();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setContent(rs.getString("content"));
                if(s.getContent() != null && s.getContent().length() > 30) {
                    s.setContent(s.getContent().substring(30));
                }
                s.setImage(rs.getString("image"));
                s.setStatus(rs.getString("description"));
                skillList.add(s);
            }

            try {
                ps.close();
            } catch (SQLException e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return skillList;
    }

    public ArrayList<Skill> getTopSkill() {

        ArrayList<Skill> skillList = new ArrayList<>();
        String query = "select * from skill limit 4";

        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                skillList.add(new Skill(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getString("image"), 0));
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
        return skillList;
    }

    // Đưa Skill mới vào database
    public void createSkill(Skill skill) {
        String query = "INSERT INTO `skill`\n" +
"(" +
"`name`,\n" +
"`description`,\n" +
"`image`,\n" +
"`content`, `categoryId`)\n" +
"VALUES (?, ?, ?, ?, ?)";

        try {

            ps = con.prepareStatement(query);
            ps.setString(1, skill.getName());
            ps.setString(2, skill.getStatus());
            ps.setString(3, skill.getImage());
            ps.setString(4, skill.getContent());
            ps.setInt(5, skill.getCategoryId());
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

    // Cập nhật Skill theo id
    public void updateSkill(Skill skill) {
        String query = "update skill set name = ?, description=? ,image = ?, content=?, categoryId=? where id = ? ";

        try {

            ps = con.prepareStatement(query);
            ps.setString(1, skill.getName());
            ps.setString(2, skill.getStatus());
            ps.setString(3, skill.getImage());
            ps.setString(4, skill.getContent());
            ps.setInt(5, skill.getCategoryId());
            ps.setInt(6, skill.getId());
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

    public ArrayList<Skill> getSkillRequest(int id) {
        ArrayList<Skill> skillList = new ArrayList<>();
        String query = "SELECT s.id, s.name, s.description FROM skill s "
                + "inner join request_skill rs  "
                + "on s.id = rs.skill_id "
                + "inner join request r  "
                + "on rs.request_id = r.id "
                + "where r.id = (?) ";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                skillList.add(new Skill(rs.getInt("id"), rs.getString("name"), rs.getString("description")));
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
        return skillList;
    }

    public ArrayList<Skill> getSkillListByRequestId(int id) {
        ArrayList<Skill> skillList = new ArrayList<>();
        String query = "select * "
                + "from skill s "
                + "inner join request_skill rs "
                + "on rs.skill_id = s.id "
                + "inner join request r "
                + "on r.id = rs.request_id "
                + "where r.id = ?";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                skillList.add(new Skill(rs.getInt("id"), rs.getString("name"), rs.getString("description")));
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
        return skillList;
    }

    public ArrayList<Skill> getSkillHaveManyRequest() {
        ArrayList<Skill> skillList = new ArrayList<>();
        String query = "SELECT A.*, COUNT(B.ID) AS COUNT_REQUEST FROM skill A LEFT JOIN request_skill B\n"
                + "ON A.id = B.skill_id\n"
                + "GROUP BY A.id\n"
                + "ORDER BY COUNT_REQUEST DESC\n"
                + "LIMIT 4;";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                skillList.add(new Skill(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getString("image"), rs.getInt("COUNT_REQUEST")));
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
        return skillList;
    }

    public void updateStatus(String id, String status) {
         String query = "update skill set description = ? where id = ?";

        try {

            ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(id));
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
}
